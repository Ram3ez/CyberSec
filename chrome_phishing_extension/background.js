async function isPhishingLink(url) {
  // Use the deep learning model via its Gradio API.
  const apiUrl =
    "https://r1shab-second-review.hf.space/gradio_api/call/predict";

  try {
    // 1. POST request to submit the URL and get an event_id
    const postResponse = await fetch(apiUrl, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        data: [url],
      }),
    });
    const postData = await postResponse.json();
    const eventId = postData.event_id;

    if (!eventId) {
      return { isPhishing: false }; // Failed to get an event ID
    }

    // 2. GET request to retrieve the prediction
    const getResponse = await fetch(`${apiUrl}/${eventId}`);
    // The response is a stream (SSE), so we read it as text, not JSON.
    const responseText = await getResponse.text();

    // 3. Parse the result string
    const regex = /(PHISHING \(Malicious\))", "(\d+\.\d+%)/;
    const match = responseText.match(regex);

    if (match && match[1] === "PHISHING (Malicious)") {
      const confidence = match[2];
      console.log(
        `Phishing detected for URL: ${url} with confidence: ${confidence}`
      );
      return { isPhishing: true, confidence: confidence };
    }
  } catch (e) {
    console.error("Error calling phishing detection API:", e);
    // If the API call fails, we'll assume the link is safe to avoid blocking users.
    return { isPhishing: false };
  }

  return { isPhishing: false }; // Default to safe if no match
}

async function getWhoisInfo(domain) {
  const data = await chrome.storage.sync.get("whoisApiKey");
  const apiKey = data.whoisApiKey;

  if (!apiKey) {
    console.log("WHOIS API key not found. Skipping lookup.");
    return null;
  }

  const whoisApiUrl = `https://www.whoisjson.com/api/v1/whois?domain=${domain}`;

  try {
    const response = await fetch(whoisApiUrl, {
      headers: {
        Authorization: `TOKEN=${apiKey}`,
      },
    });

    if (!response.ok) {
      return null;
    }
    const data = await response.json();

    // If the API returns an error or can't find the domain, it will have an 'error' property.
    if (data.error) {
      return null;
    }

    const whoisInfo = {
      // The model shows the registrar name is in 'registrar.name'
      registrar: data.registrar?.name || data.registrar || "N/A",
      // The model uses 'created' and 'expires' for dates.
      // Also handle fallback to the other common names.
      created:
        data.created || data.created_date || data.creation_date
          ? new Date(
              data.created || data.created_date || data.creation_date
            ).toDateString()
          : "N/A",

      expires:
        data.expires || data.expires_date || data.expiration_date
          ? new Date(
              data.expires || data.expires_date || data.expiration_date
            ).toDateString()
          : "N/A",
    };

    return whoisInfo;
  } catch (e) {
    console.error("Error fetching WHOIS info:", e);
    return null;
  }
}

chrome.tabs.onUpdated.addListener(async (tabId, changeInfo, tab) => {
  // We only want to act when the page has finished loading
  if (
    changeInfo.status !== "complete" ||
    !tab.url ||
    !tab.url.startsWith("http")
  ) {
    return;
  }

  // First, check if the extension is enabled
  const storage = await chrome.storage.local.get({ isEnabled: true });
  if (!storage.isEnabled) {
    return; // Do nothing if disabled
  }

  // isPhishingLink is async, so we need to await its result.
  const domain = new URL(tab.url);
  const site = domain.protocol + "//" + domain.hostname;

  const result = await isPhishingLink(site);
  if (result.isPhishing) {
    // 1. Immediately send the warning to the user.
    chrome.tabs.sendMessage(
      tabId,
      {
        action: "showWarning",
        confidence: result.confidence,
        rdap: null, // Send null for now, it will be updated later.
      },
      () => {
        chrome.runtime.lastError; // Suppress error on pages where content scripts can't run
      }
    );

    // 2. Asynchronously fetch WHOIS info and send an update.

    //console.log(domain);
    getWhoisInfo(domain.hostname).then((whoisInfo) => {
      // If we got info, send a second message to update the dialog.
      if (whoisInfo) {
        chrome.tabs.sendMessage(
          tabId,
          { action: "updateWhois", rdap: whoisInfo },
          () => {
            chrome.runtime.lastError;
          }
        );
      }
    });
  }
});

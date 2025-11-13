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
  const result = await isPhishingLink(tab.url);
  if (result.isPhishing) {
    // Send a message to the content script in the tab to show the warning.
    chrome.tabs.sendMessage(
      tabId,
      { action: "showWarning", confidence: result.confidence },
      () => {
        chrome.runtime.lastError; // Suppress error on pages where content scripts can't run
      }
    );
  }
});

function showWarning(confidence, rdapInfo) {
  // Check if the warning already exists
  if (document.getElementById("phishing-warning-overlay")) {
    return;
  }

  const overlay = document.createElement("div");
  overlay.id = "phishing-warning-overlay";
  // Center the dialog on the page
  overlay.style.position = "fixed";
  overlay.style.top = "0";
  overlay.style.left = "0";
  overlay.style.width = "100%";
  overlay.style.height = "100%";
  overlay.style.backgroundColor = "rgba(0, 0, 0, 0.75)";
  overlay.style.zIndex = "2147483647"; // Max z-index
  overlay.style.display = "flex";
  overlay.style.justifyContent = "center";
  overlay.style.alignItems = "center";

  const dialog = document.createElement("div");
  dialog.id = "phishing-warning-dialog";
  // Style the dialog box
  dialog.style.backgroundColor = "#ffcccc";
  dialog.style.color = "#a00";
  dialog.style.padding = "30px";
  dialog.style.border = "2px solid #a00";
  dialog.style.borderRadius = "10px";
  dialog.style.textAlign = "center";
  dialog.style.maxWidth = "500px";
  dialog.style.boxShadow = "0 4px 8px rgba(0,0,0,0.2)";

  const title = document.createElement("h1");
  title.innerText = "Danger: Potential Phishing Site";
  title.style.color = "#a00";
  title.style.margin = "0 0 15px 0";

  const message = document.createElement("p");
  message.innerText =
    "This website is flagged as a potential phishing site. Proceed with extreme caution. Do not enter any personal information.";

  const confidenceMessage = document.createElement("p");
  confidenceMessage.style.marginTop = "10px";
  confidenceMessage.style.fontSize = "14px";
  confidenceMessage.style.fontWeight = "bold";
  confidenceMessage.innerText = `Model Confidence: ${confidence}`;

  const rdapContainer = document.createElement("div");
  rdapContainer.id = "phishing-warning-rdap"; // Add an ID for easy selection later
  rdapContainer.style.marginTop = "20px";
  rdapContainer.style.padding = "10px";
  rdapContainer.style.border = "1px solid #a00";
  rdapContainer.style.borderRadius = "5px";
  rdapContainer.style.textAlign = "left";
  rdapContainer.style.backgroundColor = "rgba(255, 255, 255, 0.2)";

  const rdapTitle = document.createElement("h4");
  rdapTitle.innerText = "Domain Information:";
  rdapTitle.style.margin = "0 0 10px 0";
  rdapTitle.style.color = "#a00";

  rdapContainer.appendChild(rdapTitle);

  if (rdapInfo) {
    rdapContainer.innerHTML += `<b>Registrar:</b> ${rdapInfo.registrar}<br>`;
    rdapContainer.innerHTML += `<b>Created:</b> ${rdapInfo.created}<br>`;
    rdapContainer.innerHTML += `<b>Expires:</b> ${rdapInfo.expires}`;
  } else {
    // Show a loading state initially
    rdapContainer.innerHTML += "<b>Loading domain information...</b>";
  }

  const dismissButton = document.createElement("button");
  dismissButton.id = "phishing-warning-dismiss";
  dismissButton.innerText = "I understand the risk, let me proceed";
  dismissButton.onclick = () => {
    overlay.remove();
  };
  // Style the button
  dismissButton.style.marginTop = "20px";
  dismissButton.style.padding = "10px 20px";
  dismissButton.style.border = "none";
  dismissButton.style.borderRadius = "5px";
  dismissButton.style.backgroundColor = "#a00";
  dismissButton.style.color = "white";
  dismissButton.style.cursor = "pointer";
  dismissButton.style.fontSize = "16px";

  dialog.appendChild(title);
  dialog.appendChild(message);
  dialog.appendChild(confidenceMessage);
  dialog.appendChild(rdapContainer);
  dialog.appendChild(dismissButton);
  overlay.appendChild(dialog);
  document.body.appendChild(overlay);
}

chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  if (request.action === "showWarning") {
    showWarning(request.confidence, request.rdap);
  } else if (request.action === "updateWhois") {
    const rdapContainer = document.getElementById("phishing-warning-rdap");
    if (rdapContainer) {
      // Clear the "Loading..." text.
      const title = rdapContainer.querySelector("h4");
      rdapContainer.innerHTML = ""; // Clear everything
      rdapContainer.appendChild(title); // Add title back

      const rdapInfo = request.rdap;
      if (rdapInfo) {
        rdapContainer.innerHTML += `<b>Registrar:</b> ${rdapInfo.registrar}<br>`;
        rdapContainer.innerHTML += `<b>Created:</b> ${rdapInfo.created}<br>`;
        rdapContainer.innerHTML += `<b>Expires:</b> ${rdapInfo.expires}`;
      } else {
        // If the update message was sent but the info is still null
        rdapContainer.innerHTML +=
          "Domain information could not be retrieved. This can happen with private or protected domains.";
      }
    }
  }
});

function showWarning(confidence) {
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
  dialog.appendChild(dismissButton);
  overlay.appendChild(dialog);
  document.body.appendChild(overlay);
}

chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  if (request.action === "showWarning") {
    showWarning(request.confidence);
  }
});

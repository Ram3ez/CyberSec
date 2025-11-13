document.addEventListener("DOMContentLoaded", () => {
  const apiKeyInput = document.getElementById("apiKey");
  const saveButton = document.getElementById("save");
  const statusDiv = document.getElementById("status");

  // Load the saved API key when the page opens
  chrome.storage.sync.get("whoisApiKey", (data) => {
    if (data.whoisApiKey) {
      apiKeyInput.value = data.whoisApiKey;
    }
  });

  // Save the API key when the button is clicked
  saveButton.addEventListener("click", () => {
    const apiKey = apiKeyInput.value;
    chrome.storage.sync.set({ whoisApiKey: apiKey }, () => {
      statusDiv.textContent = "Options saved.";
      statusDiv.style.color = "green";
      setTimeout(() => (statusDiv.textContent = ""), 2000);
    });
  });
});

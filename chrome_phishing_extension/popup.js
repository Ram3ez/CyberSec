document.addEventListener("DOMContentLoaded", () => {
  const enabledToggle = document.getElementById("enabledToggle");
  const statusDiv = document.getElementById("status");
  const switchLabel = document.querySelector(".switch-label");
  const optionsLink = document.getElementById("options-link");

  // Load the current state from storage and update the UI
  chrome.storage.local.get({ isEnabled: true }, (data) => {
    enabledToggle.checked = data.isEnabled;
    updateStatus(data.isEnabled);
  });

  // Listen for changes on the toggle switch
  enabledToggle.addEventListener("change", () => {
    const isEnabled = enabledToggle.checked;
    chrome.storage.local.set({ isEnabled: isEnabled }, () => {
      updateStatus(isEnabled);
    });
  });

  optionsLink.addEventListener("click", () => {
    chrome.runtime.openOptionsPage();
  });

  function updateStatus(isEnabled) {
    if (isEnabled) {
      statusDiv.textContent = "Your browsing is protected.";
      statusDiv.style.color = "green";
      switchLabel.textContent = "ON";
    } else {
      statusDiv.textContent = "Protection is disabled.";
      statusDiv.style.color = "red";
      switchLabel.textContent = "OFF";
    }
  }
});

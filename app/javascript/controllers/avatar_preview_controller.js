import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="avatar-preview"
export default class extends Controller {
  static targets = ["input", "preview"];

  connect() {
    this.previewTarget.style.display = "none"; // Hide preview on connect
  }

  displayPreview() {
    console.log("displayPreview was hit");
    const file = this.inputTarget.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        this.previewTarget.src = e.target.result; // Set preview image source
        this.previewTarget.style.display = "block"; // Show the image preview
      };
      reader.readAsDataURL(file); // Read the file as a data URL
    } else {
      this.previewTarget.src = "#";
      this.previewTarget.style.display = "none"; // Hide the image if no file is selected
    }
  }
}

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    flatpickr(this.inputTarget, {
      dateFormat: "Y-m-d", // Customize the format as needed
      // Add any other options here
    });
  }
}

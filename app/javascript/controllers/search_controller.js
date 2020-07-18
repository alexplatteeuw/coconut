import { Controller } from "stimulus"
import Rails from '@rails/ujs';

export default class extends Controller {

  static targets = ["name", "entries"]

  query() {

    Rails.ajax({
      type: 'GET',
      url : `${window.location.href}?q=${this.nameTarget.value}`,
      dataType: 'json',
      success: (data) => {
        setTimeout(() => {this.entriesTarget.innerHTML = data.html}, 200);
      }
    })
  }
}

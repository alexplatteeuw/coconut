import { Controller } from "stimulus"
import Rails from '@rails/ujs';

export default class extends Controller {

  static targets = ["name", "entries"]

  query() {

    Rails.ajax({
      type: 'GET',
      url : `/projects?q=${this.nameTarget.value}`,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.innerHTML = data.html
      }
    })
  }
}

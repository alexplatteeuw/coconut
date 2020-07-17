import Rails from '@rails/ujs';

import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["name", "entries"]

  query() {

    const element = this.nameTarget
    const name = element.value
    const url = `/projects?q=${name}`

    Rails.ajax({
      type: 'GET',
      url :url,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.innerHTML = data.html
      }
    })
  }
}

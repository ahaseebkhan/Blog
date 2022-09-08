import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "new", "edit", "preview" ]

  edit(event) {
    event.preventDefault()
    this.editTarget.classList.toggle("hidden")
    this.previewTarget.classList.toggle("hidden")
  }

  new(event) {
    event.preventDefault()
    this.newTarget.classList.toggle("hidden")
  }
}

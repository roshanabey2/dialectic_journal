import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messages", "notesPanel", "notesContent", "input"]

  connect() {
    this.checkForNotes()
  }

  sendMessage(event) {
    if (event.key === "Enter") {
      event.preventDefault()
      this.submitCurrentMessage()
    }
  }

  submitMessage(event) {
    event.preventDefault()
    this.submitCurrentMessage()
  }

  addMessage(role, content) {
    const messageElement = document.createElement("div")
    messageElement.classList.add("chat-message", `chat-message--${role}`)
    messageElement.textContent = content
    this.messagesTarget.appendChild(messageElement)
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }

  submitCurrentMessage() {
    const message = this.inputTarget.value.trim()
    if (message === "") return
    this.addMessage("user", message)
    this.inputTarget.value = ""
    this.fetchAgentResponse(message)
  }

  fetchAgentResponse(message) {
    fetch("/talker_agent/respond", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ message })
    })
    .then(response => response.json())
    .then(data => {
      this.addMessage("agent", data.response)
      if (data.notes) {
        this.showNotes(data.notes)
      } else {
        this.hideNotes()
      }
    })
  }

  showNotes(notesHtml) {
    this.notesContentTarget.innerHTML = notesHtml
    this.notesPanelTarget.hidden = false
  }

  hideNotes() {
    this.notesPanelTarget.hidden = true
  }

  checkForNotes() {
    if (this.notesContentTarget.innerHTML.trim() === "") {
      this.hideNotes()
    } else {
      this.notesPanelTarget.hidden = false
    }
  }
}

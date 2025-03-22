import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messages", "notesPanel", "notesContent"]

  connect() {
    this.checkForNotes()
  }

  sendMessage(event) {
    if (event.key === "Enter" && event.target.value.trim() !== "") {
      const message = event.target.value.trim()
      this.addMessage("user", message)
      event.target.value = ""
      this.fetchAgentResponse(message)
    }
  }

  addMessage(role, content) {
    const messageElement = document.createElement("div")
    messageElement.classList.add("chat-message")
    messageElement.textContent = content
    this.messagesTarget.appendChild(messageElement)
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
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

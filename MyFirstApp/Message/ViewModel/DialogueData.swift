import Foundation

class Dialogue: Identifiable, ObservableObject {
    @Published var messages: [Message]
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
        let allMessages: [Message] = decode("Messages.json")
        self.messages = []
        for message in allMessages {
            if message.contactId == contact.id {
                self.messages.append(message)
            }
        }
    }
    
    func update() {
        let allMessages: [Message] = decode("Messages.json")
        self.messages = []
        for message in allMessages {
            if message.contactId == contact.id {
                self.messages.append(message)
            }
        }
    }
}

class Dialogues: ObservableObject {
    @Published var dialogues: [Dialogue]
    
    init() {
        self.dialogues = []
        for contact in contacts {
            dialogues.append(Dialogue(contact: contact))
        }
    }
}

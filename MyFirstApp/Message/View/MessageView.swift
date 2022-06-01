import SwiftUI

struct MessageView: View {
    @EnvironmentObject var dialogue: Dialogue
    @State private var isDocumentPickerPresented = false
    @State private var isDocumentBrowserPresented = false
    @State private var inputText: String = ""
    
    var body: some View {
        ScrollView {
            ScrollViewReader { scrollView in
                VStack {
                    ForEach(dialogue.messages) { message in
                        BubbleView(message: message)
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarTitle(dialogue.contact.name, displayMode: .inline)
        
        
        HStack {
            Button {
                if !isDocumentPickerPresented {
                    isDocumentPickerPresented = true
                }
            } label: {
                Text("📂")
            }
            .buttonStyle(.bordered)
            .sheet(isPresented: $isDocumentPickerPresented) {
                DocumentPicker(forOpeningContentTypes: [.pdf, .jpeg]) { url in
                    let newMessage = Message(id: newMessageId(), text: url[0].absoluteString.components(separatedBy: "/").last ?? "Error", contactId: dialogue.contact.id, send: true, isFile: true, time: Date.now)
                    messages.append(newMessage)
                    save("Messages.json", ts: messages)
                    dialogue.update()
                }
            }
            
            TextField("New message here", text: $inputText)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                let newMessage = Message(id: newMessageId(), text: inputText, contactId: dialogue.contact.id, send: true, isFile: false, time: Date.now)
                messages.append(newMessage)
                save("Messages.json", ts: messages)
                dialogue.update()
                inputText = ""
            }) {
                Text("⬆")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var dialogues: Dialogues
    
    var body: some View {
        VStack {
            NavigationView {
                List(dialogues.dialogues) { dialogue in
                    NavigationLink {
                        MessageView().environmentObject(dialogue)
                    } label: {
                        ContactRowView().environmentObject(dialogue)
                    }
                }
                .navigationBarTitle("Contacts", displayMode: .inline)
            }
        }
    }
}

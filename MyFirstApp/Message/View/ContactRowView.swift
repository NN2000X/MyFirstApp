import SwiftUI

struct ContactRowView: View {
    @EnvironmentObject var dialogue: Dialogue
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 40))
            VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .center) {
                    Text(dialogue.contact.name)
                        .font(.headline)
                    Spacer()
                }
                if let preview = dialogue.messages.last?.text {
                    Text(preview)
                        .font(.callout)
                        .fontWeight(.light)
                        .lineLimit(1)
                }
            }
            if let preview = dialogue.messages.last?.time {
                Text(preview, style: .time)
                    .font(.callout)
            }
        }
        .padding(.vertical, 12)
    }
}

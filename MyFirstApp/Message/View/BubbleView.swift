import SwiftUI

struct BubbleView: View {
    var message: Message
    
    var body: some View {
        HStack {
            if message.send {
                Spacer()
            }
            
            if message.isFile {
                Button(action: {
                    share(items: [NSURL(fileURLWithPath: message.text)])
                }, label: {
                    Text(message.text)
                        .font(.body)
                        .foregroundColor(Color(message.send ? .white : .label))
                        .multilineTextAlignment(.leading)
                })
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(message.send ? .blue : .secondarySystemBackground))
                .cornerRadius(16)
            } else {
                Text(message.text)
                    .font(.body)
                    .foregroundColor(Color(message.send ? .white : .label))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color(message.send ? .blue : .secondarySystemBackground))
                    .cornerRadius(16)
            }
            
            if !message.send {
                Spacer()
            }
        }
    }
}

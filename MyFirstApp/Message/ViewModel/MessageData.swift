import Foundation
import SwiftUI

var messages: [Message] = decode("Messages.json")

func newMessageId() -> String {
    let messages: [Message] = decode("Messages.json")
    var currentMaxId = 0
    for message in messages {
        if Int(message.id)! > currentMaxId {
            currentMaxId = Int(message.id)!
        }
    }
    return String(currentMaxId + 1)
}

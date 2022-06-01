import Foundation

struct Message: Codable, Identifiable {
    var id: String
    var text: String
    var contactId: String
    // positive for sending / negative for receiving
    var send: Bool
    var isFile: Bool
    // send time / receive time
    var time: Date
}

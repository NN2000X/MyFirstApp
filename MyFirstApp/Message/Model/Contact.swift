import Foundation
import SwiftUI

struct Contact: Codable, Identifiable {
    var id: String
    var name: String
    var address: String
}

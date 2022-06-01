import Foundation
import Photos

enum ClockFunction: String, CaseIterable, Identifiable {
    case alarm = "Alarm"
    case stopwatch = "Stopwatch"
    
    var id: String { self.rawValue }
}

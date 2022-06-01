import Foundation
import PhotosUI

class Stopwatch: ObservableObject {
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.secondsElapsed += 0.01
        }
    }
    
    func stop() {
        timer.invalidate()
    }
}

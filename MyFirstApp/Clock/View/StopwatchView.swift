import SwiftUI

struct StopwatchView: View {
    @StateObject var stopwatch = Stopwatch()
    @State var started: Bool = false
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", stopwatch.secondsElapsed))
                .font(.custom("Avenir", size: 50))
                .padding(.vertical, 100)
            
            Button(action: {
                if !started {
                    stopwatch.secondsElapsed = 0
                    stopwatch.start()
                } else {
                    stopwatch.stop()
                }
                started = !started
            }, label: {
                Text(!started ? "Initiate" : "Stop")
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 90)
                    .background(.blue)
                    .cornerRadius(10)
            })
        }
    }
}

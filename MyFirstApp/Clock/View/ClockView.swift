import SwiftUI

struct ClockView: View {
    @State private var selectedClockFunction = ClockFunction.alarm
    
    var body: some View {
        ScrollView {
            Picker("ClockFunction", selection: $selectedClockFunction) {
                ForEach(ClockFunction.allCases) { clockFunction in
                    Text(clockFunction.rawValue).tag(clockFunction)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Menu {
                Button(action: {selectedClockFunction = ClockFunction.alarm}, label: {Text("Alarm")})
                Button(action: {selectedClockFunction = ClockFunction.stopwatch}, label: {Text("Stopwatch")})
            } label: {
                Label("Or Select from a Menu", systemImage: "menubar.arrow.down.rectangle")
            }
            .padding()
            
            Spacer()
            
            switch selectedClockFunction {
            case .alarm:
                AlarmView()
                    .padding()
            case .stopwatch:
                StopwatchView()
            }
        }
    }
}

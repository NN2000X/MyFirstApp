import SwiftUI

struct AlarmView: View {
    @State private var transparency = 0.0
    @State private var selectedTime = Date()
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "alarm")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .brightness(transparency)
            Slider(value: $transparency, in: 0...1)
            Text("Image Transparentcy")
            
            DatePicker(
                "Alarm Time",
                selection: $selectedTime,
                displayedComponents: [.date, .hourAndMinute]
            )
            
            Toggle(isOn: $isOn) {
                Text("Alarm Switch")
            }
        }
    }
}

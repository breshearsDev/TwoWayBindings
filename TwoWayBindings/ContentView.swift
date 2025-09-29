//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Breshears, Rob - CTC on 9/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pressCount: Int = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate: Date = Date()
    @State private var stepperValue = 1
    @State private var sliderValue = 50.0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Press Count: \(pressCount)")
            
            Button("Press Me") {
                pressCount += 1
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            TextField("Enter a name", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Name entered: \(name)")
            
            Spacer()
            
            Toggle("Toggle is \(toggleIsOn ? "On" : "Off"): ", isOn: $toggleIsOn)
            Spacer()
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            ColorPicker("Pick a Rectangle Color: ", selection: $selectedColor)
            
            Spacer()
            
            DatePicker("Date: ", selection: $selectedDate)
            Text("Selected Date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            Spacer()
            
            Stepper("Stepper Value: \(stepperValue)", value: $stepperValue, in: 1...10)
            
            Spacer()
            
            
            Slider(value: $sliderValue, in: 0...100) {
                //
            } minimumValueLabel: {
                Image(systemName: "speaker.minus")
                
            } maximumValueLabel: {
                Image(systemName: "speaker.plus")
            }
        
            Text("Slider value: \(Int(sliderValue))")
            Text("Slider value: \(sliderValue.formatted(.number.precision(.fractionLength(2))))")
            Text("Slider value: \(String(format: "%.2f", sliderValue))")
            
            Spacer()
        }
        .font(.title2)
        .padding()
        
    }
}

#Preview {
    ContentView()
}

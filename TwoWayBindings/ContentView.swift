//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Hailey Stewart on 2/5/23.
//

import SwiftUI


struct ContentView: View {
    @State private var count=0 //State variables are tucked away and remain as the rest of the view is reconstructed
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    
    var body: some View {
        VStack {
            Group{
                Text("Pressed Count: \(count)")
                Button("Press Me"){
                    count += 1
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                TextField("Enter a name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Text("Name entered: \(name)")
                
                Spacer()
                
                Toggle("Toggle is \(toggleIsOn ? "on" : "off"): ", isOn: $toggleIsOn)
                
                Spacer()
            }
            Rectangle()
                .fill(selectedColor)
                .frame(width:100, height: 100)
            ColorPicker("Pick a rectangle color:", selection: $selectedColor)
            
            Spacer()
            
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected Date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            
            Spacer()
            
            Stepper("Stepper value: \(stepperValue)", value: $stepperValue, in: 1...10)
            
            Spacer()
        }
        .font(.title2)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  BasicViews
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct ContentView: View {
    
    // State variables for TextField, Picker, Toggle, Slider, and Stepper
    @State private var name: String = ""
    @State private var selectedOption = 0
    @State private var isToggleOn = false
    @State private var sliderValue: Double = 0.5
    @State private var stepperValue = 0
    @State private var selectedDate = Date()
    
    // Options for Picker
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // MARK: - Text Views
                VStack(spacing: 15) {
                    Text("Basic SwiftUI Views")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Hello, SwiftUI!")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                
                Divider()
                
                // MARK: - Image Views
                VStack(spacing: 15) {
                    Text("Image View")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                }
                
                Divider()
                
                // MARK: - Form Elements
                VStack(spacing: 15) {
                    Text("Form Elements")
                        .font(.headline)
                    
                    // TextField
                    TextField("Enter your name", text: $name)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Picker
                    Picker("Choose an option", selection: $selectedOption) {
                        ForEach(0..<options.count) { index in
                            Text(options[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Divider()
                
                // MARK: - Interactive Views
                VStack(spacing: 15) {
                    Text("Interactive Elements")
                        .font(.headline)
                    
                    // Toggle
                    Toggle(isOn: $isToggleOn) {
                        Text("Toggle Switch")
                    }
                    .padding()
                    
                    // Slider
                    Slider(value: $sliderValue, in: 0...1)
                        .padding()
                    
                    Text("Slider Value: \(sliderValue, specifier: "%.2f")")
                    
                    // Stepper
                    Stepper("Stepper Value: \(stepperValue)", value: $stepperValue, in: 0...10)
                        .padding()
                }
                
                Divider()
                
                // MARK: - Date and Progress Views
                VStack(spacing: 15) {
                    Text("Date and Progress Views")
                        .font(.headline)
                    
                    // DatePicker
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                        .padding()
                    
                    Text("Selected Date: \(selectedDate, style: .date)")
                    
                    // ProgressView
                    ProgressView(value: sliderValue)
                        .padding()
                }
                
                Divider()
                
                // MARK: - Buttons
                VStack(spacing: 15) {
                    Text("Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            print("Button 1 pressed")
                        }) {
                            Text("Button 1")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            print("Button 2 pressed")
                        }) {
                            Text("Button 2")
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                
                // Spacer to push content up
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

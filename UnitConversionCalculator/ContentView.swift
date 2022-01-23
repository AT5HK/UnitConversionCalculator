//
//  ContentView.swift
//  UnitConversionCalculator
//
//  Created by auston salvana on 1/23/22.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0.0
    @State private var unitSelection: String = "M"
    @State private var unitConversionSelection: String = "M"
    @FocusState private var textFieldFocused: Bool
    
    private let units = ["KM", "M", "FT", "YD", "MI"]
    
    private var convertedValue: Double {
        
        //convert unit to feet
        var feet = 0.0
        switch unitSelection {
        case "KM":
            feet = number * 3280.84
        case "M":
            feet = number * 3.28084
        case "FT":
            feet = number * 1
        case "YD":
            feet = number * 3
        case "MI":
            feet = number * 5280
        default:
            print("default something went wrong")
        }
        
        var finalNumber = 0.0
        switch unitConversionSelection {
        case "KM":
            finalNumber = feet * 0.0003048
        case "M":
            finalNumber = feet * 0.3048
        case "FT":
            finalNumber = feet * 1
        case "YD":
            finalNumber = feet * 0.333333
        case "MI":
            finalNumber = feet * 0.000189394
        default:
            print("default something went wrong")
        }
        
        return finalNumber
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("the number", value: $number, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($textFieldFocused)
                }
                
                Section {
                    Picker("units", selection: $unitSelection) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("pick a unit")
                }
                
                Section {
                    Picker("units", selection: $unitConversionSelection) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("pick a unit to convert to")
                }
                
                Section {
                    Text(convertedValue, format: .number)
                } header: {
                    Text("\(unitSelection) to \(unitConversionSelection)")
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        textFieldFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

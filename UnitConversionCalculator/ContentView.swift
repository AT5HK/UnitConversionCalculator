//
//  ContentView.swift
//  UnitConversionCalculator
//
//  Created by auston salvana on 1/23/22.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0.0
    @State private var unitSelection: Units = .feet
    @State private var unitConversionSelection: Units = .feet
    @FocusState private var textFieldFocused: Bool
    
    private let units = Units.allCases
    
    private var convertedValue: Double {
        
        //convert unit to feet
        var feet = 0.0
        switch unitSelection {
        case .kilometers:
            feet = number * 3280.84
        case .meters:
            feet = number * 3.28084
        case .feet:
            feet = number * 1
        case .yards:
            feet = number * 3
        case .miles:
            feet = number * 5280
        }
        
        var finalNumber = 0.0
        switch unitConversionSelection {
        case .kilometers:
            finalNumber = feet * 0.0003048
        case .meters:
            finalNumber = feet * 0.3048
        case .feet:
            finalNumber = feet * 1
        case .yards:
            finalNumber = feet * 0.333333
        case .miles:
            finalNumber = feet * 0.000189394
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
                            Text(unit.prefix)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("pick a unit")
                }
                
                Section {
                    Picker("units", selection: $unitConversionSelection) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit.prefix)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("pick a unit to convert to")
                }
                
                Section {
                    Text(convertedValue, format: .number)
                } header: {
                    Text("\(unitSelection.rawValue) to \(unitConversionSelection.rawValue)")
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

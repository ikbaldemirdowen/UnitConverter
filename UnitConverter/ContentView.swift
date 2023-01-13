//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ikbal Demirdoven on 2023-01-13.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedInput = "Celsius"
    @State private var selectedOutput = "Fahrenheit"
    @State private var temperatureInputAmount = 0.0
    private var result : Double
    {
        var resultTemperature = 0.0
        if selectedInput == "Celsius" && selectedOutput == "Fahrenheit"
        {
            resultTemperature = (temperatureInputAmount * 1.8) + 32
        }
        else if selectedInput == "Celsius" && selectedOutput == "Kelvin"
        {
            resultTemperature = temperatureInputAmount - 273.15
        }
        else if selectedInput == "Fahrenheit" && selectedOutput == "Celsius"
        {
            resultTemperature = (temperatureInputAmount - 32) / 1.8
        }
        else if selectedInput == "Fahrenheit" && selectedOutput == "Kelvin"
        {
            resultTemperature = ((temperatureInputAmount + 459.67) * 5) / 9
        }
        else if selectedInput == "Kelvin" && selectedOutput == "Celsius"
        {
            resultTemperature = temperatureInputAmount + 273.15
        }
        else if selectedInput == "Kelvin" && selectedOutput == "Fahrenheit"
        {
            resultTemperature = 9 / 5 * (temperatureInputAmount - 273) + 32
        }
        return resultTemperature
    }
    
    var body: some View {
        NavigationView
        {
            Form
            {
                Section
                {
                    Picker("Please, choose the input unit.", selection: $selectedInput)
                    {
                        ForEach(temperatures, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section
                {
                    Picker("Please, choose the output unit.", selection: $selectedOutput)
                    {
                        ForEach(temperatures, id: \.self)
                        {
                            Text($0)
                        }
                        
                    }
                    .pickerStyle(.menu)
                }
                
                Section
                {
                    TextField("Please, enter the amount.", value : $temperatureInputAmount, format: .number)
                } header: {
                    Text("Please, enter the temperature amount.")
                }
                
                Section
                {
                    Text(result, format : .number)
                } header: {
                    Text("Here is the converted result.")
                }
            }
            .navigationTitle("Unit Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

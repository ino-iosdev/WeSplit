//
//  ContentView.swift
//  WeSplit
//
//  Created by Ino Yang Popper on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var totalPerPerson: Double {
        grandTotal / Double(numberOfPeople + 2)
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount * tipSelection / 100
        return checkAmount + tipValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: localCurrency))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                }
                
                Section("Total amount") {
                    Text(grandTotal, format: .currency(code: localCurrency))
                        .foregroundStyle(tipPercentage == 0 ?.red:.primary)
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: localCurrency))
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

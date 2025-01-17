//
//  ContentView.swift
//  WeSplit
//
//  Created by Ino Yang Popper on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello Jeff!")
                }
                Section {
                    Text("Hello Jeff!")
                    Text("Hello Jeff!")
                }
                Section {
                    Text("Hello Jeff!")
                    Text("Hello Jeff!")
                    Text("Hello Jeff!")
                }
            }
            .navigationTitle("Greeting to Jeff")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

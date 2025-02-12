//
//  ContentView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var climbs = ClimbModel.load()
    var body: some View {
        TabView {
            Tab("Warmup", systemImage: "figure.strengthtraining.functional") {
                
            }
            Tab("Workout", systemImage: "figure.climbing") {
                WorkoutView(climbs: $climbs)
            }
            Tab("Log", systemImage: "book.pages") {
                LogView(climbs: $climbs)
            }
        }
    }
}

#Preview {
    ContentView()
}

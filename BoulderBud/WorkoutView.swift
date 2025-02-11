//
//  WorkoutView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import SwiftUI

enum WorkoutType: String, CaseIterable {
    case simple = "Simple"
    case detailed = "Detailed"
}

struct WorkoutView: View {
    @State var selectedType: WorkoutType = .simple
    @State var climb: Climb = .init()
    @Binding var climbs: [Climb]
    var body: some View {
        VStack {
            Text("Log a Workout").font(.largeTitle)
            Picker("Type", selection: $selectedType) {
                ForEach(WorkoutType.allCases, id: \.self) { workout in
                    Text(workout.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            if selectedType == .simple {
                SimpleWorkoutView(climb: $climb)
            } else {
                DetailedWorkoutView(climb: $climb)
            }
            Button("Save") {
                climbs.append(climb)
                ClimbModel.save(climbs)
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    WorkoutView(climbs: .constant([]))
}

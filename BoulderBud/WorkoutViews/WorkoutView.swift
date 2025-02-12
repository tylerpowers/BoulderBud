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
    @State var saved = false
    @State var selectedType: WorkoutType = .simple
    @State var climb: Climb = .init()
    @Binding var climbs: [Climb]
    var body: some View {
        NavigationStack {
            VStack {
                Text("Log a Workout")
                    .font(.system(size: 50, weight:.bold))
                    .padding()
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
                NavigationLink(destination: LogView(climbs: $climbs)) {
                    Button("Save") {
                        climbs.append(climb)
                        ClimbModel.save(climbs)
                        climb = .init()
                        saved.toggle()
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                }
            }
        }.sheet(isPresented: $saved) {
            Text("Saved!")
                .presentationDetents([.height(100)])
                .frame(width: 600, height: 100)
                .font(.system(size: 50, weight: .bold))
                .foregroundStyle(.white)
                .background(Color.green)
                .padding()
            
        }
    }
}

#Preview {
    WorkoutView(climbs: .constant([]))
}

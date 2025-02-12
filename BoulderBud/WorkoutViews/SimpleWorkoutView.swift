//
//  SimpleWorkoutView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import SwiftUI

struct SimpleWorkoutView: View {
    @Binding var climb: Climb
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $climb.name)
                Picker("Grade", selection: $climb.grade) {
                    ForEach(0..<11) {
                        Text("V\($0)")
                    }
                }
                HStack {
                    Text("Completeness: ")
                    Spacer()
                    if climb.completeness == 100 {
                        Text("Finished!")
                    }
                    else if climb.completeness == 0 {
                        Text("Not Started")
                    }
                    else {
                        Text("\(Int(climb.completeness))% Complete")
                    }
                }
                Slider(
                    value: $climb.completeness,
                    in: 0...100,
                    step: 5
                ) {
                } minimumValueLabel: {
                    Text("0%")
                } maximumValueLabel: {
                    Text("100%")
                }
            }
            Section {
                TextField("Notes", text: $climb.description, axis: .vertical)
                    .lineLimit(5, reservesSpace: true)
            }
        }
    }
}

#Preview {
    SimpleWorkoutView(climb: .constant(.init()))
}

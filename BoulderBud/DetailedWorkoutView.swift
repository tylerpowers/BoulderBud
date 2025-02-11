//
//  DetailedWorkoutView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import SwiftUI

struct DetailedWorkoutView: View {
    @Binding var climb: Climb
    @State var isEditing: Bool = false
    
    var body: some View {
        Form {
            Section("Basic Info") {
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
            
            Section("Hold Types") {
                ForEach(0..<4) { hold in
                    Toggle(holdNames[hold], isOn: $climb.holds[hold])
                }
            }
            
            Section("Features") {
                Picker("Incline", selection: $climb.incline) {
                    ForEach(Incline.allCases) { incline in
                        Text(incline.rawValue)
                    }
                }
                ForEach(0..<4) { feature in
                    Toggle(featureNames[feature], isOn: $climb.features[feature])
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
    DetailedWorkoutView(climb: .constant(.init()))
}

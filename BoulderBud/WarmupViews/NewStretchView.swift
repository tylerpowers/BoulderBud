//
//  NewStretchView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/22/25.
//

import SwiftUI

struct NewStretchView: View {
    @Binding var stretches: [Stretch]
    @Binding var stretch: Stretch
    var isEditing: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form {
            TextField("Name", text: $stretch.name)
            TextField("Description", text: $stretch.desc, axis: .vertical)
                .lineLimit(5, reservesSpace: true)
            HStack {
                Text("Duration:")
                Spacer()
                Text("\(Int(stretch.duration)) seconds")
            }
            Slider(
                value: $stretch.duration,
                in: 5...120,
                step: 5) {
                } minimumValueLabel: {
                    Text("5 sec")
                } maximumValueLabel: {
                    Text("120 sec")
                }
            Button("Submit") {
                if !isEditing {
                    stretches.append(stretch)
                }
                dismiss()
            }
        }.onDisappear() {
            StretchModel.save(stretches)
        }
    }
}

#Preview {
    NewStretchView(stretches: .constant([Stretch]()), stretch: .constant(Stretch(name: "", desc: "")), isEditing: false)
}

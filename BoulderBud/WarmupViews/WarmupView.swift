//
//  WarmupView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/21/25.
//

import SwiftUI

struct WarmupView: View {
    @State var stretches: [Stretch] = StretchModel.load()
    @State var stretch = Stretch(name: "", desc: "")
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    Text("Your Stretches")
                        .font(.system(size: 50, weight: .bold))
                        .padding()
                    List {
                        Text("Today's Stretches:")
                            .fontWeight(.bold)
                        ForEach($stretches) { $currentStretch in
                            NavigationLink {
                                NewStretchView(stretches: $stretches, stretch: $currentStretch, isEditing: true)
                            } label: {
                                Text(currentStretch.name)
                            }
                        }
                        .onMove { from, to in
                            self.stretches.move(fromOffsets: from, toOffset: to)
                        }
                        .onDelete { offsets in
                            self.stretches.remove(atOffsets: offsets)
                        }
                    }
                    NavigationLink (destination: ActiveStretchView(stretches: $stretches, timeRemaining: Int(stretches[0].duration), index: 0)) {
                        Text("Begin Warmup")
                            .padding()
                    }
                }
                .toolbar() {
                    ToolbarItem(placement: .cancellationAction) {
                        NavigationLink(destination: NewStretchView(stretches: $stretches, stretch: $stretch, isEditing: false)) {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .primaryAction) {
                        EditButton()
                    }
                }
                Spacer()
            }
        }
        .onAppear() {
            stretches = StretchModel.load()
        }
    }
}

#Preview {
    WarmupView(stretches: [Stretch(name: "Lunge", desc: "Lunge blajfjdalkfj"),
                           Stretch(name: "Squat", desc: "Squat blajfjdalkfj")])
}

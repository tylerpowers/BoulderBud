//
//  LogView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import SwiftUI

struct LogView: View {
    @Binding var climbs: [Climb]
    
    func removeItems(at offsets: IndexSet) {
        climbs.remove(atOffsets: offsets)
        ClimbModel.save(climbs)
    }
    
    var body: some View {
        VStack {
            Text("Logged Climbs")
                .font(.system(size: 50, weight:.bold))
                .padding()
            NavigationStack {
                List {
                    ForEach(climbs) { climb in
                        NavigationLink {
                            ClimbReportView(climb: climb)
                        } label: {
                            ClimbReportShortView(climb: climb)
                        }
                    }.onDelete(perform: removeItems)
                }
            }
            .overlay{
                if climbs.isEmpty {
                    ContentUnavailableView {
                        Label("No climbs yet!", systemImage: "book.pages")
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var climbs: [Climb] = [
        Climb(name: "Test Climb", grade: 4),
        Climb(name: "Another Test Climb", grade: 5)
    ]
    LogView(climbs: $climbs)
}

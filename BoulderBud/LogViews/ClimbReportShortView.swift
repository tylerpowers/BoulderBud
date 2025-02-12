//
//  ClimbReportShortView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import SwiftUI




struct ClimbReportShortView: View {
    var climb: Climb
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("\(climb.name), V\(climb.grade)").font(.headline)
                Text(climb.getDateFormat(false))
            }
            Spacer()
        }
        
    }
}

#Preview {
    ClimbReportShortView(climb: Climb(name: "Fun Climb", grade: 3))
}

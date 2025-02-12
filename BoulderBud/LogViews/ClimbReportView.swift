//
//  ClimbReportView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import SwiftUI



struct ProgressView: View {
    var grade: Int
    var incline: Incline
    var completeness: Double
    var body: some View {
        ZStack {
            VStack {
                Text("V\(grade)")
                    .font(.system(size: 75, weight: .bold))
                if incline != .normal {
                    Text(incline.rawValue.uppercased()).font(.system(size: 20, weight: .light))
                }
            }
            Circle()
                .stroke(Color.accentColor, lineWidth: 25)
                .frame(width: 250)
                .opacity(0.25)
            Circle()
                .trim(from: 0, to: completeness * 0.01)
                .stroke(Color.accentColor,
                        style: StrokeStyle (lineWidth: 25, lineCap: .round))
                .frame(width: 250)
                .rotationEffect(Angle(degrees: 270))
                
        }
    }
}

struct ClimbReportView: View {
    var climb: Climb
    var body: some View {
        VStack {
            ProgressView(grade: climb.grade, incline: climb.incline, completeness: climb.completeness)
                .padding()
            Text(climb.getFeedback())
                .italic()
            List {
                Section {
                    Text("Name: \(climb.name)").bold()
                    Text("Date: \(climb.getDateFormat(true))")
                    Text(climb.getDetails(true))
                    Text(climb.getDetails(false))
                }
                Text("Your notes:\n\(climb.description)")
            }
        }
    }
}

#Preview {
    ClimbReportView(climb: Climb(name: "Fun Climb", grade: 3, completeness: 50.0, holds: [true, false, false, false], incline: .normal))
}

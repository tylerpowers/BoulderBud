//
//  ActiveStretchView.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/22/25.
//

import SwiftUI

struct TimerView: View {
    @Binding var timeRemaining: Int
    var initialTime: Double
    var body: some View {
        ZStack {
            Text(timeRemaining.description)
                .font(.system(size: 50, weight: .bold))
            Circle()
                .stroke(Color.accentColor, lineWidth: 25)
                .frame(width: 250)
                .opacity(0.25)
            Circle()
                .trim(from: 0, to: CGFloat(Double(timeRemaining) / initialTime))
                .stroke(Color.accentColor,
                        style: StrokeStyle (lineWidth: 25, lineCap: .round))
                .frame(width: 250)
                .rotationEffect(Angle(degrees: 270))
                
        }
        .padding()
    }
}

struct ActiveStretchView: View {
    @Binding var stretches: [Stretch]
    @State var timeRemaining: Int
    @Environment(\.dismiss) var dismiss
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var index: Int
    
    var body: some View {
        let currentStretch = stretches[index]
        NavigationStack {
            VStack {
                TimerView(timeRemaining: $timeRemaining, initialTime: currentStretch.duration)
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                    }
                Spacer()
                Text(currentStretch.name)
                    .font(.system(size: 50, weight: .bold))
                    .padding()
                Text(currentStretch.desc)
                    .italic()
                    .padding()
                Spacer()
                HStack {
                    Button("< Back") {
                        dismiss()
                    }
                    Spacer()
                    NavigationLink(destination: WarmupView().navigationBarBackButtonHidden(true)) {
                        Text("Done")
                            .padding()
                            .background(.tint)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    if index != stretches.count - 1 {
                        Spacer()
                        NavigationLink(destination: ActiveStretchView(stretches: $stretches, timeRemaining: Int(stretches[index+1].duration), index: index + 1)) {
                            Text("Next >")
                        }
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    @Previewable @State var stretches: [Stretch] = [
        Stretch(name: "Lunge", desc: "description"),
        Stretch(name: "Squat", desc: "description")
    ]
    ActiveStretchView(stretches: $stretches, timeRemaining: Int(stretches[0].duration), index: 0)
}

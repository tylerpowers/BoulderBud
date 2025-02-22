//
//  Stretch.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/21/25.
//

import Foundation

struct Stretch: Codable, Identifiable {
    var id = UUID()
    var name: String
    var desc: String
    var duration = 30.0
    
    func getDuration() -> Int {
        return Int(duration)
    }
}

//
//  File.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import Foundation

enum Incline: String, CaseIterable, Identifiable, Codable {
    var id: Self {self}
    case slab = "Slab"
    case normal = "Normal"
    case cave = "Cave"
}


let holdNames = ["Pinches", "Slopers", "Pockets", "Underclings"]
let featureNames = ["Heelhooks", "Toehooks", "Smears", "Bat-hangs"]

struct Climb: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var grade: Int = 0
    var description: String = ""
    var completeness: Double = 0
    var holds = [false, false, false, false]
    
    var features = [false, false, false, false]
    var incline: Incline = .normal
    var john = false
}

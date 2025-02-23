//
//  File.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import Foundation

let holdNames = ["Pinches", "Slopers", "Pockets", "Underclings"]
let featureNames = ["Heelhooks", "Toehooks", "Smears", "Bat-hangs"]


enum Incline: String, CaseIterable, Identifiable, Codable {
    var id: Self {self}
    case slab = "Slab"
    case normal = "Normal"
    case cave = "Cave"
}

struct Climb: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String = ""
    var grade: Int = 0
    var description: String = ""
    var completeness: Double = 0
    var holds = [false, false, false, false]
    var features = [false, false, false, false]
    var incline: Incline = .normal
    var date: Date = Date()
    
    func getFeedback() -> String {
        if completeness < 0.25 {
            return "Working on it!"
        }
        else if completeness < 0.5 {
            return "Getting there!"
        }
        else if completeness < 0.75 {
            return "Almost there! Send it!"
        }
        else {
            return "Nice!"
        }
    }
    
    func getDateFormat(_ long: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = long ? .medium : .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: date)
    }

    func getDetails(_ isHolds: Bool) -> String {
        let details = isHolds ? holds : features
        let detailNames = isHolds ? holdNames : featureNames
        let emptyString = isHolds ? "No unique holds used" : "No unique features"
        let fullString = isHolds ? "Holds used: " : "Notable features: "
        var isFirst = true
        var enabledDetails = ""
        for index in 0..<details.count {
            if isFirst && details[index] {
                enabledDetails = fullString + detailNames[index]
                isFirst = false
            }
            else if details[index] {
                enabledDetails.append(", " + detailNames[index])
            }
        }
        return enabledDetails.isEmpty ? emptyString : enabledDetails
    }
    
}

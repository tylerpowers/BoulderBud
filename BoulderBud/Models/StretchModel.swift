//
//  ClimbModel.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import Foundation

struct StretchModel {
    
    static private func fileURL() -> URL? {
        let manager = FileManager.default
        let documentsDirectory = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return documentsDirectory?.appendingPathComponent("stretches.json")
    }
    
    static public func save(_ stretches: [Stretch]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(stretches)
            if let fileURL = fileURL() {
                try data.write(to: fileURL, options: [.completeFileProtection, .atomic])
            }
        }
        catch {
            print("Unable to save data. \(error)")
        }
    }
    
    static public func load() -> [Stretch] {
        let decoder = JSONDecoder()
        if let fileURL = fileURL(),
           let data = try? Data(contentsOf: fileURL),
           let loadedStretches = try? decoder.decode([Stretch].self, from: data) {
            return loadedStretches
        }
        return [
            Stretch(name: "Lunge", desc: "Kneel down and feel the stretch in your hamstring"),
            Stretch(name: "Calf Stretch", desc: "Balance using a wall and push your heel towards the ground"),
            Stretch(name: "Arm Circles", desc: "You can tell from the name. Don't do these for too long")
        ]
    }
}

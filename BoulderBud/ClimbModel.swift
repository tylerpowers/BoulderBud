//
//  ClimbModel.swift
//  BoulderBud
//
//  Created by Tyler Powers on 2/11/25.
//

import Foundation

struct ClimbModel {
    
    static private func fileURL() -> URL? {
        let manager = FileManager.default
        let documentsDirectory = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return documentsDirectory?.appendingPathComponent("climbs.json")
    }
    
    static public func save(_ climbs: [Climb]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(climbs)
            if let fileURL = fileURL() {
                try data.write(to: fileURL, options: [.completeFileProtection, .atomic])
            }
        }
        catch {
            print("Unable to save data. \(error)")
        }
    }
    
    static public func load() -> [Climb] {
        let decoder = JSONDecoder()
        if let fileURL = fileURL(),
           let data = try? Data(contentsOf: fileURL),
           let loadedClimbs = try? decoder.decode([Climb].self, from: data) {
            return loadedClimbs
        }
        return [Climb]()
    }
}

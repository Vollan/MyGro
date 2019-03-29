//
//  DetailSeed.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-28.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import Foundation

public struct DetailSeed {
    
    public let id: Int
    public let name: String
    public let image: URL
    public let description: String
    public let gardeningTricks: String
    public let facts: SeedFact
    
    public init?(withDictionary dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
            let name = dict["name"] as? String,
            let image = (dict["picture"] as? String)?.url,
            let description = dict["description"] as? String,
            let gardeningTricks = dict["gardening_tricks"] as? String,
            let factsDict = dict["facts"] as? [String: Any],
            let facts = SeedFact(withDictionary: factsDict) else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.image = image
        self.description = description
        self.gardeningTricks = gardeningTricks
        self.facts = facts
    }
}

public struct SeedFact {
    
    public let type: String
    public let height: String
    public let position: String
    public let time: String
    public let depth: String
    public let flowerDistance: String
    public let rowDistance: String
    public let harvestTime: String
    
    public init?(withDictionary dict: [String: Any]) {
        guard let type = dict["type"] as? String,
            let height = dict["height"] as? String,
            let position = dict["position"] as? String,
            let time = dict["time"] as? String,
            let depth = dict["depth"] as? String,
            let flowerDistance = dict["flower_distance"] as? String,
            let rowDistance = dict["row_distance"] as? String,
            let harvestTime = dict["harvest_time"] as? String else {
                return nil
        }
        
        self.type = type
        self.height = height
        self.position = position
        self.time = time
        self.depth = depth
        self.flowerDistance = flowerDistance
        self.rowDistance = rowDistance
        self.harvestTime = harvestTime
        
    }
}

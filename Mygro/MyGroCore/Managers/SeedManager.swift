//
//  SeedManager.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-13.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import Foundation

class SeedManager {
    
    var fetchedMainSeed: (([Seed]) -> ())?
    var fetchDetailSeed: (([DetailSeed]) -> ())?
    
    public func getSeedForMain(withId id: Int) {
        if let object = ReadFile.getContentOfFile(named: "MainSeedApelsin") {
            guard let seeds = (object["Seeds"] as? [[String: Any]])?.flatMap({Seed(withDictionary: $0)}) else {
                return
            }
            self.fetchedMainSeed?(seeds)
        }
    }
    
    public func getSeed(withId id: Int) {
        if let object = ReadFile.getContentOfFile(named: "DetailSeeds") {
            guard let seeds = (object["Seeds"] as? [[String: Any]])?.flatMap({DetailSeed(withDictionary: $0)}) else {
                return
            }
            self.fetchDetailSeed?(seeds)
        }
    }
}


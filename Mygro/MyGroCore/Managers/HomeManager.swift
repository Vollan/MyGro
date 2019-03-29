//
//  HomeManager.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import Foundation

class UserManager {
    
    var seedsFetchedSuccessfully: (([Seed]) -> ())?
    
    public func getSeeds() {
        if let object = ReadFile.getContentOfFile(named: "Seeds") {
            guard let seeds = (object["Seeds"] as? [[String: Any]])?.flatMap({Seed(withDictionary: $0)}) else {
                return
            }
            seedsFetchedSuccessfully?(seeds)
        }
    }
}


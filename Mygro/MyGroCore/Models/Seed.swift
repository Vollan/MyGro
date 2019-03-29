//
//  Seed.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-11.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import Foundation

public struct Seed {
    
    public let id: Int
    public let name: String
    public let isMain: Bool
    public let imageUrl: URL?
    public let searchImageUrl: URL?
    
    public init?(withDictionary dict: [String: Any]) {
        
        guard let id = dict["id"] as? Int,
                let name = dict["name"] as? String
               /* let image = (dict["picture"] as? String)?.url*/ else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.isMain = (dict["is_main"] as? Bool) ?? false
        self.imageUrl = (dict["picture"] as? String)?.url
        self.searchImageUrl = (dict["search_picture"] as? String)?.url
        
    }
}

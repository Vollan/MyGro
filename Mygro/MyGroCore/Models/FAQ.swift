//
//  FAQ.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-12-26.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import Foundation

public struct FAQ {
    
    let headerText: String
    let breadText: String
    
    public init?(withDictionary dict: [String: Any]) {
        guard let headerText = dict["header_text"] as? String,
            let breadText = dict["bread_text"] as? String else {
                return nil
        }
        
        self.headerText = headerText
        self.breadText = breadText
    }
}

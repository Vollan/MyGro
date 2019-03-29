//
//  String+extensions.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import Foundation

extension String {
    
    var localised: String {
        return NSLocalizedString(self, comment: "")
    }
    
    public var url: URL? {
        return URL(string: self)
    }
}

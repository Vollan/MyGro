//
//  ReadFile.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-11.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

class ReadFile {
    
    static func getContentOfFile(named name: String) -> [String: Any]? {
        do {
            if let file = Bundle.main.url(forResource: name, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    return object
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

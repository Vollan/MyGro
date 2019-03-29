//
//  HelpManager.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-12-26.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import Foundation

class HelpManager {
 
    var helpFetched: (([FAQ]) -> ())?
    
    public func getHelp() {
        if let object = ReadFile.getContentOfFile(named: "FAQData") {
            guard let faq = (object["help"] as? [[String: Any]])?.map({FAQ(withDictionary: $0)}) else {
                    return
            }
            helpFetched?(faq as! [FAQ])
        }
    }

}

//
//  BaseView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-08-23.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// Override this method to set up view.
    func setup() {
        
    }
    
}

//
//  BaseTableViewCell.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-08-23.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    convenience public init() {
        self.init(frame: .zero)
    }
    
    //Override this one
    open func setup() {
        
    }
}

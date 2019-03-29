//
//  BaseTableView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-08-23.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

class BaseTableView: UITableView {
    
    public var separatorStyling: UITableViewCellSeparatorStyle = .singleLine
    
    override public init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience public init() {
        self.init(frame: .zero)
    }
    
    //Override this
    open func setup() {
        backgroundColor = UIColor.white
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = Theme.Color.sandpaperColor
        self.separatorStyle = separatorStyling
    }
}

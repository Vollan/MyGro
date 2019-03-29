//
//  FooterView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-12-26.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit

class FooterView: BaseView {
    
    public var footerImnageTopConstraint: Constraint!
    
    private lazy var footerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        return image
    }()
    
    override func setup() {
        super.setup()
        addSubview(footerImage)
        
        footerImage.snp.makeConstraints { (make) in
            footerImnageTopConstraint = make.top.equalToSuperview().offset(8).constraint
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(55)
            make.bottom.equalToSuperview()
        }
        
        if let url = "https://www.wexthuset.com/mygro/images/footer/wexthuset-footer-gardening-by-wexthuset-375px.jpg".url as? URL {
            footerImage.setImage(with: url)
        } else {
            
        }
    }
}

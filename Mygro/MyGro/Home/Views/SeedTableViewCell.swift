//
//  SeedTableViewCell.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-11.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyAttributes

class SeedTableViewCell: BaseTableViewCell {
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var seedTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    override func setup() {
        super.setup()
        addSubview(icon)
        addSubview(seedTitle)
        
        backgroundColor = .clear
        
        icon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        seedTitle.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(icon.snp.trailing).offset(8)
        }
        
    }
    
    public func configure(withSeed seed: Seed) {
        if let url = seed.searchImageUrl {
            self.icon.setImage(with: url)
        }
        self.seedTitle.attributedText = seed.name.withFont(Font.normal.withSize(size: 14)).withTextColor(seed.isMain ? Theme.Color.lightBlue : Theme.Color.darkGreen)
    }
}

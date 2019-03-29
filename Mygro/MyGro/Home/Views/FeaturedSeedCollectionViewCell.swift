//
//  FeaturedSeedCollectionViewCell.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-13.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit

class FeaturedSeedCollectionViewCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    lazy var seedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.image = #imageLiteral(resourceName: "noConnection")
        return imageView
    }()
    
    func setup() {
        addSubview(seedImage)
        seedImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    public func configure(withSeed seed: Seed) {
        if let url = seed.imageUrl {
            seedImage.setImage(with: url)
        } else {
            seedImage.image = #imageLiteral(resourceName: "noConnection")
        }
    }
}

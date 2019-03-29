//
//  SeedImageDisplayView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-12.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage

class SeedImageDisplayView: BaseView {
    
    private lazy var headerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imageSize = UIScreen.main.bounds.width
    
    override func setup() {
        super.setup()
        addSubview(headerImage)
        
        headerImage.snp.makeConstraints { (make) in
            make.width.equalTo(imageSize)
            make.height.equalTo(imageSize).multipliedBy(2/3)
            make.edges.equalToSuperview()
        }
    }
    
    public func configure(withImage image: URL) {
        if Reachability.isConnectedToNetwork() {
            headerImage.setImage(with: image)
        }
        headerImage.image = #imageLiteral(resourceName: "noConnection")
    }
}

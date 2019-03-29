//
//  HomeFeaturedSeedCollectionView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-13.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

class HomeFeaturedSeedCollectionView: UICollectionView, UICollectionViewDataSource {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    var seeds: [Seed] = [] {
        didSet {
            reloadData()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
    }
    
    func setup() {
        register(FeaturedSeedCollectionViewCell.self)
        dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 196)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seeds.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedSeedCollectionViewCell.defaultReuseIdentifier, for: indexPath) as! FeaturedSeedCollectionViewCell
        cell.seedImage.image = #imageLiteral(resourceName: "noConnection")
        cell.configure(withSeed: seeds[indexPath.item])
        return cell
    }

}

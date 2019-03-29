//
//  HomeNewsView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyAttributes

protocol SelectedItemDelegate {
    func didSelectItem(withId id: Int)
}

class HomeNewsView: BaseView, UICollectionViewDelegateFlowLayout {
    
    var delegate: SelectedItemDelegate!
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "frontImage")
        return imageView
    }()
    
    private lazy var collectionView: HomeFeaturedSeedCollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 160, height: 224)
        flowLayout.scrollDirection = .horizontal
        let collectionView = HomeFeaturedSeedCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        return collectionView
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.Color.black
        return view
    }()
    
    override func setup() {
        super.setup()
        backgroundColor = .clear
        addSubview(imageView)
        addSubview(collectionView)
        
        imageView.snp.makeConstraints { (make) in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(500).priority(999)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(224)
            make.bottom.equalToSuperview()
        }
    }
    
    public func configure(withSeeds seeds: [Seed]) {
        collectionView.seeds = seeds
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(withId: self.collectionView.seeds[indexPath.item].id)
    }
}

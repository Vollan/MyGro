//
//  FeaturedSeedsView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-13.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

/*protocol SelectedItemDelegate {
    func didSelectItem(withId id: Int)
}

class FeaturedSeedsView: BaseView, UICollectionViewDelegateFlowLayout {
    
    var delegate: SelectedItemDelegate!
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
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
    
    override func setup() {
        super.setup()
        //addSubview(titleLabel)
        addSubview(collectionView)
        backgroundColor = .clear
        
        /*titleLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(24)
        }*/
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(224)
            make.bottom.equalToSuperview()
        }
    }
    
    public func configure(withSeeds seeds: [Seed]) {
        //titleLabel.attributedText = "FEATURED_SEED_TITLE".localised.withFont(Font.normal.withSize(size: 15)).withTextColor(Theme.Color.black).withParagraphStyle(Theme.attributes.centerParagraphStyle()).withUnderlineStyle(.styleSingle).withUnderlineColor(Theme.Color.black)
        collectionView.seeds = seeds
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(withId: self.collectionView.seeds[indexPath.item].id)
    }
    
    
}*/

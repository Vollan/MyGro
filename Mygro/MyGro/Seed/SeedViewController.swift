//
//  SeedViewController.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-12.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit

class SeedViewController: StackedViewController {
    
    public var seedId: Int = 0
    
    private lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let imageDisplayView = SeedImageDisplayView()
    let seedInformationView = SeedInformationView()
    let seedManager = SeedManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindManager()
        seedManager.getSeed(withId: seedId)
        setup()
    }
    
    func bindManager() {
        seedManager.fetchDetailSeed = { [weak self] seeds in
            guard let controller = self else {return}
            let text = seeds[controller.seedId].name
            let firstWord = text.components(separatedBy: " ")[0]
            controller.title = firstWord
            controller.headerTitle.attributedText = text.replacingOccurrences(of: firstWord, with: "").withFont(Font.normal.withSize(size: 24)).withParagraphStyle(Theme.attributes.centerParagraphStyle()).withTextColor(Theme.Color.darkGreen)
            controller.seedInformationView.configure(withSeedInformation: seeds[controller.seedId])
            controller.imageDisplayView.configure(withImage: seeds[controller.seedId].image)
        }
    }
    
    func setup() {
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: Font.normal.withSize(size: 24),
                                                                   NSForegroundColorAttributeName: Theme.Color.white]
        
        view.backgroundColor = Theme.Color.sandpaperColor
        headerView.addSubview(headerTitle)
        
        headerTitle.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        addStackedViews([headerView,
                         imageDisplayView,
                         seedInformationView])
        
    }
}

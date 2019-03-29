//
//  HomeViewController.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class HomeViewController: StackedViewController, SelectSeedDelegate, SelectedItemDelegate {
    
    let searchView = HomeSearchView()

    private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Theme.Color.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let newsView = HomeNewsView()
    let manager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        bindManager()
        
        setup()
        manager.getSeeds()
        delegates()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func delegates() {
        searchView.delegate = self
        newsView.delegate = self
    }
    
    func setup() {
        view.backgroundColor = Theme.Color.sandpaperColor
        
        separatorView.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        addStackedViews([searchView,
                         separatorView,
                         newsView])
        
        navigationController?.navigationBar.backgroundColor = Theme.Color.black
        navigationController?.navigationBar.barTintColor = Theme.Color.black
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: Font.normal.withSize(size: 18),
                                                                   NSForegroundColorAttributeName: Theme.Color.white]
    }
    
    private func bindManager() {
        manager.seedsFetchedSuccessfully = { [weak self] seeds in
            guard let controller = self else {return}
            controller.searchView.tabledata = seeds
            controller.newsView.configure(withSeeds: seeds)
        }
    }
    
    //Protocols
    
    func seedSelected(withSeed seed: Seed) {
        let vc = Storyboard.Main.viewController(viewControllerClass: SeedViewController.self)
        vc.seedId = seed.id-1
        searchView.resultSearchController.isActive = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didSelectItem(withId id: Int) {
        let vc = Storyboard.Main.viewController(viewControllerClass: SeedViewController.self)
        vc.seedId = id-1
        navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  MainSeedTableViewController.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-13.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

class MainSeedTableViewController: UITableViewController {
    
    let manager = SeedManager()
    var seeds: [Seed] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindManager()
        tableView.rowHeight = 47
        manager.getSeedForMain(withId: 1)
        setup()
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SeedTableViewCell.self)
    }
    
    func bindManager() {
        manager.fetchedMainSeed = { [weak self] seeds in
            guard let controller = self else {return}
            controller.seeds = seeds
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCells(forIndexPath: indexPath) as SeedTableViewCell
        cell.configure(withSeed: seeds[indexPath.item])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Storyboard.Main.viewController(viewControllerClass: SeedViewController.self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.backgroundColor = Theme.Color.sandpaperColor
        tableView.separatorColor = Theme.Color.black
    }
    
}

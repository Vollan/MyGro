//
//  HomeSearchView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-11.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit

protocol SelectSeedDelegate {
    func seedSelected(withSeed seed: Seed)
}

protocol SearchCancelDelegate {
    func cancelButtonPressed()
}

class HomeSearchView: BaseView, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    var tblViewHeightConstraint: Constraint!
    var tbleViewBottomConstraint: Constraint!
    var delegate: SelectSeedDelegate!
    var cancelDelegate: SearchCancelDelegate!
    
    var tblView: BaseTableView = {
        let tableView = BaseTableView()
        tableView.rowHeight = 47
        tableView.clipsToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SeedTableViewCell.self)
        tableView.showsVerticalScrollIndicator = true
        tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0,0,0,tableView.bounds.size.width-20)
        return tableView
    }()
    
    var tabledata: [Seed] = []
    
    var filteredSeedArray: [Seed] = []
    
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tblView.showsVerticalScrollIndicator = true
        tblView.flashScrollIndicators()
        //resultSearchController.searchBar.showsCancelButton = false
        tblView.separatorColor = Theme.Color.black
    }
    
    override func setup() {
        super.setup()
        addSubview(tblView)
        
        tblView.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(4)
            tbleViewBottomConstraint = make.bottom.equalToSuperview().inset(6).constraint
            tblViewHeightConstraint = make.height.equalTo(45).constraint
        }
        
        tblView.delegate = self
        tblView.dataSource = self
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.searchBar.clipsToBounds = true
            controller.searchBar.backgroundColor = Theme.Color.sandpaperColor
            controller.dimsBackgroundDuringPresentation = false
            //controller.searchBar.sizeToFit()
            controller.searchBar.barTintColor = Theme.Color.sandpaperColor
            controller.searchBar.backgroundColor = .clear
            controller.hidesNavigationBarDuringPresentation = true
            controller.searchBar.placeholder = "SEARCH".localised
            controller.searchBar.delegate = self
            controller.searchBar.showsScopeBar = false
            controller.searchBar.showsCancelButton = false
            tblView.tableHeaderView = controller.searchBar
            return controller
        })()
        tblView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultSearchController.isActive {
            return filteredTableData.count
        }else{
            return tabledata.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCells(forIndexPath: indexPath) as SeedTableViewCell
        if resultSearchController.isActive {
            cell.configure(withSeed: filteredSeedArray[indexPath.item])
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredSeedArray = []
        filteredTableData = []
        if let text = searchController.searchBar.text {
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", text)
            let data = tabledata.map({$0.name})
            let array = (data as NSArray).filtered(using: searchPredicate)
            for seed in array {
                for info in tabledata {
                    if (seed as! String) == info.name {
                        filteredSeedArray.append(info)
                    }
                }
            }
            filteredTableData = array as! [String]
        }
        
        if filteredTableData.count <= 4 {
            tblViewHeightConstraint.update(offset: 51*filteredTableData.count + 45)
        } else {
            tblViewHeightConstraint.update(offset: 44*min(4, filteredTableData.count) + 45)
        }
        
        //tblViewHeightConstraint.update(offset: 44*min(4, filteredTableData.count) + 45)
        //tbleViewBottomConstraint.update(inset: filteredTableData.count > 0 ? 12 : 4)
        tblView.isScrollEnabled = filteredTableData.count > 4
        tblView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.seedSelected(withSeed: filteredSeedArray[indexPath.item])
    }

}

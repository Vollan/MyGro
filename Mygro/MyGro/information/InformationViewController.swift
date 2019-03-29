//
//  InformationViewController.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-12-26.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit
import MessageUI

class InformationViewController: StackedViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableViewHeightConstraint: Constraint!
    
    let tableViewView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private var tableView: BaseTableView = {
        let tableView = BaseTableView()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(InformationTableViewCell.self)
        tableView.isScrollEnabled = false
        tableView.separatorStyling = .none
        return tableView
    }()

    let contactView = ContactView()
    
    let manager = HelpManager()
    var faq: [FAQ] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewHeightConstraint.update(offset: tableView.contentSize.height)
        let diff = UIScreen.main.bounds.height-(contactView.frame.height + tableView.contentSize.height + 160)
        if diff > 0 {
            footerView.footerImnageTopConstraint.update(offset: diff)
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Information"
        setup()
        bindManager()
        manager.getHelp()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setup() {
        tableViewView.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            tableViewHeightConstraint = make.height.equalTo(0).constraint
        }
        addStackedViews([tableViewView, contactView])
        
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    func bindManager() {
        manager.helpFetched = { [weak self] faq in
            guard let controller = self else {return}
            controller.faq = faq
        }
        
        contactView.phonePressed = {
            guard let number = URL(string: "tel://08225080") else { return }
            UIApplication.shared.open(number)
        }
        
        contactView.mailPressed = {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["kundtjanst@wexthuset.com"])
                self.present(mail, animated: true)
            } else {
                let alert = UIAlertController(title: "Oops!", message: "Du måste ha en mail installerad på telefonen för att kunna använda denna tjänst. \n \n Vill du kopiera mailaddressen?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ja tack", style: .default, handler: { _ in
                    UIPasteboard.general.string = "kundtjanst@wexthuset.com"
                    alert.dismiss(animated: true, completion: nil)
                    UIAlertController.showError(withMessage: "Mailaddress kopierad", andTitle: "", fromViewController: self)
                }))
                alert.addAction(UIAlertAction.init(title: "Nej tack", style: .default, handler: { _ in
                    alert.dismiss(animated: true, completion: nil)
                }))
                
                self.present(alert, animated: true)
            }
        }
    }
    
    override func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faq.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCells(forIndexPath: indexPath) as InformationTableViewCell
        cell.configure(withTexts: faq[indexPath.item])
        return cell
    }
}

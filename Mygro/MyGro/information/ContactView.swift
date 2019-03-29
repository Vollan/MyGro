//
//  ContactView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-12-26.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

class ContactView: BaseView {
    
    var phonePressed: (() -> ())?
    var mailPressed: (() -> ())?
    
    private lazy var telephone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var mail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setup() {
        super.setup()
        addSubview(telephone)
        addSubview(mail)
        
        telephone.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(24)
        }
        
        mail.snp.makeConstraints { (make) in
            make.top.equalTo(telephone.snp.bottom).offset(4)
            make.height.equalTo(24)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(16)
        }
        
        setupTexts()
        setupContact()
    }
    
    func setupContact() {
        let telephoneGesture = UITapGestureRecognizer.init(target: self, action: #selector(phoneTapped))
        telephone.isUserInteractionEnabled = true
        telephone.addGestureRecognizer(telephoneGesture)
        
        let mailGesture = UITapGestureRecognizer.init(target: self, action: #selector(mailTapped))
        mail.isUserInteractionEnabled = true
        mail.addGestureRecognizer(mailGesture)
    }
    
    @objc func phoneTapped() {
        phonePressed?()
    }
    
    @objc func mailTapped() {
        mailPressed?()
    }
    
    func setupTexts() {
        let telephoneText = NSMutableAttributedString()
        telephoneText.append(NSAttributedString(string: "Tel:   ", attributes: [NSForegroundColorAttributeName : Theme.Color.black]))
        telephoneText.append(NSAttributedString(string: "08 - 22 50 80", attributes: [NSForegroundColorAttributeName : Theme.Color.lightBlue]))
        telephone.attributedText = telephoneText
        
        let mailText = NSMutableAttributedString()
        mailText.append(NSAttributedString(string: "Mejl: ", attributes: [NSForegroundColorAttributeName : Theme.Color.black]))
        mailText.append(NSAttributedString(string: "kundtjanst@wexthuset.com", attributes: [NSForegroundColorAttributeName : Theme.Color.lightBlue]))
        
        mail.attributedText = mailText
        
    }
}

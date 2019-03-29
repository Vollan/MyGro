//
//  InformationTableViewCell.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-12-26.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit

class InformationTableViewCell: BaseTableViewCell {
    
    private lazy var header: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var breadText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    override func setup() {
        super.setup()
        selectionStyle = .none
        addSubview(header)
        addSubview(breadText)

        header.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(24)
        }
        
        breadText.snp.makeConstraints { (make) in
            make.top.equalTo(header.snp.bottom)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
        }
    }
    
    public func configure(withTexts texts: FAQ) {
        header.text = texts.headerText.uppercased()
        breadText.text = texts.breadText
    }
}

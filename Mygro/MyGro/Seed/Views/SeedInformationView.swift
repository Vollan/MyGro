//
//  SeedInformationView.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-12.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit

class SeedInformationView: BaseView {
    
    private lazy var explanationButton: TagButton = {
        let button = TagButton()
        button.hideUnderline = false
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(switchPressed(_ :)), for: .touchUpInside)
        button.tag = 0
        button.setAttributedTitle("EXPLANATION".localised.withFont(Font.normal.withSize(size: 14)), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var factButton: TagButton = {
        let button = TagButton()
        button.hideUnderline = true
        button.backgroundColor = .black
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(switchPressed(_ :)), for: .touchUpInside)
        button.tag = 1
        button.setAttributedTitle("FACT".localised.withFont(Font.normal.withSize(size: 14)), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tipsButton: TagButton = {
        let button = TagButton()
        button.hideUnderline = true
        button.backgroundColor = .black
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(switchPressed(_ :)), for: .touchUpInside)
        button.tag = 2
        button.setAttributedTitle("TIPS".localised.withFont(Font.normal.withSize(size: 14)), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func switchPressed(_ button: TagButton) {
        switch button.tag {
        case 0:
            explanationButton.backgroundColor = .white
            explanationButton.layer.borderColor = UIColor.black.cgColor
            explanationButton.titleLabel?.textColor = .black
            
            factButton.backgroundColor = .black
            factButton.layer.borderColor = UIColor.white.cgColor
            factButton.titleLabel?.textColor = .white
            
            tipsButton.backgroundColor = .black
            tipsButton.layer.borderColor = UIColor.white.cgColor
            tipsButton.titleLabel?.textColor = .white
            
            descriptionLabel.isHidden = false
            factLabel.isHidden = true
            tricksLabel.isHidden = true
            
        case 1:
            factButton.backgroundColor = .white
            factButton.layer.borderColor = UIColor.black.cgColor
            factButton.titleLabel?.textColor = .black
            
            explanationButton.backgroundColor = .black
            explanationButton.layer.borderColor = UIColor.white.cgColor
            explanationButton.titleLabel?.textColor = .white
            
            tipsButton.backgroundColor = .black
            tipsButton.layer.borderColor = UIColor.white.cgColor
            tipsButton.titleLabel?.textColor = .white
            
            descriptionLabel.isHidden = true
            factLabel.isHidden = false
            tricksLabel.isHidden = true
            
        case 2:
            tipsButton.backgroundColor = .white
            tipsButton.layer.borderColor = UIColor.black.cgColor
            tipsButton.titleLabel?.textColor = .black
            
            explanationButton.backgroundColor = .black
            explanationButton.layer.borderColor = UIColor.white.cgColor
            explanationButton.titleLabel?.textColor = .white
            
            factButton.backgroundColor = .black
            factButton.layer.borderColor = UIColor.white.cgColor
            factButton.titleLabel?.textColor = .white
            
            descriptionLabel.isHidden = true
            factLabel.isHidden = true
            tricksLabel.isHidden = false
        default:
            break
        }
    }
    
    private lazy var labelFrame: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderColor = Theme.Color.black.cgColor
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var descriptionLabel: TopLeftUILabel = {
        let label = TopLeftUILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var factLabel: TopLeftUILabel = {
        let label = TopLeftUILabel()
        label.isHidden = true
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var tricksLabel: TopLeftUILabel = {
        let label = TopLeftUILabel()
        label.isHidden = true
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func setup() {
        super.setup()
        addSubview(explanationButton)
        addSubview(factButton)
        addSubview(tipsButton)
        addSubview(labelFrame)
        addSubview(descriptionLabel)
        addSubview(factLabel)
        addSubview(tricksLabel)
        
        let buttonWidth = (UIScreen.main.bounds.width-48-16)/3
        
        explanationButton.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(24)
            make.height.equalTo(40)
            make.width.equalTo(buttonWidth)
        }
        
        factButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(explanationButton.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(buttonWidth)
        }
        
        tipsButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(factButton.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(buttonWidth)
            make.trailing.equalToSuperview().inset(24)
        }
        
        labelFrame.snp.makeConstraints { (make) in
            make.top.equalTo(explanationButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.bottom.equalToSuperview().inset(24)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(explanationButton.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.bottom.equalToSuperview().inset(32)
        }
        
        factLabel.snp.makeConstraints { (make) in
            make.top.equalTo(explanationButton.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.bottom.equalToSuperview().inset(32)
        }
        
        tricksLabel.snp.makeConstraints { (make) in
            make.top.equalTo(explanationButton.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.bottom.equalToSuperview().inset(32)
        }
        
        switchPressed(explanationButton)
    }
    
    public func configure(withSeedInformation seedInformation: DetailSeed) {
        descriptionLabel.attributedText = seedInformation.description.withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen)
        
        factLabel.attributedText = handleFacts(withFacts: seedInformation.facts)
        
        tricksLabel.attributedText = seedInformation.gardeningTricks.withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen)
    }
    
    fileprivate func handleFacts(withFacts facts: SeedFact) -> NSAttributedString {
        let attributeString = NSMutableAttributedString()
        attributeString.append("TYPE".localised.withFont(Font.normal.withSize(size: 16)).withTextColor(.black))
        attributeString.append(": \(facts.type)\n".withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen))
        
        attributeString.append("HEIGHT".localised.withFont(Font.normal.withSize(size: 16)).withTextColor(.black))
        attributeString.append(": \(facts.height)\n".withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen))
        
        attributeString.append("POSITION".localised.withFont(Font.normal.withSize(size: 16)).withTextColor(.black))
        attributeString.append(": \(facts.position)\n".withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen))
        
        attributeString.append("TIME".localised.withFont(Font.normal.withSize(size: 16)).withTextColor(.black))
        attributeString.append(": \(facts.time)\n".withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen))
        
        attributeString.append("DEPTH".localised.withFont(Font.normal.withSize(size: 16)).withTextColor(.black))
        attributeString.append(": \(facts.depth)\n".withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen))
        
        attributeString.append("FLOWER_DISTANCE".localised.withFont(Font.normal.withSize(size: 16)).withTextColor(.black))
        attributeString.append(": \(facts.flowerDistance)\n".withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen))
        
        attributeString.append("ROW_DISTANCE".localised.withFont(Font.normal.withSize(size: 16)).withTextColor(.black))
        attributeString.append(": \(facts.rowDistance)\n".withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen))
        
        attributeString.append("HARVEST_TIME".localised.withFont(Font.normal.withSize(size: 16)).withTextColor(.black))
        attributeString.append(": \(facts.harvestTime)\n".withFont(Font.normal.withSize(size: 16)).withTextColor(Theme.Color.darkGreen))
        
        return attributeString
    }
}


class TagButton: UIButton {
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    var hideUnderline: Bool = true {
        didSet {
            underlineView.isHidden = hideUnderline
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
       /* addSubview(underlineView)
        
        underlineView.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
        }*/
    }
}

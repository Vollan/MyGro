//
//  StackedViewController..swift
//  MyGro
//
//  Created by Emil Sandström on 2017-08-23.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import SnapKit
import TPKeyboardAvoiding

public class StackedViewController: UIViewController {
    
    let footerView = FooterView()
    
    private(set) var scrollView: TPKeyboardAvoidingScrollView = {
        let view = TPKeyboardAvoidingScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .top
        view.bounces = false
        return view
    }()
    
    override public var prefersStatusBarHidden: Bool {
        return true
    }
    
    private(set) var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fill
        view.alignment = .fill
        view.axis = .vertical
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if self is HomeViewController {
            self.navigationItem.leftBarButtonItem = nil
        } else {
            self.navigationItem.setLeftBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(backButtonPressed)), animated: true)
            self.navigationItem.leftBarButtonItem?.tintColor = .white
        }
        
        if self is InformationViewController {
            
        } else {
            let infoButton = UIButton(type: .infoLight)
            infoButton.tintColor = .white
            infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
            let barButton = UIBarButtonItem(customView: infoButton)
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
    
    @objc func infoButtonTapped() {
        let vc = Storyboard.Main.viewController(viewControllerClass: InformationViewController.self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    override public func loadView() {
        super.loadView()
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        let topConstraint = stackView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        let bottomConstraint = stackView.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.bottomAnchor)
        
        topConstraint.priority = UILayoutPriorityRequired
        bottomConstraint.priority = UILayoutPriorityDefaultLow
        
        NSLayoutConstraint.activate([
            topConstraint,
            bottomConstraint,
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
    }
    
    // MARK: - Public methods
    
    func addStackedView(_ subview: UIView) {
        stackView.addArrangedSubview(subview)
    }
    
    func addStackedViews(_ subviews: [UIView]) {
        for subview in subviews {
            addStackedView(subview)
        }
        
        addStackedView(footerView)
    }
    
    func removeStackedView(_ subview: UIView) {
        stackView.removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }
    
    func removeStackedViews(_ subviews: [UIView]) {
        for subview in subviews {
            stackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
    func insertStackedView(_ subview: UIView, at index: Int) {
        stackView.insertArrangedSubview(subview, at: index)
    }
}

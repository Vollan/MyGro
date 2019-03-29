//
//  Storyboard+extensions.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case Main
    
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("View controller with identifier \(storyboardID) can not be found in storyboard: \(self.rawValue).")
        }
        return scene
    }
    
    var initialViewController: UIViewController? {
        return instance.instantiateInitialViewController()
    }
    
}

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: Storyboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
}

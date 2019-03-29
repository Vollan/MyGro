//
//  UIAlertController+extension.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func showError(withMessage message: String, andTitle title: String, fromViewController controller: UIViewController, completion: (() -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
            completion?()
        }))
        
        controller.present(alert, animated: true)
    }
    
    class func showTransitionMessage(withMessage message: String, andTitle title: String, fromViewController controller: UIViewController, completion: ((Bool) -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
            completion?(true)
        }))
        alert.addAction(UIAlertAction(title: "CANCEL".localised, style: .cancel, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
            completion?(false)
        }))
        
        
        controller.present(alert, animated: true)
    }
    
}

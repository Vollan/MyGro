//
//  CustomTextField.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-08-23.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 4, left: 8, bottom: 0, right: 0)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    public func isTextFieldNilOrEmpty() -> Bool {
        if let text = self.text, text != "" {
            return false
        } else {
            return true
        }
    }
    
}

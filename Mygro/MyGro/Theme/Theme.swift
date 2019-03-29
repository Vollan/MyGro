//
//  Theme.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit

struct Theme {
    static let shared = Theme()
    static var Color = _Color()
    static var attributes = _Attributes()
    static let defaultKern = NSNumber(value: -0.41)
    struct _Color {
        var Gradient = _Gradient()
        struct _Gradient {
            //TODO - fix correct gradients when design is set.
            var lightBlue_darkBlue = [UIColor.from(hex: "21A1DC"), UIColor.from(hex: "0C5DA5")]
        }
        
        var sandpaperColor = UIColor.from(hex: "FFFFFF")
        var lightGray = UIColor.from(hex: "D2D2D2")
        var textFieldBlack = UIColor.from(hex: "464A49")
        var lightBlue = UIColor.from(hex: "21A1DC")
        var darkGreen = UIColor.from(hex: "005d22")
        var darkBlue = UIColor.from(hex: "222950")
        var yellow = UIColor.from(hex: "F3AC17")
        var darkGray = UIColor.from(hex: "343434")
        var white = UIColor.from(hex: "FFFFFF")
        var black = UIColor.from(hex: "000000")
    }
    
    struct _Attributes {
        var textFieldText = [NSFontAttributeName: Font.normal.withSize(size: 14),
                             NSForegroundColorAttributeName: Theme.Color.textFieldBlack] as [String : Any]
        
        func lineSpacing(withHeight height: CGFloat) -> NSMutableParagraphStyle {
            let spacing = NSMutableParagraphStyle()
            spacing.minimumLineHeight = height
            return spacing
        }
        
        func centerParagraphStyle() -> NSMutableParagraphStyle {
            let align = NSMutableParagraphStyle()
            align.alignment = NSTextAlignment.center
            return align
        }
    }
    
}

enum Font: String {
    case normal = "arial"
    func withSize(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

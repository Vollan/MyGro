//
//  UIViewcontroller+extensions.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import UIKit
import MessageUI

extension UIViewController: MFMailComposeViewControllerDelegate {
    
    func sendEmail(withSubject subject: String = "", body: String = "", recipient: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipient])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            present(mail, animated: true, completion: nil)
        } else {
            UIAlertController.showError(withMessage: "MAIL_ERROR_MESSAGE".localised, andTitle: "MAIL_ERROR_TITLE".localised, fromViewController: self)
        }
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

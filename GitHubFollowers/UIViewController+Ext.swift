//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by admin on 22/04/22.
//

import UIKit
extension UIViewController {
    
    // MARK: - Present Alert dialog
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}


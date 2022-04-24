//
//  UIHelper.swift
//  GitHubFollowers
//
//  Created by admin on 24/04/22.
//

import UIKit

struct UIHelper {
    
    // MARK: - Create three column
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minItemSpacing : CGFloat    = 10
        let availableWidth              = width - (padding * 2) - (minItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
}

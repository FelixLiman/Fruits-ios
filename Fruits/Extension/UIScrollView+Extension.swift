//
//  UIScrollView+Extension.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import UIKit

extension UIScrollView {
    
    func automaticallyAdjustsContentSize() {
        heightConstraint?.constant = CGFloat.greatestFiniteMagnitude
        layoutIfNeeded()
        heightConstraint?.constant = contentSize.height + contentInset.top + contentInset.bottom
    }
    
}

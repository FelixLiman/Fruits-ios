//
//  UIStackView+Extension.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import UIKit

extension UIStackView {
    ///Adds a view to the end of the receiver's list of subviews.
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach(addArrangedSubview)
    }
}
    

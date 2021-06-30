//
//  Array+Extension.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import Foundation

extension Array {
    func get(_ index: Int) -> Element? {
        return (0 <= index && index < count) ? self[index] : nil
    }
}

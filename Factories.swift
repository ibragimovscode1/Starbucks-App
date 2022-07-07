//
//  Factories.swift
//  Starbucks App
//
//  Created by Rahmetullah on 7.07.2022.
//


import UIKit
extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}

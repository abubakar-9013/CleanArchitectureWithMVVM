//
//  FontExtension.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.
//

import UIKit

extension UIFont {
    static func normsProMedium(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 56)
        font = UIFont(name: "TTNormsPro-Medium", size: size)!
        return font
    }
    static func normsProRegular(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 56)
        font = UIFont(name: "TTNormsPro-Regular", size: size)!
        return font
    }
    static func normsProBold(size: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 56)
        font = UIFont(name: "TTNormsPro-Bold", size: size)!
        return font
    }
}



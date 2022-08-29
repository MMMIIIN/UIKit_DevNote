//
//  UIFont+Extension.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/06/27.
//

import UIKit

enum AppFontName: String {
    case regular = "DungGeunMo"
}

extension UIFont {
    static func font(_ style: AppFontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}

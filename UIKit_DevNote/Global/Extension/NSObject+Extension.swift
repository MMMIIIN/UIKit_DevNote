//
//  NSObject+Extension.swift
//  UIKit_DevNote
//
//  Created by Mingwan Choi on 2022/07/13.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

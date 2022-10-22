//
//  NSMutableAttributedString.swift
//  UIKitInstagram
//
//  Created by Maxim on 22.10.2022.
//

import UIKit

// MARK: NSMutableAttributedString
extension NSMutableAttributedString {
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: 14) }
    var systemFont: UIFont { return UIFont.systemFont(ofSize: 14) }
    
    func bold(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: systemFont,
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func textColor(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: systemFont,
            .foregroundColor: UIColor.lightGray,
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}

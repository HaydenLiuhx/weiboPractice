//
//  Label+Extension.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 21/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit

extension UILabel {
    
    ///便利构造函数，默认是深灰色十四号字
    convenience init(title: String, fontSize: CGFloat = 14, color: UIColor = UIColor.darkGray) {
        self.init()
        text = title
        textColor = color
        font = UIFont.systemFont(ofSize:fontSize)
        numberOfLines = 0
        textAlignment = NSTextAlignment.center
    }
}

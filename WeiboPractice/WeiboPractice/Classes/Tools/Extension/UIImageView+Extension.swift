//
//  UIImage+Extension.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 21/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    convenience init(imageName: String){
        self.init(image: UIImage(named: imageName))
    }
}

//
//  UIButton+Extension.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 21/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    convenience init(imageName: String, backImageName: String){
         
        self.init()
        setImage(UIImage(named: imageName), for: UIControl.State.normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: UIControl.State.highlighted)
        setBackgroundImage(UIImage(named: backImageName), for: UIControl.State.normal)
        setBackgroundImage(UIImage(named: backImageName + "_highlighted"), for: UIControl.State.highlighted)
        //根据背景大小调整尺寸
        sizeToFit()
    }
}

//
//  OrderViewModel.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 26/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import Foundation
import UIKit

class OrderViewModel {
    
    
    
    var orderModel: OrderModel
    
    var userProfileUrl: String {
        
        let photoUrl = orderModel.photos?.components(separatedBy: ";")[0] ?? ""
        return photoUrl
    }
    var userDefaultIconView: UIImage {
        return UIImage(named: "avatar_default_big")!
    }
    var time: String {
        
        return orderModel.date!
    }
//    var memberImage: UIImage? {
//        return UIImage
//    }
    ///认证类型：-1没有认证；0认证用户；220达人；2，3，5企业认证
//    var userVipImage: UIImage?{
//          switch
//    }
    
    init(orderModel: OrderModel) {
        self.orderModel = orderModel
        
    }
    
    
}


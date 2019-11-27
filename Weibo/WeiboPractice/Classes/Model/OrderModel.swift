//
//  OrderModel.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 25/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit
import SwiftyJSON

//order数据模型
struct OrderModel {
    


    
    var id: String?
    //信息内容
    var notes: String?
    var photos: String?
    
    var status: String?
    var date: String?
    var source: User?
    
    
    init(jsonData: JSON) {
           id     = jsonData["id"].stringValue 
           notes  = jsonData["notes"].stringValue
            photos = jsonData["photos"].stringValue
        //photos = (String(jsonData["photos"].stringValue)).split(separator: ";")
           status = jsonData["status"].stringValue
           date   = jsonData["date"].stringValue
          
       }
    
//    init(dict: [String: AnyObject]) {
//        super.init()
//
//        setValuesForKeys(dict)
//    }
//
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//
//    }
//
//    override var description: String {
//        let keys = ["id", "notes", "photos", "status", "date"]
//        return dictionaryWithValues(forKeys: keys).description
//    }
}

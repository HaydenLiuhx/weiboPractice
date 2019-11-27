//
//  WelcomeViewController.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 22/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func loadView() {
        view = backImageView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    ///MARK:懒加载控件
    //背景图像
    private lazy var backImageView: UIImageView = UIImageView(imageName: "ad_background")
}

//MARK:设置界面

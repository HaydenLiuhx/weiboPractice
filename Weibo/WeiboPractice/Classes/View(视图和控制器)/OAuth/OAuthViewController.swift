//
//  OAuthViewController.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 22/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit

///用户登录控制器
class OAuthViewController: UIViewController {

    private lazy var webView = UIWebView()
    
    //MARK:-监听方法
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:设置界面
    override func loadView() {
        view = webView
        
        //设置导航栏
        title = "Login to application"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(close))
        //设置导航栏
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //在开发中c视图最好都指定背景颜色
        //view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    

   
}

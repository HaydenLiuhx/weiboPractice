//
//  VisitorTableViewController.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 21/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit

class VisitorTableViewController: UITableViewController {

    private var userLogon = true
    
    var visitorView: VisitorView?
    //lazy var visitorView: VisitorView? = VisitorView()
    
    override func loadView() {
        print("come here")
        //super.loadView()
        userLogon ? super.loadView() : setupVisitorView()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print(visitorView ?? (Any).self)
    }
    private func setupVisitorView(){
        //替换根视图
        visitorView = VisitorView()
       
        //view.backgroundColor = UIColor.white
        view = visitorView
        
        //添加监听方法
        visitorView?.registerButton.addTarget(self, action: #selector(visitorViewDidRegister), for: UIControl.Event.touchUpInside)
        visitorView?.loginButton.addTarget(self, action: #selector(visitorViewDidLogin), for: UIControl.Event.touchUpInside)
        
      
        //设置导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(visitorViewDidRegister))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(visitorViewDidLogin))
       
    }

}

//MARK: 访客视图监听方法
extension VisitorTableViewController {
    @objc func visitorViewDidRegister() {
        print("Register")
    }
    
    @objc func visitorViewDidLogin() {
       // print("Login")
        let vc = OAuthViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true, completion: nil)
    }
    
    
}

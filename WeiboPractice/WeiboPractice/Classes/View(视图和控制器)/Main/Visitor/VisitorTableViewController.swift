//
//  VisitorTableViewController.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 21/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit

class VisitorTableViewController: UITableViewController {

    private var userLogon = false
    
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
        
        //设置代理
        visitorView?.delegate = self
        //view.backgroundColor = UIColor.white
        view = visitorView
    }

}

//MARK: 访客视图监听方法
extension VisitorTableViewController: VisitorViewDelegate {
    func visitorViewDidRegister() {
        print("Register")
    }
    
    func visitorViewDidLogin() {
        print("Login")
    }
    
    
}

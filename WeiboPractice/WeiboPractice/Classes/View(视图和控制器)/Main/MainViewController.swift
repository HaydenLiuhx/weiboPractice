//
//  MainViewController.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 20/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    //MARK: -监听方法
    ///点击撰写按钮
    ///如果单纯使用·private·循环无法正确发送消息
    ///@objc可以保证运行循环发送此消息，即使这个函数被标记为private
    @objc private func clickComposedButton(){
        print("click me!")
    }
    //MARK: -视图生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加控制器，并不会创建tabbar里的按钮
        //懒加载，所有控件都是延迟创建的
        addChildViewControllers()
        setupComposedButton()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //把撰写按钮放到前面
        tabBar.bringSubviewToFront(composedButton)
    }
    
    //MARK: 懒加载控件
    private lazy var composedButton: UIButton = UIButton(
        imageName: "tabbar_compose_icon_add",
        backImageName: "tabbar_compose_button")
        //自定义样式的按钮
//       let button = UIButton()
//
//        button.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControl.State.normal)
//        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControl.State.highlighted)
//        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControl.State.normal)
//        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControl.State.highlighted)
//        //根据背景大小调整尺寸
//        button.sizeToFit()
//        return button
//    }()
    
}

//MARK: UI
extension MainViewController {
    //设置撰写按钮
    private func setupComposedButton(){
        //1.添加按钮
        tabBar.addSubview(composedButton)
        
        //2.调整按钮
        let count = children.count
        //让按钮宽一点
        let w = tabBar.bounds.width/CGFloat(count) - 1
        
        composedButton.frame = tabBar.bounds.insetBy(dx: 2*w, dy: -10)
        //3.添加监听方法
        composedButton.addTarget(self, action: #selector(clickComposedButton), for: .touchUpInside)
    }

    //添加所有控制器
    private func addChildViewControllers(){
        
        
                //设置tintColor - 图片渲染颜色
        tabBar.tintColor = UIColor.purple
        
        addChildViewController(vc: HomeTableViewController(), title: "首页", imageName: "icons8-home-50")
        addChildViewController(vc: MessageTableViewController(), title: "消息", imageName: "icons8-for-you-50")
        
        addChild(UIViewController())
        
        addChildViewController(vc: DiscoverTableViewController(), title: "发现", imageName: "icons8-cursor-50")
        addChildViewController(vc: ProfileTableViewController(), title: "我", imageName: "icons8-contacts-50")
    }
    
    //添加控制器
    
    private func addChildViewController(vc: UIViewController,title: String, imageName: String) {
        //let vc = HomeTableViewController()
        //title
        vc.title = title
        //image
        vc.tabBarItem.image = UIImage(named: imageName)
        //tabBar Controller
        let nav = UINavigationController(rootViewController: vc)
        
        addChild(nav)
    }
}

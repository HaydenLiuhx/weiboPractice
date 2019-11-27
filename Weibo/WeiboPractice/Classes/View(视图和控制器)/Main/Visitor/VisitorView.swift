//
//  VisitorView.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 21/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit
import SnapKit

///访客视图的协议


//访客视图
class VisitorView: UIView {
    
    
    //MARK: 设置视图信息
    func setupInfo(imageName: String?,title: String) {
        messageLabel.text = title
        
        //如果图片名称为nil，说明是首页，直接返回
        guard let imgName = imageName else {
            //播放动画
            startAnim()
            return
        }
        iconView.image = UIImage(named: imgName)
        //隐藏
        homeView.isHidden = true
        //将遮照图像移动到底层
        sendSubviewToBack(maskIconView)
    }
    
    //开启首页转轮动画
    private func startAnim() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        anim.toValue = 2 * Double.pi
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        
        //不断重复动画
        anim.isRemovedOnCompletion = false
        //添加到图层
        iconView.layer.add(anim, forKey: nil)
        
    }
    
    //MARK: 构造函数
    //initWithfame使用纯代码开发的路口,UIView指定构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    //initWithCoder - 使用SB&XIB开发加载的函数
    required init?(coder aDecoder: NSCoder) {
        //如果使用SB开发,调用这个视图会直接崩溃
        //阻止使用SB使用当前视图
        //纯代码打开
        //fatalError("init fail")
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    //MARK: -懒加载控件
    private lazy var iconView: UIImageView = UIImageView(imageName: "visitordiscover_feed_image_smallicon")
        //UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    private lazy var maskIconView: UIImageView = UIImageView(imageName: "visitordiscover_feed_mask_smallicon")
        
    private lazy var homeView: UIImageView = UIImageView(imageName: "visitordiscover_feed_image_house")
      
    private lazy var messageLabel: UILabel = UILabel(title: "Home Page", color: UIColor.purple)

    
    ///注册按钮,解除private
    lazy var registerButton: UIButton = UIButton(title: "注册", fontSize: 13, color: UIColor.brown, imageName: "common_button_white_disable")
//        {let button = UIButton()
//        button.setTitle("注册", for: UIControl.State.normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
//        button.setTitleColor(UIColor.orange, for: UIControl.State.normal)
//        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControl.State.normal)
//        return button
    //}()
    ///注册按钮
    lazy var loginButton: UIButton = UIButton(title: "登录", fontSize: 13, color: UIColor.darkGray, imageName: "common_button_white_disable")
   
}
//MARK: 设置界面
extension VisitorView {
    ///设置界面
    private func setupUI() {
        //1.添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeView)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        //2.设置自动布局
        /**
         添加的约束需要加到父视图上
         i子视图要有一个统一的参照物
         */
        //支持使用setFrame的方式来设置控件位置
//        for v in subviews{
//            v.translatesAutoresizingMaskIntoConstraints = false
//        }
        //iconView.translatesAutoresizingMaskIntoConstraints = false
        
        //1.图标
//        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
//        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))//参照值
        iconView.snp.makeConstraints{(make) -> Void in
            //指定 centerX 属性等于·参照对象·,'snp'参照属性值
            //offset就是指定相对视图约束的偏移量
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-60)
        }
//        //2.house
//        addConstraint(NSLayoutConstraint(item: homeView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
//        addConstraint(NSLayoutConstraint(item: homeView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: -7))
        homeView.snp.makeConstraints{(make) -> Void in
            make.center.equalTo(iconView.snp.center)}
//        //3.消息文字
//        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
//        //        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 16))
//        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 85))
//        //addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 75))
//        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30))
        messageLabel.snp.makeConstraints{(make) -> Void in
            make.centerX.equalTo(iconView.snp.centerX)
            make.top.equalTo(iconView.snp.bottom).offset(12)
            make.height.equalTo(224)
            make.height.equalTo(36)
        }
//        //4.button
//        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .left, relatedBy: .equal, toItem: homeView, attribute: .left, multiplier: 1.0, constant: -30))
//        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy: .equal, toItem: messageLabel, attribute: .top, multiplier: 1.0, constant: 36))
//        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60))
//        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 28))
        registerButton.snp.makeConstraints{(make) -> Void in
            make.left.equalTo(messageLabel.snp.left).offset(-60)
            make.top.equalTo(messageLabel.snp.bottom).offset(16)
            make.width.equalTo(80)
            make.height.equalTo(36)
        }
//        //4.button login
//        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .right, relatedBy: .equal, toItem: homeView, attribute: .right, multiplier: 1.0, constant: 30))
//        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: messageLabel, attribute: .top, multiplier: 1.0, constant: 36))
//        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60))
//        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 28))
        loginButton.snp.makeConstraints{(make) -> Void in
            make.right.equalTo(messageLabel.snp.right).offset(60)
            make.top.equalTo(registerButton.snp.top)
            make.width.equalTo(registerButton.snp.width)
            make.height.equalTo(registerButton.snp.height)
        }
        //5.mask
        /**
         VFL可视化格式语言
         H:水平方向
         V：垂直方向
         I：边界
         【】：包装控件
         matrics:是一个字典,字符串中某一个数值
         */
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mask]-0-|", options: [], metrics: nil, views: ["mask":maskIconView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mask]-(btnHeight)-[regButton]", options: [], metrics: ["btnHeight": -130], views: ["mask":maskIconView,"regButton":registerButton]))
        backgroundColor = UIColor(white: 237.0 / 255.0, alpha: 1.0)
        maskIconView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(registerButton.snp.bottom)
        }
        //3.添加监听方法
        
    }
}

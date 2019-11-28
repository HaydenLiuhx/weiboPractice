//
//  OrderCellTopView.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 25/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit
import SDWebImage



class OrderCellTopView: UIView {
    
      var viewModle: OrderViewModel? {
            didSet {
                //设置工作
                nameLabel.text = viewModle?.self.orderModel.id
                //头像
                iconView.sd_setImage(with: URL(string: "https://wekol.com.au/static/upload/"+viewModle!.userProfileUrl), placeholderImage: viewModle?.userDefaultIconView)
                //memberIconView.image = viewModle?.
                //vipIconView
                timeLabel.text = viewModle?.time
                sourceLabel.text = "来自 微博"
            }
        }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    //MARK:懒加载控件
    //头像
    private lazy var iconView: UIImageView = UIImageView(imageName: "avatar_default_big")
    //姓名
    private lazy var nameLabel: UILabel = UILabel(title: "王老五", fontSize: 14)
    //会员
    private lazy var memberIconView: UIImageView = UIImageView(imageName: "common_icon_membership_level1")
    //认证图标
    private lazy var vipIconView: UIImageView = UIImageView(imageName: "avatar_vip")
    //事件标签
    private lazy var timeLabel: UILabel = UILabel(title: "现在", fontSize: 9, color: UIColor.purple)
    //来源标签
    private lazy var sourceLabel: UILabel = UILabel(title: "来源", fontSize: 9, color: UIColor.purple)
}

extension OrderCellTopView {
    private func setupUI(){
        backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        //1.添加控件
        addSubview(iconView)
        addSubview(nameLabel)
        addSubview(memberIconView)
        addSubview(vipIconView)
        addSubview(timeLabel)
        addSubview(sourceLabel)
        //2.自动布局
        iconView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(OrderCellMargin)
            make.left.equalTo(self.snp_leftMargin).offset(OrderCellMargin)
            make.width.equalTo(OrderCellIconView)
            make.height.equalTo(OrderCellIconView)
        }
        nameLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(iconView.snp.top)
            make.left.equalTo(iconView.snp.right).offset(OrderCellMargin)
            
        }
        memberIconView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(nameLabel.snp.top)
            make.left.equalTo(nameLabel.snp.right).offset(OrderCellMargin)
        }
        vipIconView.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(iconView.snp_rightMargin)
            make.centerY.equalTo(iconView.snp_bottomMargin)
        }
        timeLabel.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(self.snp.bottom).offset(-OrderCellMargin)
            make.left.equalTo(iconView.snp.right).offset(OrderCellMargin)
        }
        sourceLabel.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(timeLabel.snp.bottom)
            make.left.equalTo(timeLabel.snp.right).offset(OrderCellMargin)
        }
    }
}

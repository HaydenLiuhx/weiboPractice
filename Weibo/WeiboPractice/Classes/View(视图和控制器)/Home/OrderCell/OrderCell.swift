//
//  StatusCell.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 25/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit

let OrderCellMargin: CGFloat = 12
let OrderCellIconView: CGFloat = 35

class OrderCell: UITableViewCell {
    
    var viewModle: OrderViewModel? {
        didSet {
            topView.viewModle = viewModle

            contentLabel.text = viewModle?.orderModel.notes
        }
    }
    //MARK:构造函数
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("error")
    }
    private lazy var topView: OrderCellTopView = OrderCellTopView()
    private lazy var contentLabel: UILabel = UILabel(title: "微博正文", fontSize: 15, color: UIColor.darkGray, screenInset: OrderCellMargin)
    private lazy var bottomView: OrderCellBottomView = OrderCellBottomView()
  
}

//MARK: 设置界面
extension OrderCell{
    private func setupUI() {
        //1.添加控件
        contentView.addSubview(topView)
        contentView.addSubview(contentLabel)
        //contentLabel.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 2*OrderCellMargin
        //2.自动布局
        topView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            //TODO: 修改高度
            //make.bottom.equalTo(contentView.snp_bottomMargin)
            
            make.height.equalTo(60)
            
        }
        contentLabel.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(topView.snp.bottom).offset(OrderCellMargin)
            make.left.equalTo(contentView.snp.left).offset(OrderCellMargin)
        }
    }
}

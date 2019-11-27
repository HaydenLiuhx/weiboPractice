//
//  OrderCellBottomView.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 25/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit

class OrderCellBottomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 懒加载控件
    /// 转发按钮
    private lazy var retweetedButton: UIButton = UIButton(title: " 转发", fontSize: 12, color: UIColor.darkGray, imageName: "timeline_icon_retweet")
    /// 评论按钮
    private lazy var commentButton: UIButton = UIButton(title: " 评论", fontSize: 12, color: UIColor.darkGray, imageName: "timeline_icon_comment")
    /// 点赞按钮
    private lazy var likeButton: UIButton = UIButton(title: " 赞", fontSize: 12, color: UIColor.darkGray, imageName: "timeline_icon_unlike")
}

extension OrderCellBottomView {
    private func setupUI() {
        backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    }
}

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
    private lazy var retweetedButton: UIButton = UIButton(title: " 转发", font_Size: 12, color: UIColor.darkGray, imageName: "timeline_icon_retweet")
    /// 评论按钮
    private lazy var commentButton: UIButton = UIButton(title: " 评论", font_Size: 12, color: UIColor.darkGray, imageName: "timeline_icon_comment")
    /// 点赞按钮
    private lazy var likeButton: UIButton = UIButton(title: " 赞", font_Size: 12, color: UIColor.darkGray, imageName: "timeline_icon_unlike")
}

extension OrderCellBottomView {
    private func setupUI() {
        backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        
            addSubview(retweetedButton)
            addSubview(commentButton)
            addSubview(likeButton)
            
            // 2. 自动布局
        retweetedButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
                make.bottom.equalTo(self.snp.bottom)
            }
            commentButton.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(retweetedButton.snp.top)
                make.left.equalTo(retweetedButton.snp.right)
                make.width.equalTo(retweetedButton.snp.width)
                make.height.equalTo(retweetedButton.snp.height)
            }
            likeButton.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(commentButton.snp.top)
                make.left.equalTo(commentButton.snp.right)
                make.width.equalTo(commentButton.snp.width)
                make.height.equalTo(commentButton.snp.height)
                
                make.right.equalTo(self.snp.right)
            }
            
            // 3. 分隔视图
            let sep1 = sepView()
            let sep2 = sepView()
            addSubview(sep1)
            addSubview(sep2)
            
            // 布局
            let w = 0.5
            let scale = 0.4
            
            sep1.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(retweetedButton.snp.right)
                make.centerY.equalTo(retweetedButton.snp.centerY)
                make.width.equalTo(w)
                make.height.equalTo(retweetedButton.snp.height).multipliedBy(scale)
            }
            sep2.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(commentButton.snp.right)
                make.centerY.equalTo(retweetedButton.snp.centerY)
                make.width.equalTo(w)
                make.height.equalTo(retweetedButton.snp.height).multipliedBy(scale)
            }
            
        
    }
    private func sepView() -> UIView {
        let v = UIView()
        
        v.backgroundColor = UIColor.purple
        
        return v
    }
}

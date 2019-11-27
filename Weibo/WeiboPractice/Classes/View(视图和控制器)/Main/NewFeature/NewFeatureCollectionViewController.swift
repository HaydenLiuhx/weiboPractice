//
//  NewFeatureCollectionViewController.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 22/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit
import SnapKit

//可重用Cell
private let WBNewFeatureViewCellId = "WBNewFeatureViewCellId"
//新特性图像的数量
private let WBNewFeatureImageCount = 4

class NewFeatureCollectionViewController: UICollectionViewController {

    //懒加载必须在控制器实例化之后被创建
    private lazy var layout = UICollectionViewFlowLayout()
    //MARK: -构造函数
    init() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = UIScreen.main.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        //构造函数，完成之后内部属性才会被创建
        super.init(collectionViewLayout: layout)
        
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        //collectionView.showsHorizontalScrollIndicator = false
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //注册kechongyongcell
        self.collectionView!.register(NewFeatureCell.self, forCellWithReuseIdentifier: WBNewFeatureViewCellId)

        // Do any additional setup after loading the view.
    }

   

    // MARK: UICollectionViewDataSource

  


    //每个分组中格子的数量
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return WBNewFeatureImageCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WBNewFeatureViewCellId, for: indexPath) as! NewFeatureCell
    
        // Configure the cell
        //cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.gray
        cell.imageIndex = indexPath.item
    
        return cell
    }
    //scrollview停止滚动方法
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //在最后一页才调用动画方法
        //根据contentOfset计算页数
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        if page != WBNewFeatureImageCount - 1{
            return
        }
        
        //cell播放动画
        let cell = collectionView.cellForItem(at: NSIndexPath(item: page, section: 0) as IndexPath) as! NewFeatureCell
        cell.showButtonAnim()
    }
}

//MARK: 新特性-Cell
private class NewFeatureCell: UICollectionViewCell {
    
    var imageIndex: Int = 0 {
        didSet {
            iconView.image = UIImage(named: "new_feature_\(imageIndex + 1)")
            
            //showButtonAnim()
            startButton.isHidden = true
        }
    }
    
    ///点击开始体验按钮
    @objc func clickStartButton() {
        print("- -")
    }
    
    
    
    //显示按钮动画
    func showButtonAnim() {
        startButton.isHidden = false
        startButton.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        startButton.isUserInteractionEnabled = false
        UIView.animate(withDuration: 2.0, //时长
                       delay: 0, //延时
                       usingSpringWithDamping: 0.8, //弹力系数
                       initialSpringVelocity: 10, //c初速度
                       options: [],
                       animations: {() -> Void in
                        self.startButton.transform = CGAffineTransform.identity
        }){(_) -> Void in
                        print("OK")
            self.startButton.isUserInteractionEnabled = true
        }
        
    }
    
    
    //frame的大小是layout。itemSize指定的
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //print(frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        //1.添加控件
        addSubview(iconView)
        addSubview(startButton)
        //2.指定位置
        iconView.frame = bounds
        startButton.snp.makeConstraints{
            (make) -> Void in
            make.centerX.equalTo(self.snp.centerX)
            //0.5中间，1最下边
            make.bottom.equalTo(self.snp.bottom).multipliedBy(0.75)
            
            //3.监听方法
            startButton.addTarget(self, action: #selector(clickStartButton), for: UIControl.Event.touchUpInside)
        }
    }
    
    //MARK: -懒加载控件
    ///图像
    private lazy var iconView: UIImageView = UIImageView()
    private lazy var startButton: UIButton = UIButton(title: "Start", fontSize: 16, color: UIColor.white, imageName: "new_feature_finish_button")
}

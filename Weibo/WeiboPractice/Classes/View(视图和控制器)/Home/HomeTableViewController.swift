//
//  HomeTableViewController.swift
//  WeiboPractice
//
//  Created by 刘皇逊 on 20/11/19.
//  Copyright © 2019 hayden. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD


private let OrderCellNormalId = "OrderCellNormalId"
class HomeTableViewController: VisitorTableViewController {
    //微博数据列表模型
    private lazy var listViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView?.setupInfo(imageName: nil, title: "Home Page")
        prepareTableView()
        loadData(1)
        
    }
    //测试
    private func loadData(_ id: Int) {
        listViewModel.loadD(id: id,  finished: { (isSuccessed) -> () in
            if !isSuccessed {
                SVProgressHUD.showInfo(withStatus: "Error")
                return
            }
            //print(self.listViewModel.orderList)
            self.tableView.reloadData()
       })
        
        
    }
    //准备表格
    private func prepareTableView() {
        //注册可重用cell
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCellNormalId)
        //临时行高
        //自动计算杭高，需要一个自上而下的
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
    }
//    private func dataLogin(_ userId: String, _ userPassword: String, _ id: Int)  {
//        // let dataList: [String: Any]
//
//        let parameters = ["email":userId ,"password":userPassword]
//        let url = URL(string: "https://www.wekol.com.au:8003/client/login/")!
//        //var dataList = [OrderModel]()
//        Alamofire.request(url, method:  .post, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: nil)
//            .validate()
//            .responseJSON { response in
//                if let v = response.result.value {
//                    let header: HTTPHeaders = ["token":JSON(v)["token"].stringValue]
//                    Alamofire.request("https://www.wekol.com.au:8003/order/getOpeningOrdersByUser",
//                                      method: .get,
//                                      parameters:["userId": 1],
//                                      encoding: URLEncoding.default,
//                                      //encoding: URLEncoding.default,
//                        headers: header
//                    )
//                        .responseJSON { (response) in
//                            if let json = response.result.value {
//                                //print(JSON(json))
//                                let array = JSON(json)["accepted_orders"]
//                                var datalist = [OrderModel]()
//                                for index in 0...(array.count-1) {
//                                    let model = OrderModel.init(jsonData: array[index])
//                                    //print(model)
//                                    datalist.append(model)
//                                }
//                                //                                print(dataList)
//                                //                                print(type(of: dataList))
//                                self.dataList = datalist
//                                self.tableView.reloadData()
//                            }
//
//                    }
//                }
//
//
//        }
//
//
//
//    }
//
    
    
}
//实现数据源方法
extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.orderList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderCellNormalId, for: indexPath) as! OrderCell
        //cell.textLabel?.text = dataList![indexPath.row].notes
       // cell.textLabel?.text = listViewModel.orderList[indexPath.row].orderModel.notes
        cell.viewModle = listViewModel.orderList[indexPath.row]
        return cell
    }
}

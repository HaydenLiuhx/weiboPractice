import UIKit
import Foundation
import Alamofire
import SwiftyJSON
 
 
typealias ReqRsponseSuccess = (_ response: AnyObject) -> Void
typealias ReqResponseFail = (_ error: AnyObject) -> Void
typealias NetworkStatus = (_ HTNetworkStatus: Int32) -> Void
 
@objc enum HTNetworkStatus: Int32 {
    case  HttpUnknow       = -1  //未知
    case  HttpNoReachable  = 0  // 无网络
    case  HttpWwan         = 1   //2g ， 3g 4g
    case  HttpWifi         = 2  // wifi
}
struct HTTPAPI {
 
// 设置公共域名或者Ip
    static let  hostName = ""
}
enum methodType {
    case RequestMethodGet
    case RequestMethodPost
}
 
 
class HttpNetWork: NSObject{
    
    //我也不知道干些什么
    typealias HttpCallBack = (_ result: AnyObject?, _ error: NSError?) -> ()
    //MARK: -应用程序信息
    
//   private let APP_ID = "wxa42e11f2c1bc528b";
//   private let  APP_SERECET = "49cc72b6f68a58655455244f1cbde412";
//   private let redirectUrl = "https://www.wekol.com.au/"
    
    //Singleton
    //1.创建类的实例变量
    //2.let是线程安全的
  // 对于单例实例来说，需要创建一个唯一对外输出实例的方法
    // 静态变量用static来处理
    static let singleton  = HttpNetWork()
    ///当前网络状态
    var htNetworkStatus: HTNetworkStatus = HTNetworkStatus.HttpWifi
    
    public func getRequestWith(url: String,
                          params:[String: Any]?,
                          header: HTTPHeaders,
                          success:@escaping ReqRsponseSuccess,
                          error:@escaping ReqResponseFail){
//        1、JSONEncoding.default 是放在HttpBody内的，   比如post请求
//        2、URLEncoding.default 在GET中是拼接地址的，    比如get请求
//        3、URLEncoding(destination: .methodDependent) 是自定义的URLEncoding，methodDependent的值如果是在GET 、HEAD 、DELETE中就是拼接地址的。其他方法方式是放在httpBody内的。
//        4、URLEncoding(destination: .httpbody)是放在httpbody内的
    Alamofire.request(url, method: .get, parameters: params, encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: Any]{
                    success(value as AnyObject)
                }
                break
                
            case .failure(let err):
                 error(err as AnyObject)
                break
            }
        }
    }
    
    public func postRequestWith(url: String,
                               params:[String: Any]?,
                               
                               success:@escaping ReqRsponseSuccess,
                               error:@escaping ReqResponseFail){
        
        Alamofire.request(url, method: .post, parameters: params, encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: Any]{
                    success(value as AnyObject)
                }
                break
                
            case .failure(let err):
                error(err as AnyObject)
                break
            }
            
        }
        
        
    }
    
    public func requestWith(url:String,
                              httpMethod: Int32,
                              params:[String: Any]?,
                              headers: HTTPHeaders,
                              success:@escaping ReqRsponseSuccess,
                              error:@escaping ReqResponseFail){
        
        let  httpUrl = HTTPAPI.hostName + url
        
// 设置公共请求参数
        var updict = params
        let token = UserDefaults.standard.string(forKey: "token")
        if  token != nil {
            updict?["access_token"] = token
        }
        updict?["IOS"] = "app_os"
        updict?["app_version"] = "1.0"
        updict?["device_id"] = UIDevice.current.identifierForVendor?.uuidString
 
        switch httpMethod {
        case 0:
            getRequestWith(url: httpUrl, params: updict, header: headers, success: success, error: error)
            
        case 1:
         postRequestWith(url: httpUrl, params: updict, success: success, error: error)
            
        default:
          break
            
        }
    }
    
    
 
    //切记私有化初始化方法，防止外部通过init直接创建实例。
    private override init() {
        
    }
}
 
 
 
 //MARK: OAuth相关方法
extension HttpNetWork{
    
}
 
 
//  网络状态监听
extension  HttpNetWork{
    
    public  func   monitoringNetwork (networkStatus:@escaping NetworkStatus){
        let reachability = NetworkReachabilityManager()
        reachability?.startListening()
        reachability?.listener = { [weak self] status in
//守护。guard语句判断其后的表达式布尔值为false时，才会执行之后代码块里的代码，如果为true，则跳过整个guard语句
            guard  let weakSelf = self else{ return }
            //?? 空和运算符 表示 reachability?.isReachable 如果不是有网 则为false；
            if reachability?.isReachable ?? false {
                switch status {
                case .notReachable:
                    weakSelf.htNetworkStatus = HTNetworkStatus.HttpNoReachable
                case .unknown:
                    weakSelf.htNetworkStatus = HTNetworkStatus.HttpUnknow
                case .reachable(.wwan):
                    weakSelf.htNetworkStatus = HTNetworkStatus.HttpWwan
                case .reachable(.ethernetOrWiFi):
                    weakSelf.htNetworkStatus = HTNetworkStatus.HttpWifi
                }
            }else{
               weakSelf.htNetworkStatus = HTNetworkStatus.HttpNoReachable
                
            }
            networkStatus(weakSelf.htNetworkStatus.rawValue)
        }
    }
    
    public func monitoringDataFormLocalWhenNetChanged() {
        self.monitoringNetwork{ (_) in
            
        }
    }
}

//MARK: 加载数据相关方法
extension HttpNetWork{
    
    ///加载数据
    func loadData(finished: @escaping HttpCallBack) {
        let dictionary = ["email":"lhx" ,
                          "password":"123"]
        HttpNetWork.singleton.requestWith(url: "https://www.wekol.com.au:8003/client/login", httpMethod: 1, params: dictionary, headers: ["":""], success: {(response) in
            let jsonDic = JSON(response)
            
            finished(jsonDic as AnyObject,nil)
        }, error: {(response) in
            let err = JSON(response)
            print(err)
            finished(nil, NSError(domain: "cn.itcast.error", code: -1001, userInfo: ["message":"token为空"]))
            return
        })
        
    }
}



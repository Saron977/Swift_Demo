//
//  HTTPRequset.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/5/16.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Moya
import RxSwift

//let HTTP_Provider = MoyaProvider<HttpApiManager>()
//
//// 纯Moya
//extension HttpApiManager: TargetType {
//    var baseURL: URL {
//        return URL(string: HTTP_Base_URL)!
//    }
//    
//    var path: String {
//        switch self {
//        case .HomePage:
//            return HTTP_HOME_BANNER
////        case .SuperMsg(let id, let sourceType):
////            return ""
//        }
//    }
//    
//    var method: Moya.Method {
//        return .post
//    }
//    
//    var headers: [String : String]? {
//        return [
//            "Channel" : "1246614006",
//            "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
//            "Platform" : "iOS",
//            "IMEI" : DeviceTool_UUID!,
//            "Version" : DeviceTool_CurrentAppVersion as! String,
//            "0":"UID"
//        ]
//        
//    }
//    
//    var sampleData: Data {
//        return Data(base64Encoded: "接口测试")!
//    }
//    
//    var task: Task {
//        switch self {
//        case .HomePage:
//            return Task.requestParameters(parameters: ["equipment": "ios","datefrom": "","dateto"       : ""], encoding: URLEncoding.queryString)
//        
//        }
//    }
//
//}

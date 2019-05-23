//
//  BaseModel.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/5/23.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import HandyJSON

extension ObservableType where E == Response{
    public func mapModel <T: HandyJSON>(_type: T.Type) -> Observable<T>{
        return flatMap { response -> Observable<T> in
            return Observable.just(response.mapModel(T.self))
        }
    }
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) -> T {
        var jsonString = String.init(data: data, encoding: .utf8)
        do {
            var dic_Source: Dictionary<String,Any> = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! Dictionary<String, Any>
            let code: Int = dic_Source["Code"] as! Int
            if code == 0 {
                let dic_Result: Dictionary<String,Any> = dic_Source["Result"] as! Dictionary<String, Any>
                let data_Result: Data = try! JSONSerialization.data(withJSONObject: dic_Result, options: [])
                jsonString = String.init(data: data_Result, encoding: .utf8)
            }else{
                
            }
        } catch _ {
            
        }
        return JSONDeserializer<T>.deserializeFrom(json: jsonString)!
    }
}


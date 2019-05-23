//
//  ChangeTool.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/5/23.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

/// Json -> Data
///
/// - Parameter jsonDic: 字典
/// - Returns: 返回data
func ChangeTool_JsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
    if (!JSONSerialization.isValidJSONObject(jsonDic)) {
        print("is not a valid json object")
        return nil
    }
    //利用自带的json库转换成Data
    //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
    let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
    //Data转换成String打印输出
    let str = String(data:data!, encoding: String.Encoding.utf8)
    //输出json字符串
    print("Json Str:\(str!)")
    return data
}


/// Data -> Json
///
/// - Parameter data: data
/// - Returns: 返回字典
func ChangeTool_DataToDictionary(data:Data) ->Dictionary<String, Any>?{
    do{
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        let dic = json as! Dictionary<String, Any>
        return dic
    }catch _ {
        print("失败")
        return nil
    }
}

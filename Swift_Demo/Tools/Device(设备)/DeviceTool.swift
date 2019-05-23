//
//  DeviceTool.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/5/20.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit

fileprivate let infoDic = Bundle.main.infoDictionary
// 获取uuid
let DeviceTool_UUID = UIDevice.current.identifierForVendor?.uuidString
//获取app当前版本号
let DeviceTool_CurrentAppVersion = infoDic?["CFBundleVersion"]



//
//  BaseTabbarController.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/4/25.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChildVC()
    }
    
    private func addChildVC() {
        
        /// 首页
        let mainVC = HomeMainVC()
        let mainNav = UINavigationController(rootViewController: mainVC)
        mainNav.tabBarItem.title = "首页"
        
        /// 行情
        let markVC = MarkMainVC()
        let markNav = UINavigationController(rootViewController: markVC)
        markNav.tabBarItem.title = "行情"
        
        /// 交易
        let tradeVC = TradeMainVC()
        let tradeNav = UINavigationController(rootViewController: tradeVC)
        tradeNav.tabBarItem.title = "交易"
        
        /// 其他
        let otherVC = OtherMainVC()
        let otherNav = UINavigationController(rootViewController: otherVC)
        otherNav.tabBarItem.title = "其他"
        
        /// 我的
        let meVC = MeMainVC()
        meVC.title = "我的"
        let meNav = UINavigationController(rootViewController: meVC)
        meNav.tabBarItem.title = "我的"
        
        let items = [mainNav,markNav,tradeNav,otherNav,meNav]
        self.viewControllers = items
        self.tabBar.barTintColor = UIColor.clear
        self.tabBar.backgroundColor = UIColor.red
    }
}

//
//  HomeMainVC.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/4/26.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class a{
    lazy var num = number()
}

class number {
    var count = 10
}

class HomeMainVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let springClass = SpringAnimate()
        let view_Back = springClass.springAnimateInit(view: self.view)
        self.view.addSubview(view_Back)
    }
}









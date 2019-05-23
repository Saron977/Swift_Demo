//
//  HomeMainVC.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/4/26.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa
import Result
import SnapKit


class HomeMainVC: BaseViewController {
   
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        
//        loadData { (success) in
//            if success{
//                print("成功")
//            }else{
//                print("失败")
//            }
//        }

    }
   
    func loadData() {
        HTTP_Provider.rx.request(.HomePage).filterSuccessfulStatusCodes().asObservable().mapModel(_type: HomeModel .self).subscribe { (event) in
            if let model = event.element{
                print(model)
            }else{
                print("当前事件:\(event)")
            }
        }
//        HTTP_Provider.request(.HomePage, callbackQueue: nil, progress: nil) { (result) in
//            switch result{
//            case let .success(result):
//                do{
//                    try print(result.mapJSON())
//                }catch{
//                    print(MoyaError.jsonMapping(result))
//                }
//            case let .failure(error):
//                print(error)
//            }
//        }
    }
    
//    func loadData(reqResult:(_ success: Bool) -> Void) {
//        HTTP_Provider.request(HttpApiManager.HomePage, callbackQueue: nil, progress: nil) { (result) in
//            switch result{
//            case let .success(result):
//                do {
//                try print(result.mapJSON())
//                }catch{
//                    print(MoyaError.jsonMapping(result))
//                }
//                break
//
//            case .failure(_): break
//
//            }
//        }
//    }

}

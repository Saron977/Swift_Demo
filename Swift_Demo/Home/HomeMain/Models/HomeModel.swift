//
//  HomeModel.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/5/23.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import HandyJSON

struct HomeModel_Advert : HandyJSON {
    var Link: String?
    var Url: String?
}

struct HomeModel_Live : HandyJSON {
    var next_title: String?
    var status: NSInteger?
}

struct HomeModel_StarTeacher : HandyJSON {
    var admin_id: String?
    var images: String?
    var images_block: String?
    var images_long: String?
    var realname: String?
    var win: String?
}

struct HomeModel : HandyJSON {
    var Advert: Array<HomeModel_Advert>?
    var Live: HomeModel_Live?
    var NewWelFare : Array<HomeModel_Advert>?
    var NewbieZone : Array<HomeModel_Advert>?
    var Solution   : HomeModel_Advert?
    var StarTeacher : Array<HomeModel_StarTeacher>?
}

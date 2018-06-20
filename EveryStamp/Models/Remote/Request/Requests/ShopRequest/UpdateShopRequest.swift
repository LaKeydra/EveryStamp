////
////  UpdateShopRequest.swift
////  EveryStamp
////
////  Created by zhaolin01 on 2018/6/10.
////  Copyright © 2018年 zhaolin. All rights reserved.
////
//
//import Foundation
//
//名称    类型    必须    说明
//access_token    string:32    yes    access token
//shop_id    number    yes    店铺ID
//type_id    number    yes    店铺类型ID
//name    string,1:255        店铺名称
//description    string,1:255        店铺简单描述
//latitude    float        经度
//longitude    float        纬度
//telephone    string,1:255        联系座机号码
//mobilephone    phone        联系手机号
//open_begin_time    date        店铺营业开始时间（如果要更新必须有成对填写，即开始时间和结束时间都需要填写）
//open_end_time    date        店铺营业结束时间（如果要更新必须有成对填写，即开始时间和结束时间都需要填写）
//stamp_begin_time    date        店铺集卡兑换开始时间（如果要更新必须有成对填写，即开始时间结束和时间都需要填写）
//stamp_end_time    date        店铺集卡兑换结束时间（如果要更新必须有成对填写，即开始时间和结束时间都需要填写）
//point_rules    string,1:255        集点规则
//controy    string,1:100        地址国家
//province    string,1:100        地址省份
//city    string,1:100        地址城市
//district    string,1:100        地址区域
//address    string,1:255        详细地址
//company    string,1:255        所属公司
//
//struct UpdateShopRequestModel {
//    var accessToken: String?
//    var shopId: Double?
//    var typeId: Double?
//    var name: String?
//    var description: String?
//    var latitude: Float?
//    var longitude: Float?
//    
//    
//    
//    
//    
//    
//    
//    
//}

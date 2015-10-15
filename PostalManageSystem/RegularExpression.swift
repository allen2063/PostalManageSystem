//
//  RegularExpression.swift
//  PostalManageSystem
//
//  Created by QiaoLibo on 15/10/15.
//  Copyright © 2015年 IOS-developer. All rights reserved.
//

//import Foundation

var rxJingWeiDu = NSRegularExpression.rx("^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$", ignoreCase:true)
var rxYouBian = NSRegularExpression.rx("[1-9]\\d{5}(?!\\d)", ignoreCase:true)
var rxLianXiDianHua = NSRegularExpression.rx("((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)", ignoreCase:true)
var rxJianZhuMianJi = NSRegularExpression.rx("^(([0-9]+.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*.[0-9]+)|([0-9]*[1-9][0-9]*))$", ignoreCase:true)
var rxFuWuRenKou = NSRegularExpression.rx("^(([0-9]+.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*.[0-9]+)|([0-9]*[1-9][0-9]*))$", ignoreCase:true)
var rxFuWuBanJing = NSRegularExpression.rx("^(([0-9]+.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*.[0-9]+)|([0-9]*[1-9][0-9]*))$", ignoreCase:true)
//
//  AppDelegate.h
//  PostalManageSystem
//
//  Created by ZengYifei on 15/8/18.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectionAPI.h"
#import "Pager.h"
#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain,nonatomic)NSString * titleForCurrentPage;
@property BOOL login;
@property (strong,nonatomic) ConnectionAPI * network;
@property (strong,nonatomic) Pager * pager;
//@property (strong,nonatomic) NSMutableDictionary * XMLDic;

@property (strong,nonatomic) NSMutableDictionary * interfaceTransform;
@property (strong,nonatomic) NSMutableDictionary * userData;
@property (strong,nonatomic) NSMutableDictionary * selectedCellData;
//@property (strong,nonatomic) NSMutableDictionary * interfaceTransformForBSDT;

//服务器数据回传给详情页面时的状态
//0代表不是服务器回传数据  无须取数据  即对应新增
//1代表是查看状态  显示服务器数据  但控件不响应  不可修改
//2代表是修改状态  显示服务器数据同时可以修改控件对应的内容
@property int ServerData;
@property (strong,nonatomic) NSMutableDictionary * applyResignDic;
@property (strong,nonatomic) NSMutableDictionary * applyAddDic;
@property (strong,nonatomic) NSMutableDictionary * applyPauseDic;
@property (strong,nonatomic) NSMutableDictionary * applyRestoreDic;
@property (strong,nonatomic) NSMutableDictionary * applyStopDic;
@property (strong,nonatomic) NSMutableDictionary * applyChangeDic;



@end


//
//  ConnectionAPI.h
//  LeXiang100 Direct Selling
//
//  Created by ZengYifei on 14-6-3.
//  Copyright (c) 2014年 ZengYifei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pager.h"
@interface ConnectionAPI : NSObject<NSXMLParserDelegate, NSURLConnectionDelegate >{
    //UIAlertView * alerts;
    float timeout;
    BOOL isback;
    BOOL isfault;
    int requestCount;
    NSString * communicatingInterface;
    NSNotificationCenter *nc;
    NSMutableDictionary * UserInfo;
    NSString * urlToServer;
    UIAlertView * alerts;
}
//unicoude转utf8
+(NSString *)replaceUnicode:(NSString *)unicodeStr ;
//读取XML
+(NSString *)readXMLStringWithFileName:(NSString *)name;
//图片转二进制
+ (NSData *)picToStringWithImage:(UIImage *)image;
//读取文件
+(NSMutableDictionary *)readFileDicWithFileName:(NSString *)flieName;
+(NSString *)documentsPath:(NSString *)fileName;
+(NSString *)readTXTStringWithFileName:(NSString *)name;
//md5加密
+ (NSString *)md5:(NSString *)str;
//登陆
- (void)loginWithToken:(NSString *)token AndUserName:(NSString *)userName AndUserPassword:(NSString *)userPassword;
//获取首页热点新闻的图片、标题、内容
- (void)getListWithToken:(NSString *)token AndType:(NSString *)type AndListPager:(Pager *)listPager;
//获取详情
- (void)getDetailViewWithToken:(NSString *)token AndID:(NSString *)ID;
//百度地图中附近邮局坐标
- (void)getPostOfiiceCoordinate;
//获取app用户列表
- (void)getUserList;
//全部申请查询
- (void)getAllApplyListWithToken:(NSString *)token AndType:(NSString *)type AndUserName:(NSString *)userName AndPlaceName:(NSString *)placeName AndState:(NSString *)state AndPager:(Pager *)pager;
//获取flowID
- (void)getFlowIDWithInterface:(NSString *)interface ANdToken:(NSString *)token AndFlowID:(NSString *)flowID;
//上传图片
-(NSString *)PostImagesToServer:(NSString *)strUrl dicPostParams:(NSMutableDictionary *)params dicImages:(NSMutableDictionary *) dicImages;
//修改
- (void)editWithInterface:(NSString *)interface AndInfo:(NSDictionary *)info AndExtraInfo:(id)extraInfo;
//删除表
- (void)deleteWithInterface:(NSString *)interface AndFlowID:(NSString *)flowID;
//获取XML版本信息
- (void)getXMLDate;
//获取XML数据
- (void)getXMLDataWithFileName:(NSString *)fileName;
//发送表详情
- (void)addWithInterface:(NSString *)interface AndUser:(id)user AndInfo:(id)info AndExtraInfo:(id)extraInfo;
//加入同步请求队列
- (void)addObjectForRequestQueueWithDci:(NSDictionary *)dic;
//修改用户信息
- (void)editUserInfoWithBaseUser:(NSDictionary *)baseUser;
@property (strong, nonatomic) NSMutableData *webData;
@property (strong, nonatomic) NSURLConnection *conn;
@property (strong, nonatomic) NSMutableString *getXMLResults;

@property (strong, nonatomic) NSMutableDictionary * cacheDic;
@property (strong, nonatomic) NSArray *resultArray;
@property (strong, nonatomic) NSString *specialInterface;

@property (strong, nonatomic) NSMutableArray * requestQueue;

@property    BOOL requestQueueThreadFinished;


@end

//
//  UploadPicViewController.h
//  PostalManageSystem
//
//  Created by ZengYifei on 15/9/13.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadPicViewController : UIViewController
//第一个参数state为yes代表是调用后上传  no代表是调用后查看  此时将图片的url传入第二个参数url   界面会隐藏上传等3个按钮  并且将图最大化   
//第二个参数url  需要显示图片时传rul   不需要显示时置为nil
//第三个参数count需要查看或上传的图片数  根据情况看是几张图片  目前只取撤销普遍和申请停限里面有两张图片
//第四个参数formName只有当第三个参数count为1时有效  传什么标题栏显示什么
-(id) initWithUploadState:(BOOL)uploadState AndUrl:(NSString *)url AndCountOfPic:(int )count AndFormName:(NSString *)formName;

//-(id) initWithCountOfPic:(int )count AndFormName:(NSString *)formName;

@property (strong,nonatomic) NSString * picUrl;
@end

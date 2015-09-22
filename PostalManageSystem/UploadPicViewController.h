//
//  UploadPicViewController.h
//  PostalManageSystem
//
//  Created by ZengYifei on 15/9/13.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadPicViewController : UIViewController
-(id) initWithCountOfPic:(int )count AndFormName:(NSString *)formName;
@property (strong,nonatomic) NSString * picUrl;
@end

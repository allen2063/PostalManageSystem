//
//  AppDelegate.m
//  PostalManageSystem
//
//  Created by ZengYifei on 15/8/18.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "GDataXMLNode.h"

@interface AppDelegate ()<UIWebViewDelegate,BMKGeneralDelegate>{
    BOOL isWriting;
}
@property (strong,nonatomic) BMKMapManager* mapManager;
@property (strong,nonatomic)UIView * backgroundView;
@property (strong,nonatomic)UIView * blackView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(qdgg:) name:@"qdgg" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(timeOut:) name:@"timeOut" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getXmlDate:) name:@"getXmlDate" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getXmlFilebyJson:) name:@"getXmlFilebyJson" object:nil];

//    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGBValue(0x028e45)];//邮政的绿色
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGBValue(0xea0d0d)];//邮政的红色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];    //导航栏按钮颜色
    self.titleForCurrentPage = @"贵阳市邮政管理局邮政普遍服务系统",//@"邮政普遍服务信息管理系统";
    self.login = NO;
    self.network = [[ConnectionAPI alloc]init];
    self.pager = [[Pager alloc]init];
    self.userData = [[NSMutableDictionary alloc]init];
    self.selectedCellData = [[NSMutableDictionary alloc]init];
//    self.interfaceTransformForBSDT = [[NSDictionary alloc]initWithObjectsAndKeys:@"Szxwd",@"设置新网点",@"Cxpbfwwd",@"撤销普遍服务网点",@"Cxfpbfwwd",@"撤销非普遍服务网点",@"Baxxbg",@"备案信息变更",@"Jjqz",@"就近迁址",@"Txyw",@"停限业务",@"Ztxyw",@"暂停限业务",@"Hfyw",@"恢复业务",@"0",@"未审核",@"1",@"审核未上传照片",@"2",@"审核已上传照片",@"3",@"审核未通过", nil];

    self.applyAddDic = [[NSMutableDictionary alloc]init];
    self.applyChangeDic = [[NSMutableDictionary alloc]init];
    self.applyPauseDic = [[NSMutableDictionary alloc]init];
    self.applyResignDic = [[NSMutableDictionary alloc]init];
    self.applyRestoreDic = [[NSMutableDictionary alloc]init];
    self.applyStopDic = [[NSMutableDictionary alloc]init];

    MainViewController * mainViewController = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    self.interfaceTransform = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"baseNewsApi/getNewsByType",@"满意度调查结果通告", nil];
    UINavigationController * navCon = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    self.window.rootViewController = navCon;
    [self.window makeKeyAndVisible];
   
    
    //加载画面
    [GMDCircleLoader setOnView:self.window withTitle:@"加载中..." animated:YES];

    //xml更新请求
    //    [self.network getXMLDate];
    NSDictionary * dics = [[NSDictionary alloc]initWithObjectsAndKeys:@"3",@"method", nil];
    [self.network addObjectForRequestQueueWithDci:dics];
    
    //启动公告
    Pager * pager = [[Pager alloc]init];
//    [self.network getListWithToken:@"jiou" AndType:@"qdgg" AndListPager:pager];
    NSDictionary * dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"qdgg",@"type",pager,@"pager",@"1",@"method", nil];
    [self.network addObjectForRequestQueueWithDci:dic];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(initQDGG) name:@"initQDGG" object:nil];

    [self initQDGG];
    
    _backgroundView.alpha = 0.8;
    
    //百度地图
    [self initBDTT];

    return YES;
}

- (void)getXmlDate:(NSNotification *)note{
    NSDictionary * dateDic = [[note userInfo]objectForKey:@"xmlDate"];
    NSArray * formNameArray = [dateDic allKeys];
    NSString * formNameString;
    //循环检测4个文件
    int i =1;
    for (formNameString in formNameArray) {
//        NSLog(@"读XML文件是否为空或者类型不匹配:%@",[NSString stringWithFormat:@"%@.archiver",formNameString]);
        NSMutableDictionary * XMLDic = [ConnectionAPI readFileDicWithFileName:[NSString stringWithFormat:@"%@.archiver",formNameString]];
        //xml不存在或者出错 则直接请求
        if (XMLDic == nil || ![XMLDic isKindOfClass:[NSDictionary class]] || [[XMLDic objectForKey:@"result"]isEqualToString:@"error"]) {
            //非队列请求
//            NSDictionary * dic = [[NSDictionary alloc]initWithObjectsAndKeys:formNameString,@"formNameString", nil];
//            [NSTimer scheduledTimerWithTimeInterval:5.0*i target: self selector: @selector(getXMLDataWithFileNames:) userInfo:dic repeats:NO];
//            [self.network getXMLDataWithFileName:formNameString];
            //队列请求
            NSDictionary * dics = [[NSDictionary alloc]initWithObjectsAndKeys:@"4",@"method",formNameString,@"FileName", nil];
            [self.network addObjectForRequestQueueWithDci:dics];
        }
        //如果返回检测版本信息返回结果成功
        else if ([[[note userInfo]objectForKey:@"result"]isEqualToString:@"1"]){
//            非队列请求
            NSDictionary * dic = [[NSDictionary alloc]initWithObjectsAndKeys:formNameString,@"formNameString",[dateDic objectForKey:formNameString],@"serverFormBuildTimeString" ,XMLDic , @"XMLDic", nil];
            [NSTimer scheduledTimerWithTimeInterval:0.01*i target: self selector: @selector(compareDate:) userInfo:dic repeats:NO];
//            [self compareDateWithFormName:formNameString AndFormBuildTime:[dateDic objectForKey:formNameString]];
        }
        i++;
    }
}

- (void)getXMLDataWithFileNames:(NSTimer *)timer{
    NSString * formNameString = [[timer userInfo] objectForKey:@"formNameString"];
//    [self.network getXMLDataWithFileName:formNameString];
    NSDictionary * dics = [[NSDictionary alloc]initWithObjectsAndKeys:@"4",@"method",formNameString,@"FileName", nil];
    [self.network addObjectForRequestQueueWithDci:dics];
}

//比较日期信息
//- (void)compareDateWithFormName:(NSString *)formNameString AndFormBuildTime:(NSString *)serverFormBuildTimeString{
- (void)compareDate:(NSTimer *)timer{
    NSString * formNameString = [[timer userInfo] objectForKey:@"formNameString"];
    NSString * serverFormBuildTimeString = [[timer userInfo] objectForKey:@"serverFormBuildTimeString"];
//    NSLog(@"读XML文件数据库版本信息:%@",[NSString stringWithFormat:@"%@.archiver",formNameString]);
    
    NSMutableDictionary * XMLDic = [[timer userInfo] objectForKey:@"XMLDic"];//[ConnectionAPI readFileDicWithFileName:[NSString stringWithFormat:@"%@.archiver",formNameString]];
    NSString * localFormBuildTimeString = [XMLDic objectForKey:[NSString stringWithFormat:@"%@ForTime",formNameString]];
    NSDate * localFormBuildTimeDate = [self dateFromString:localFormBuildTimeString];
    NSDate * serverFormBuildTimeDate = [self dateFromString:serverFormBuildTimeString];
    BOOL needUpdate = ![localFormBuildTimeDate isEqualToDate:serverFormBuildTimeDate];
    if (needUpdate) {
//        [self.network getXMLDataWithFileName:formNameString];
        NSDictionary * dics = [[NSDictionary alloc]initWithObjectsAndKeys:@"4",@"method",formNameString,@"FileName", nil];
        [self.network addObjectForRequestQueueWithDci:dics];
        
        NSLog(@"!!!要更新  localFormBuildTimeDate：%@   serverFormBuildTimeDate%@",localFormBuildTimeDate,serverFormBuildTimeDate);
    }else{
        if (self.network.requestQueueThreadFinished) {
            [GMDCircleLoader hideFromView:self.window animated:YES];
        }
    }
    
}

//string 转 date
- (NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

//
- (void)getXmlFilebyJson:(NSNotification *)note{
    //加载画面  如若已经加载则跳过
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSArray *subViewsArray = appDelegate.window.subviews;
    BOOL setOn = NO;
    for (UIView * aView in subViewsArray ) {
        if (aView.tag == 101 ||aView.tag == 102) {
            setOn = YES;
        }
    }
    if (!setOn) {
        [GMDCircleLoader setOnView:self.window withTitle:@"加载中..." animated:YES];
    }

    if (self.network.requestQueueThreadFinished) {
        [GMDCircleLoader hideFromView:self.window animated:YES];
    }
    //写入对应位置
    if (!isWriting) {
    isWriting = YES;
    NSDictionary * dic = [note userInfo];
    NSString * formNameString = [dic objectForKey:@"fileName"];
    NSString * fileDate = [dic objectForKey:@"fileDate"];
    NSString * data = [dic objectForKey:@"data"];
//    NSMutableDictionary * XMLDic = [ConnectionAPI readFileDicWithFileName:[NSString stringWithFormat:@"%@.archiver",formNameString]];
    
//    if (XMLDic == nil || ![XMLDic isKindOfClass:[NSDictionary class]] || [[XMLDic objectForKey:@"result"]isEqualToString:@"error"]) {
        NSMutableDictionary * XMLDic = [[NSMutableDictionary alloc]init];
//    }
       
    if ([[dic objectForKey: @"result"]isEqualToString:@"1"]) {
        [XMLDic setObject:data forKey:formNameString];
        [XMLDic setObject:fileDate forKey:[NSString stringWithFormat:@"%@ForTime",formNameString]];
        [self writeFileDic:XMLDic AndFileNameString:formNameString];
//        NSLog(@"form %@  %@",formNameString,writeResult ? @"写入缓存成功ConnectionAPI":@"写入缓存失败ConnectionAPI");
    }
    }
    //
    else{
        [NSTimer scheduledTimerWithTimeInterval:5.0 target: self selector: @selector(getXmlFilebyJson:) userInfo:note repeats:NO];
    }
    
}

- (BOOL)writeFileDic:(NSMutableDictionary *)dic AndFileNameString:(NSString *)formNameString{
    
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documents stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.archiver",formNameString]];//拓展名可以自己随便取
    
    BOOL writeResult =[NSKeyedArchiver archiveRootObject:dic toFile:path];
//    NSLog(@"form %@  %@   path:%@",formNameString,writeResult ? @"写入缓存成功ConnectionAPI":@"写入缓存失败ConnectionAPI",path);
    isWriting = NO;
    return writeResult;
}

//超时处理
- (void)timeOut:(NSNotification *)note{
    NSDictionary * dic = [note userInfo];
    [GMDCircleLoader hideFromView:self.window animated:YES];
    if ([[dic objectForKey:@"timeOut"]rangeOfString:@"timed out"].length != 0) {
        UIAlertView * alerts = [[UIAlertView alloc]init];
        if (alerts.visible != YES) {
            NSString * str = @"请检查您的网络！";
            if (dic != nil) {
                str = [dic objectForKey:@"timeOut"];
            }
            alerts = [alerts initWithTitle:@"网络请求超时" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alerts show];
        }

    }
    else if ([[dic objectForKey:@"timeOut"]rangeOfString:@"The network connection was lost"].length != 0){
        UIAlertView * alerts = [[UIAlertView alloc]init];
        if (alerts.visible != YES) {
            NSString * str = @"请检查您的网络！";
            if (dic != nil) {
                str = [dic objectForKey:@"timeOut"];
            }
            alerts = [alerts initWithTitle:@"网络出错" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alerts show];
        }

    }
}

- (void)initBDTT{
    
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8) {
//        //由于IOS8中定位的授权机制改变 需要进行手动授权
//        CLLocationManager  *locationManager = [[CLLocationManager alloc] init];
//        //获取授权认证
//        [locationManager requestAlwaysAuthorization];
//        [locationManager requestWhenInUseAuthorization];
//    }
    
    //百度地图
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"ZapzSYH7i8OrtOurZsCu7DGc"  generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
}

//启动公告UI初始化
- (void)initQDGG{
    _blackView = [[UIView alloc]initWithFrame:self.window.bounds];
    _blackView.alpha = 0.0;
    _blackView.backgroundColor = [UIColor blackColor];
    
    _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.window.frame.size.width*7/8, (self.window.frame.size.height - NAVIGATIONHEIGHT)*7/8)];
    _backgroundView.backgroundColor = [UIColor whiteColor];
    _backgroundView.center = CGPointMake(self.window.center.x, self.window.center.y*3);
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _backgroundView.frame.size.width, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 1;
    titleLabel.tag = 1 ;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [_backgroundView addSubview:titleLabel];
    
    UILabel * authorTimelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, _backgroundView.frame.size.width, 20)];
    authorTimelabel.textAlignment = NSTextAlignmentCenter;
    authorTimelabel.numberOfLines = 1;
    authorTimelabel.tag = 2 ;
    authorTimelabel.backgroundColor = [UIColor clearColor];
    authorTimelabel.font = [UIFont systemFontOfSize:13];
    [_backgroundView addSubview:authorTimelabel];
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 60, _backgroundView.frame.size.width, _backgroundView.frame.size.height - 60)];
    webView.tag = 3;
    webView.scrollView.bounces = NO;
    webView.delegate = self;
//    webView.scrollView.scrollEnabled = NO;
    [_backgroundView addSubview:webView];
}

- (void)qdgg:(NSNotification *)note{
    NSDictionary * dic = [[NSDictionary alloc]initWithDictionary:[note userInfo]];
    if ([[dic objectForKey:@"result"]isEqualToString:@"1"]) {
        NSDictionary * data = [dic objectForKey:@"data"];
        
        //设置标题
        UILabel * titleLabel = (UILabel *)[_backgroundView viewWithTag:1];
        titleLabel.text = [data objectForKey:@"title"];
        
        //设置作者时间
        UILabel * authorTimelabel = (UILabel *)[_backgroundView viewWithTag:2];
        NSString * tempString = [NSString stringWithFormat:@"%@",[data objectForKey:@"pubTime"]];
        tempString = [tempString substringToIndex:10];
        NSMutableString * authorTime = [[NSMutableString alloc]initWithString:[NSString stringWithFormat:@"时间:%@    作者:%@",tempString,[data objectForKey:@"author"]]];
        authorTimelabel.text = authorTime;
        
        UILabel * sepratorLine = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, _backgroundView.frame.size.width, 1)];
        sepratorLine.backgroundColor = [UIColor lightGrayColor];
        [_backgroundView addSubview:sepratorLine];
        
        //更改版式
        titleLabel.hidden = YES;
        authorTimelabel.hidden = YES;
        sepratorLine.hidden = YES;
        
        //添加确定按钮
        UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(0, _backgroundView.frame.size.height - 40, _backgroundView.frame.size.width, 40);
        [cancelBtn addTarget:self action:@selector(cancelView) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setTitle:@"确定" forState:UIControlStateNormal];
        cancelBtn.backgroundColor = UIColorFromRGBValue(0xea0d0d);
        [cancelBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [_backgroundView addSubview:cancelBtn];
        
//        //设置图片内容
//        if([[data objectForKey:@"imageUrl"] length] != 0){
//            NSString * url = [data objectForKey:@"imageUrl"];
//            NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
//            UIImage* image = [[UIImage alloc] initWithData:imageData];
//            UIImageView * imgView = [[UIImageView alloc]initWithImage:image];
//            //调整图片大小
//            //CGRect imgViewRect = imgView.frame;
//            CGFloat heightToWidthRatio = imgView.frame.size.height/imgView.frame.size.width;
//            imgView.frame = CGRectMake(0, 60, _backgroundView.frame.size.width, _backgroundView.frame.size.width * heightToWidthRatio);
//            
//            UITextView * detailTextView = (UITextView *)[_backgroundView viewWithTag:3];
//            detailTextView.frame = CGRectMake(0, 60 + imgView.frame.size.height, _backgroundView.frame.size.width, _backgroundView.frame.size.height - 60 - imgView.frame.size.height - cancelBtn.frame.size.height);
//            detailTextView.text = [data objectForKey:@"details"];
//            detailTextView.font = [UIFont systemFontOfSize:15];
//        }else{
            UIWebView * webView = (UIWebView *)[_backgroundView viewWithTag:3];
//            webView.frame = CGRectMake(0, 60 , _backgroundView.frame.size.width, _backgroundView.frame.size.height - 60 - cancelBtn.frame.size.height);
            webView.frame = CGRectMake(0, 0 , _backgroundView.frame.size.width, _backgroundView.frame.size.height - cancelBtn.frame.size.height);

            NSString * htmlString =[data objectForKey:@"details"];//@"然而电影艺术中的情色场景其实和别的场景在本质上没有太大区别，甚至还相对的更有表现性，通过展现人类最私密的情感，和最原始的欲望来揭示人性中最原本，也最普遍的东西：懦弱、恐惧、依赖、温暖、勾引、背叛，罪恶，或者是爱。国内对电影中*河蟹*场面的接受能力还是有限的，一些优秀的影片可能还因此被大刀一砍，再无缘和观众在电影院中见面。然而，即便在相对开放的欧美国家，尽管许多未删减的原版电影能够过审上映，影片中的情爱镜头仍会引起一波又一波的争议和批评，仿佛这是个人类亘古不变的话题，人们因此繁衍，却又因此获罪。今天八卦君为大家罗列了15部由于影片中的逼真情爱镜头而引起极大争议的电影，大家也一起评判一下，到底孰是孰非吧。丹麦导演拉斯·冯·提尔（Lars von Trier）执导的《女性瘾者》是一部讲述对*河蟹*病态依赖问题的电影，从一位女性瘾者的自述角度，讲述了她从出生到50岁的*河蟹*旅程。在这样的主题下，影片中出现大量*河蟹*场景也就情有可原了。然而，尽管电影包含的*河蟹*镜头看上去极为真实，主演们其实并没有真的“亲历亲为”。那么影片的拍摄是怎样实现的呢？事实上，希安·拉博夫（Shia LaBeouf），夏洛特·甘斯布（Charlotte Gainsbourg）和斯塔西·马汀（Stacy Martin）等演员在拍摄过程中，完全是穿着衣服的，他们会根据剧本的明确要求做出相应的动作，摆出具体的姿势。（想想就好尴尬呀~）其后，来自世界各地的*河蟹*演员们则会担任替身，拍摄那些比较棘手的色情场景。他们的身体会通过特效和主演们的身体合为一体，从而创造出真实和谐的*河蟹*场面。";
            [webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:htmlString]];
//        }
        [self.window addSubview:_backgroundView];
        [self.window addSubview:_blackView];
        
        [self.window bringSubviewToFront:_blackView];
        [self.window bringSubviewToFront:_backgroundView];
        //添加显示效果
        [UIView animateWithDuration:0.3 animations:^{
            _backgroundView.center = CGPointMake(self.window.center.x, (self.window.frame.size.height + NAVIGATIONHEIGHT)/2 );
            _blackView.alpha = 0.5;
        }];
    }
    //无启动公告
    else [GMDCircleLoader hideFromView:self.window animated:YES];
}

- (void)cancelView{
    [UIView animateWithDuration:0.3 animations:^{
        _backgroundView.center = CGPointMake(self.window.center.x, self.window.center.y*3);;
        _blackView.alpha = 0.0;
    } completion:^(BOOL finished){
        [_blackView removeFromSuperview];
        [_backgroundView removeFromSuperview];
    }];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [GMDCircleLoader hideFromView:self.window animated:YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [GMDCircleLoader setOnView:self.window withTitle:@"解析中..." animated:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

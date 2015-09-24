//
//  BaiduMapSearch.m
//  PostalManageSystem
//
//  Created by ZengYifei on 15/9/13.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

#import "BaiduMap.h"
#import "MyAnimatedAnnotationView.h"

#define BTNHEIGHT 44

#define TABLEVIEWCELLWIDTH 70
#define OffsetX 100
@interface BaiduMap ()<BMKMapViewDelegate,BMKLocationServiceDelegate,UITableViewDataSource,UITableViewDelegate>{
    AppDelegate *app;
    BOOL showLoginSetting;
    int zoom;
    UIView * blackView;
    BMKPointAnnotation* pointAnnotation;
    CGFloat userLatitude;
    CGFloat userLongitude;
}
@property (strong,nonatomic) BMKLocationService* locService;
@property (strong,nonatomic) BMKMapView* mapView;

@property (strong,nonatomic) UILabel * titleLabel;
@property (strong,nonatomic) UIButton * locationBtn;
@property (strong,nonatomic) UIButton * searchBtn;
@property (strong,nonatomic) UIButton * zoomInBtn;  //+
@property (strong,nonatomic) UIButton * zoomOutBtn; //-
@property (strong,nonatomic) UITableView * table;
@property (strong,nonatomic) UITableView * informationTbaleView;
@property (strong,nonatomic) NSMutableArray * dataList;
@property (strong,nonatomic) NSMutableArray * informationDataList;
@property (strong,nonatomic) NSMutableDictionary * cachaDicForPostOffice;
@end

@implementation BaiduMap
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.table =[[UITableView alloc]init];
        self.table.scrollEnabled = NO;
//        self.dataList = [[NSMutableArray alloc]initWithObjects:@"定位",@"搜索",@"放大",@"缩小", nil];
        self.dataList = [[NSMutableArray alloc]initWithObjects:@"2公里",@"5公里",@"10公里",@"20公里",@"贵阳市全部", nil];

        self.table.dataSource = self;
        self.table.delegate = self;
        self.table.frame = CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 60, 45, 0);
        [self.view addSubview:self.table];
        
        _informationTbaleView =[[UITableView alloc]init];
        _informationTbaleView.dataSource = self;
        _informationTbaleView.delegate = self;
        _informationTbaleView.frame = CGRectMake(0,0,UISCREENWIDTH *3/4, 0);
        _informationTbaleView.scrollEnabled = NO;
        [self.view addSubview:_informationTbaleView];
        
        _informationDataList = [[NSMutableArray alloc]init];
        
        _locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _locationBtn.frame = CGRectMake(UISCREENWIDTH - OffsetX, UISCREENHEIGHT - 60, 45, BTNHEIGHT);
        _locationBtn.backgroundColor = [UIColor whiteColor];
        _locationBtn.alpha = 0.8;
        [_locationBtn.layer setMasksToBounds:YES];
        [_locationBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
        [_locationBtn.layer setBorderWidth:1.0];   //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
        [_locationBtn.layer setBorderColor:colorref];//边框颜色
        [_locationBtn addTarget:self action:@selector(locationTap) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_locationBtn];
        
        UIImageView * locationImgView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH - OffsetX + 45/2 - BTNHEIGHT*7/10*4/5/2,UISCREENHEIGHT - 60 + BTNHEIGHT/10, BTNHEIGHT*7/10*4/5, BTNHEIGHT*4/5)];
//        UIImageView * locationImgView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH - OffsetX + BTNHEIGHT*1/10,UISCREENHEIGHT - 60 + BTNHEIGHT/10, BTNHEIGHT*4/5, BTNHEIGHT*4/5)];

        locationImgView.image = [UIImage imageNamed:@"locations"];
        locationImgView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:locationImgView];
        
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchBtn.frame = CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 60, 45, BTNHEIGHT);
        _searchBtn.backgroundColor = [UIColor whiteColor];
        _searchBtn.alpha = 0.8;
        [_searchBtn.layer setMasksToBounds:YES];
        [_searchBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
        [_searchBtn.layer setBorderWidth:1.0];   //边框宽度
        colorSpace = CGColorSpaceCreateDeviceRGB();
        colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
        [_searchBtn.layer setBorderColor:colorref];//边框颜色
        [_searchBtn addTarget:self action:@selector(searchfor) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_searchBtn];
        
        UIImageView * searchImgView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH - OffsetX + 45 + BTNHEIGHT*1/10,UISCREENHEIGHT - 60 + BTNHEIGHT/10, BTNHEIGHT*4/5, BTNHEIGHT*4/5)];
        searchImgView.image = [UIImage imageNamed:@"chazhao"];
        searchImgView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:searchImgView];
        
        _zoomInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _zoomInBtn.frame = CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 120, 45, BTNHEIGHT);
        _zoomInBtn.backgroundColor = [UIColor whiteColor];
        _zoomInBtn.alpha = 0.8;
        [_zoomInBtn.layer setMasksToBounds:YES];
        [_zoomInBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
        [_zoomInBtn.layer setBorderWidth:1.0];   //边框宽度
        colorSpace = CGColorSpaceCreateDeviceRGB();
        colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
        [_zoomInBtn.layer setBorderColor:colorref];//边框颜色
        [_zoomInBtn addTarget:self action:@selector(zoomIn) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_zoomInBtn];
        
        UIImageView * zoomInImgView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH - OffsetX + 45 + BTNHEIGHT*1/10,UISCREENHEIGHT - 120 + BTNHEIGHT/10, BTNHEIGHT*4/5, BTNHEIGHT*4/5)];
        zoomInImgView.image = [UIImage imageNamed:@"plus"];
        zoomInImgView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:zoomInImgView];
        
        _zoomOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _zoomOutBtn.frame = CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 164, 45, BTNHEIGHT);
        _zoomOutBtn.backgroundColor = [UIColor whiteColor];
        _zoomOutBtn.alpha = 0.8;
        [_zoomOutBtn.layer setMasksToBounds:YES];
        [_zoomOutBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
        [_zoomOutBtn.layer setBorderWidth:1.0];   //边框宽度
        colorSpace = CGColorSpaceCreateDeviceRGB();
        colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
        [_zoomOutBtn.layer setBorderColor:colorref];//边框颜色
        [_zoomOutBtn addTarget:self action:@selector(zoomOut) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_zoomOutBtn];
        
        UIImageView * zoomOutBtnImgView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH - OffsetX + 45 + BTNHEIGHT*1/10,UISCREENHEIGHT - 164 + BTNHEIGHT/10, BTNHEIGHT*4/5, BTNHEIGHT*4/5)];
        zoomOutBtnImgView.image = [UIImage imageNamed:@"minus"];
        zoomOutBtnImgView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:zoomOutBtnImgView];
        
        _cachaDicForPostOffice = [ConnectionAPI readFileDicWithFileName:@"cachaDicForPostOffice.archiver"];
            if (_cachaDicForPostOffice == nil) {
        _cachaDicForPostOffice = [[NSMutableDictionary alloc]init];
            }
    }
    return self;
}

- (void)zoomIn{
    _mapView.zoomLevel = ++zoom;
}

- (void)zoomOut{
    _mapView.zoomLevel = --zoom;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    
//    UIBarButtonItem *customRightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选项" style:UIBarButtonItemStyleBordered target:self action:@selector(snapshot)];
////    customRightBarButtonItem.title = @"截图";
//    self.navigationItem.rightBarButtonItem = customRightBarButtonItem;

    //获取单例  getWdxxList
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getWdxxList:) name:@"getWdxxList" object:nil];

    //设置导航栏label
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.textColor = [UIColor yellowColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = app.titleForCurrentPage;
    self.navigationItem.titleView = _titleLabel;
    
    
    
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, NAVIGATIONHEIGHT, UISCREENWIDTH, UISCREENHEIGHT - NAVIGATIONHEIGHT)];
    [self.view addSubview: _mapView];
    
    BMKCoordinateRegion region;
    region.center.latitude  = 26.636333;
    region.center.longitude = 106.642856;
    region.span.latitudeDelta  = 0.2;
    region.span.longitudeDelta = 0.2;
    
    _mapView.region = region;
//    self.view = _mapView;
    //初始化BMKLocationService
    
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    
    [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
    [BMKLocationService setLocationDistanceFilter:100.f];
}

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    
    [app.network getPostOfiiceCoordinate];
    
    zoom = 15;
    _mapView.zoomLevel = zoom;
    
    blackView = [[UIView alloc]initWithFrame:self.view.bounds];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.0;
    [self.view addSubview:blackView];
    [self.view sendSubviewToBack:blackView];
}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

//截图
-(void)searchfor
{
    NSLog(@"search");
    if (showLoginSetting ==YES) {
        showLoginSetting = NO;
        [self cancelView];
    }else{
        showLoginSetting = YES;
        _table.hidden = NO;
        [self showTableViewWithTableView:_table];
    }
}

#pragma mark - BMKMapViewDelegate

- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"BMKMapView控件初始化完成" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
//    [alert show];
    alert = nil;
}

- (void)mapView:(BMKMapView *)mapView onClickedMapPoi:(BMKMapPoi*)mapPoi
{
    NSLog(@"onClickedMapPoi-%@",mapPoi.text);
//    NSString* showmeg = [NSString stringWithFormat:@"您点击了底图标注:%@,\r\n当前经度:%f,当前纬度:%f,\r\nZoomLevel=%d;RotateAngle=%d;OverlookAngle=%d", mapPoi.text,mapPoi.pt.longitude,mapPoi.pt.latitude, (int)_mapView.zoomLevel,_mapView.rotation,_mapView.overlooking];
}

- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate {
    NSLog(@"map view: click blank");
}

- (void)mapview:(BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate {
    NSLog(@"map view: double click");
}

//添加标注
- (void)addPointAnnotation
{
    NSMutableArray * postOfficeArray = [_cachaDicForPostOffice objectForKey:@"listArray"];
    if (postOfficeArray != nil) {
        switch (zoom) {
                //2KM
            case 15:
                for (NSDictionary *dic in postOfficeArray) {
                    CGFloat jd = [[dic objectForKey:@"jd"]floatValue];
                    CGFloat wd = [[dic objectForKey:@"wd"]floatValue];
                    BMKMapPoint point1 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(wd,jd));//服务器第一个返回
                    BMKMapPoint point2 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(userLatitude,userLongitude));//用户GPS信息
                    CLLocationDistance distance = BMKMetersBetweenMapPoints(point1,point2);
                    //计算距离
                    if (distance < 2000) {
                        pointAnnotation = [[BMKPointAnnotation alloc]init];
                        CLLocationCoordinate2D coor;
                        coor.latitude = wd;
                        coor.longitude = jd;
                        pointAnnotation.coordinate = coor;
                        pointAnnotation.title = [dic objectForKey:@"wdmc"];
                        pointAnnotation.subtitle = @"点此查看详细信息";
                        [_mapView addAnnotation:pointAnnotation];
                    }
                }
                break;
                //5KM
            case 14:
                for (NSDictionary *dic in postOfficeArray) {
                    CGFloat jd = [[dic objectForKey:@"jd"]floatValue];
                    CGFloat wd = [[dic objectForKey:@"wd"]floatValue];
                    BMKMapPoint point1 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(wd,jd));//服务器第一个返回
                    BMKMapPoint point2 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(userLatitude,userLongitude));//用户GPS信息
                    CLLocationDistance distance = BMKMetersBetweenMapPoints(point1,point2);//2944米  无需转换
                    //计算距离
                    if (distance < 5000) {
                        pointAnnotation = [[BMKPointAnnotation alloc]init];
                        CLLocationCoordinate2D coor;
                        coor.latitude = wd;
                        coor.longitude = jd;
                        pointAnnotation.coordinate = coor;
                        pointAnnotation.title = [dic objectForKey:@"wdmc"];
                        pointAnnotation.subtitle = @"点此查看详细信息";
                        [_mapView addAnnotation:pointAnnotation];
                    }
                }
                break;
                //10KM
            case 13:
                for (NSDictionary *dic in postOfficeArray) {
                    CGFloat jd = [[dic objectForKey:@"jd"]floatValue];
                    CGFloat wd = [[dic objectForKey:@"wd"]floatValue];
                    BMKMapPoint point1 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(wd,jd));//服务器第一个返回
                    BMKMapPoint point2 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(userLatitude,userLongitude));//用户GPS信息
                    CLLocationDistance distance = BMKMetersBetweenMapPoints(point1,point2);//2944米  无需转换
                    //计算距离
                    if (distance < 10000) {
                        pointAnnotation = [[BMKPointAnnotation alloc]init];
                        CLLocationCoordinate2D coor;
                        coor.latitude = wd;
                        coor.longitude = jd;
                        pointAnnotation.coordinate = coor;
                        pointAnnotation.title = [dic objectForKey:@"wdmc"];
                        pointAnnotation.subtitle = @"点此查看详细信息";
                        [_mapView addAnnotation:pointAnnotation];
                    }
                }
                break;
                //20KM
            case 12:
                for (NSDictionary *dic in postOfficeArray) {
                    CGFloat jd = [[dic objectForKey:@"jd"]floatValue];
                    CGFloat wd = [[dic objectForKey:@"wd"]floatValue];
                    BMKMapPoint point1 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(wd,jd));//服务器第一个返回
                    BMKMapPoint point2 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(userLatitude,userLongitude));//用户GPS信息
                    CLLocationDistance distance = BMKMetersBetweenMapPoints(point1,point2);//2944米  无需转换
                    //计算距离
                    if (distance < 20000) {
                        pointAnnotation = [[BMKPointAnnotation alloc]init];
                        CLLocationCoordinate2D coor;
                        coor.latitude = wd;
                        coor.longitude = jd;
                        pointAnnotation.coordinate = coor;
                        pointAnnotation.title = [dic objectForKey:@"wdmc"];
                        pointAnnotation.subtitle = @"点此查看详细信息";
                        [_mapView addAnnotation:pointAnnotation];
                    }
                }
                break;
                //全市
            case 10:
                for (NSDictionary *dic in postOfficeArray) {
                    NSLog(@"要显示的坐标：jd%@ wd%@",[dic objectForKey:@"jd"],[dic objectForKey:@"wd"]);
                    CGFloat jd = [[dic objectForKey:@"jd"]floatValue];
                    CGFloat wd = [[dic objectForKey:@"wd"]floatValue];
                    //计算距离
                    pointAnnotation = [[BMKPointAnnotation alloc]init];
                    CLLocationCoordinate2D coor;
                    coor.latitude = wd;
                    coor.longitude = jd;
                    pointAnnotation.coordinate = coor;
                    
                    pointAnnotation.title = [dic objectForKey:@"wdmc"];
                    pointAnnotation.subtitle = @"点此查看详细信息";
                    [_mapView addAnnotation:pointAnnotation];
                }
                break;
            default:
                break;
        }
    }
}

// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
{
    CLLocationCoordinate2D tempCoordinate = view.annotation.coordinate;
    NSArray * tempArray = [_cachaDicForPostOffice objectForKey:@"listArray"];
    [_informationDataList removeAllObjects];
    for(NSDictionary * dic in tempArray){
        CGFloat jd = [[dic objectForKey:@"jd"]floatValue];
        CGFloat wd = [[dic objectForKey:@"wd"]floatValue];
        
        if (tempCoordinate.latitude == wd && tempCoordinate.longitude == jd) {
            NSString * placeNameStirng = [dic objectForKey:@"wdmc"];
            placeNameStirng = [NSString stringWithFormat:@"营业场所名称：%@",placeNameStirng];
            [_informationDataList addObject:placeNameStirng];
            
            NSString * personNameStirng = [dic objectForKey:@"fzrxm"];
            personNameStirng = [NSString stringWithFormat:@"联系人姓名：%@",personNameStirng];
            [_informationDataList addObject:personNameStirng];
            
            NSString * telStirng = [dic objectForKey:@"fzrdh"];
            telStirng = [NSString stringWithFormat:@"联系人电话：%@",telStirng];
            [_informationDataList addObject:telStirng];
            
            NSString * serviceScopeStirng = [dic objectForKey:@"ywfw"];
            serviceScopeStirng = [NSString stringWithFormat:@"业务范围：%@",serviceScopeStirng];
            [_informationDataList addObject:serviceScopeStirng];
            
            NSString * timeStirng = [dic objectForKey:@"yysj"];
            timeStirng = [NSString stringWithFormat:@"营业时间：%@",timeStirng];
            [_informationDataList addObject:timeStirng];
            [_informationTbaleView reloadData];
            
            [self showTableViewWithTableView: _informationTbaleView];
            break;
        }
    }

    NSLog(@"paopaoclick");
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
//    view.paopaoView.hidden = YES;
    CLLocationCoordinate2D tempCoordinate = view.annotation.coordinate;
    BMKCoordinateRegion region;
    region.center.latitude  = tempCoordinate.latitude;
    region.center.longitude = tempCoordinate.longitude;
    #warning 根据zoom调这里
    _mapView.region = region;
    _mapView.zoomLevel = zoom;
    NSLog(@"tempCoordinate%f %f",tempCoordinate.latitude , tempCoordinate.latitude);
}

// 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    //普通annotation
    if (annotation == pointAnnotation) {
        NSString *AnnotationViewID = @"renameMark";
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            // 设置颜色
            annotationView.pinColor = BMKPinAnnotationColorPurple;
            // 从天上掉下效果
            annotationView.animatesDrop = YES;
            // 设置可拖拽
            annotationView.draggable = YES;
        }
        return annotationView;
    }
    
    //动画annotation
    NSString *AnnotationViewID = @"AnimatedAnnotation";
    MyAnimatedAnnotationView *annotationView = nil;
    if (annotationView == nil) {
        annotationView = [[MyAnimatedAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"poi_%d.png", i]];
        [images addObject:image];
    }
    annotationView.annotationImages = images;
    return annotationView;
}

- (void)locationTap{
    NSLog(@"location");
    [_locService startUserLocationService];
}

#pragma -mark 处理位置信息更新
//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    BMKCoordinateRegion region;
    region.center.latitude  = userLocation.location.coordinate.latitude;
    region.center.longitude = userLocation.location.coordinate.longitude;
    region.span.latitudeDelta  = 0.2;
    region.span.longitudeDelta = 0.2;
    if (userLocation.location.coordinate.latitude != 0  || userLocation.location.coordinate.longitude != 0)
    {
        _mapView.region = region;
        NSLog(@"当前的坐标是: %f,%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
        
//        CLLocationCoordinate2D test = CLLocationCoordinate2DMake(userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
        //转换GPS坐标至百度坐标
//        NSDictionary* testdic = BMKConvertBaiduCoorFrom(test,BMK_COORDTYPE_GPS);
//        NSLog(@"x=%@,y=%@",[testdic objectForKey:@"x"],[testdic objectForKey:@"y"]);

        
        userLatitude = userLocation.location.coordinate.latitude;
        userLongitude = userLocation.location.coordinate.longitude;
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@" %f",userLatitude] message:[NSString stringWithFormat:@" %f",userLongitude] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
//        [alert show];
        
        [_locService stopUserLocationService];
       
    }
    NSLog(@"heading is %@",userLocation.heading);
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}

#pragma -mark 网络请求返回
- (void)getWdxxList:(NSNotification *)note{
    NSDictionary * tempDic = [[NSDictionary alloc]initWithDictionary:[note userInfo]];
    if ([[tempDic objectForKey:@"result"]isEqualToString:@"1"]) {
        //坐标转换
        NSMutableArray *coordinateArray = [tempDic objectForKey:@"list"];
        if ([coordinateArray isKindOfClass:[NSArray class]]) {
            NSMutableDictionary * dic;
            NSMutableArray * resultArray = [[NSMutableArray alloc]init];
            for(int i = 0;i<coordinateArray.count; i++){
                dic = [[NSMutableDictionary alloc]initWithDictionary:[coordinateArray objectAtIndex:i]];
                NSString * jdString = [dic objectForKey:@"jd"];
                NSString * wdString = [dic objectForKey:@"wd"];
                CGFloat jd = [jdString floatValue];
                CGFloat wd = [wdString floatValue];
                
                CLLocationCoordinate2D test = CLLocationCoordinate2DMake(wd, jd);
                //转换 google地图、soso地图、aliyun地图、mapabc地图和amap地图所用坐标至百度坐标
                NSDictionary* testdic = BMKConvertBaiduCoorFrom(test,BMK_COORDTYPE_COMMON);
                //解密坐标
                CLLocationCoordinate2D trans = BMKCoorDictionaryDecode(testdic);
                jdString = [NSString stringWithFormat:@"%.6f",trans.longitude ] ;
                wdString = [NSString stringWithFormat:@"%.6f",trans.latitude ];
                NSLog(@"转换坐标：jd%@,wd%@",jdString,wdString);
                [dic setObject:jdString forKey:@"jd"];
                [dic setObject:wdString forKey:@"wd"];
                [resultArray addObject:dic];
            }
            [_cachaDicForPostOffice setObject:resultArray forKey:@"listArray"];
        }else if([coordinateArray isKindOfClass:[NSDictionary class]]){
//            NSDictionary * coordinateDic = [tempDic objectForKey:@"list"];
        }
    }
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _table) {
        return [self.dataList count];
    }else{
        return _informationDataList.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //这样写在IOS7.0以后 TableViewCell的分割线就不会往右挫15个像素点了
    [tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (tableView == _table) {
        cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
        //    cell.backgroundColor = UIColorFromRGBValue(0x028e45);
        //    cell.textLabel.textColor = [UIColor yellowColor];
    }else{
        cell.textLabel.text = [_informationDataList objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.alpha = 0.8;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    if (tableView == _informationTbaleView) {
        return;
    }
    switch (indexPath.row) {
        case 0:{
            //            NSLog(@"定位");
            //            [self locationTap];
            //2公里
            zoom = 15;
            _mapView.zoomLevel = zoom;
        }
            break;
        case 1:{
            //            NSLog(@"搜索");
            //5km
            zoom = 14;
            _mapView.zoomLevel = zoom;
        }
            break;
        case 2:{
            //            _mapView.zoomLevel = ++zoom;
            //            NSLog(@"放大  %d",zoom);
            //10km
            zoom = 13;
            _mapView.zoomLevel = zoom;
        }
            break;
        case 3:{
            //            _mapView.zoomLevel = --zoom;
            //            NSLog(@"缩小  %d",zoom);
            //20km
            zoom = 12;
            _mapView.zoomLevel = zoom;
        }
            break;
        case 4:{
            //            _mapView.zoomLevel = --zoom;
            //            NSLog(@"缩小  %d",zoom);
            //贵阳全市
            zoom = 10;
            _mapView.zoomLevel = zoom;
        }
            break;
        default:
            break;
    }
    
    BMKCoordinateRegion region;
    region.center.latitude  = userLatitude;
    region.center.longitude = userLongitude;
    _mapView.region = region;
    _mapView.zoomLevel = zoom;
    
    [_mapView removeOverlays:_mapView.overlays];
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    [self addPointAnnotation];
    [self cancelView];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *  headString;
    if (tableView == _table) {
        headString = @"设置查询距离范围";
    }else{
        headString = @"网点详细信息";
    }
    return headString;
}


- (void)showTableViewWithTableView:(UITableView *)tableView{
    [self.view bringSubviewToFront:blackView];
    if (tableView != _informationTbaleView) {
        [self.view bringSubviewToFront:self.table];
        [UIView animateWithDuration:0.3 animations:^{
            self.table.frame = CGRectMake(UISCREENWIDTH/8 , NAVIGATIONHEIGHT + 60, UISCREENWIDTH*3/4, 20+44*self.dataList.count);
            blackView.alpha = 0.5;
        }];
    }else{
        [self.view bringSubviewToFront:_informationTbaleView];
        _informationTbaleView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            _informationTbaleView.frame = CGRectMake(UISCREENWIDTH/10 , NAVIGATIONHEIGHT + 60, UISCREENWIDTH*4/5, 30+44*5);
            _informationTbaleView.center = self.view.center;
            blackView.alpha = 0.5;
        }];
    }
    
}

-(void)cancelView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.table.frame =  CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 60, 45, 0);
        blackView.alpha = 0.0;
        _informationTbaleView.frame = CGRectMake(UISCREENWIDTH/2 - UISCREENWIDTH *3/8,UISCREENHEIGHT/2,UISCREENWIDTH *3/4, 0);
        _informationTbaleView.center = self.view.center;
    }
    completion:^(BOOL finished) {
        [self.view sendSubviewToBack:blackView];
        _table.hidden = YES;
        _informationTbaleView.hidden = YES;
        }
     ];
}

#pragma mark - touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    if (touch.view == blackView) {
        [self cancelView];
    }
}

#pragma mark - 写缓存
- (void)writeFileDic{
    //写入对应位置
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documents stringByAppendingPathComponent:@"cachaDicForPostOffice.archiver"];//拓展名可以自己随便取
    
    BOOL writeResult =[NSKeyedArchiver archiveRootObject:_cachaDicForPostOffice toFile:path];
    NSLog(@"%@",writeResult ? @"写入缓存成功ConnectionAPI":@"写入缓存失败cachaDicForPostOffice.archiver");
}

@end

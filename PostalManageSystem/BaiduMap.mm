//
//  BaiduMapSearch.m
//  PostalManageSystem
//
//  Created by ZengYifei on 15/9/13.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

#import "BaiduMap.h"
#define BTNHEIGHT 44

#define TABLEVIEWCELLWIDTH 70
#define OffsetX 100
@interface BaiduMap ()<BMKMapViewDelegate,BMKLocationServiceDelegate,UITableViewDataSource,UITableViewDelegate>{
    AppDelegate *app;
    BOOL showLoginSetting;
    int zoom;
    UIView * blackView;
}
@property (strong,nonatomic) BMKLocationService* locService;
@property (strong,nonatomic) BMKMapView* mapView;

@property (strong,nonatomic) UILabel * titleLabel;
@property (strong,nonatomic) UIButton * locationBtn;
@property (strong,nonatomic) UIButton * searchBtn;
@property (strong,nonatomic) UIButton * zoomInBtn;  //+
@property (strong,nonatomic) UIButton * zoomOutBtn; //-

@property (strong,nonatomic) UITableView * table;
@property (strong,nonatomic) NSMutableArray * dataList;

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
        self.table.frame = CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 60, 45, BTNHEIGHT);
        [self.view addSubview:self.table];

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    
    UIBarButtonItem *customRightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选项" style:UIBarButtonItemStyleBordered target:self action:@selector(snapshot)];
//    customRightBarButtonItem.title = @"截图";
    self.navigationItem.rightBarButtonItem = customRightBarButtonItem;

    //获取单例
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //设置导航栏label
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.textColor = [UIColor yellowColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = app.titleForCurrentPage;
    self.navigationItem.titleView = _titleLabel;
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, NAVIGATIONHEIGHT, UISCREENWIDTH, UISCREENHEIGHT - NAVIGATIONHEIGHT)];
    [self.view addSubview: _mapView];
//    self.view = _mapView;
    [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
    [BMKLocationService setLocationDistanceFilter:100.f];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    
    zoom = 15;
    _mapView.zoomLevel = zoom;
    
    blackView = [[UIView alloc]initWithFrame:self.view.bounds];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.0;
    [self.view addSubview:blackView];
    [self.view sendSubviewToBack:blackView];

    
    _locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _locationBtn.frame = CGRectMake(UISCREENWIDTH - OffsetX, UISCREENHEIGHT - 60, 45, BTNHEIGHT);
    _locationBtn.backgroundColor = [UIColor whiteColor];
    [_locationBtn.layer setMasksToBounds:YES];
    [_locationBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
    [_locationBtn.layer setBorderWidth:1.0];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
    [_locationBtn.layer setBorderColor:colorref];//边框颜色
    [_locationBtn addTarget:self action:@selector(locationTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_locationBtn];
    
    UIImageView * locationImgView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH - OffsetX + 45/2 - BTNHEIGHT*7/10*4/5/2,UISCREENHEIGHT - 60 + BTNHEIGHT/10, BTNHEIGHT*7/10*4/5, BTNHEIGHT*4/5)];
    locationImgView.image = [UIImage imageNamed:@"locations"];
    locationImgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:locationImgView];
    
    _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchBtn.frame = CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 60, 45, BTNHEIGHT);
    _searchBtn.backgroundColor = [UIColor whiteColor];
    [_searchBtn.layer setMasksToBounds:YES];
    [_searchBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
    [_searchBtn.layer setBorderWidth:1.0];   //边框宽度
    colorSpace = CGColorSpaceCreateDeviceRGB();
    colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
    [_searchBtn.layer setBorderColor:colorref];//边框颜色
    [_searchBtn addTarget:self action:@selector(snapshot) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchBtn];
    
    UIImageView * searchImgView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH - OffsetX + 45 + BTNHEIGHT*1/10,UISCREENHEIGHT - 60 + BTNHEIGHT/10, BTNHEIGHT*4/5, BTNHEIGHT*4/5)];
    searchImgView.image = [UIImage imageNamed:@"chazhao"];
    searchImgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:searchImgView];
    
//    _zoomInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    _zoomInBtn.frame = CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 60, 45, BTNHEIGHT);
//    _zoomInBtn.backgroundColor = [UIColor whiteColor];
//    [_zoomInBtn.layer setMasksToBounds:YES];
//    [_zoomInBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
//    [_zoomInBtn.layer setBorderWidth:1.0];   //边框宽度
//    colorSpace = CGColorSpaceCreateDeviceRGB();
//    colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
//    [_zoomInBtn.layer setBorderColor:colorref];//边框颜色
//    [_zoomInBtn addTarget:self action:@selector(showTableView) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_zoomInBtn];
}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

//截图
-(void)snapshot
{
    NSLog(@"erfwe");
    if (showLoginSetting ==YES) {
        showLoginSetting = NO;
        [self cancelView];
    }else{
        showLoginSetting = YES;
        _table.hidden = NO;
        [self showTableViews];
    }
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //这样写在IOS7.0以后 TableViewCell的分割线就不会往右挫15个像素点了
    [tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
//    cell.backgroundColor = UIColorFromRGBValue(0x028e45);
//    cell.textLabel.textColor = [UIColor yellowColor];
    cell.alpha = 0.8;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    switch (indexPath.row) {
        case 0:{
//            NSLog(@"定位");
//            [self locationTap];
        }
            break;
        case 1:{
//            NSLog(@"搜索");
            
        }
            break;
        case 2:{
//            _mapView.zoomLevel = ++zoom;
//            NSLog(@"放大  %d",zoom);

        }
            break;
        case 3:{
//            _mapView.zoomLevel = --zoom;
//            NSLog(@"缩小  %d",zoom);

        }
            break;
        default:
            break;
    }
    [self cancelView];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *  headString = @"设置查询距离范围";
    return headString;
}


- (void)showTableViews{
    [self.view bringSubviewToFront:blackView];
    [self.view bringSubviewToFront:self.table];
    [UIView animateWithDuration:0.3 animations:^{
        self.table.frame = CGRectMake(UISCREENWIDTH/8 , NAVIGATIONHEIGHT + 60, UISCREENWIDTH*3/4, 20+44*self.dataList.count);
        blackView.alpha = 0.5;
    }];
}

-(void)cancelView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.table.frame =  CGRectMake(UISCREENWIDTH - OffsetX + 45, UISCREENHEIGHT - 60, 45, 0);
        blackView.alpha = 0.0;
    }
     completion:^(BOOL finished) {
         [self.view sendSubviewToBack:blackView];
         _table.hidden = YES;
     }
     ];
    
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
    if (_mapView)
    {
        _mapView.region = region;
        NSLog(@"当前的坐标是: %f,%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
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

#pragma mark - touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    if (touch.view == blackView) {
        [self cancelView];
    }
    
}

@end

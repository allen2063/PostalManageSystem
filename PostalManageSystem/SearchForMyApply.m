//
//  SearchForMyApply.m
//  PostalManageSystem
//
//  Created by ZengYifei on 15/9/14.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//
#import "PostalManageSystem-Swift.h"

#import "SearchForMyApply.h"
#import "CustomTableViewCell.h"
#import "DJRefresh.h"
#import "DJRefreshProgressView.h"
//#import "ApplyAddBranchViewController.swift"
#import "UploadPicViewController.h"
#define tableViewCellHeight 35
#define selectedfont 14
#define defualtFont 17
@interface SearchForMyApply()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,DJRefreshDelegate,UIScrollViewDelegate,UIAlertViewDelegate>{
    AppDelegate *app;
    UISegmentedControl *segmentControl;
    UIView * allApplySearch;
    UIView * myApplySearch;
    BOOL isLoading;              //  加载状态
    int selectedTextFieldTag;
    int textFieldHeight;
    NSMutableDictionary * tableViewCacheDictionary;
    BOOL isInitState;
    NSString * segmentStateString;
    DJRefreshDirection directionForNow;
    NSDictionary * interfaceTransform;
    UIAlertView * alerts;
    //搜索的选项是否发生改变  yes为改变了   no为没改变   点击一次didselect设置为yes   点击一次submit设置为no
    BOOL isSearchStateChange;
    //判断是点击左滑按钮后的cell按钮返回  还是点击cell的返回
    BOOL didSelectedCell;
    //控制刷新  只有再初始化时第一次出现才刷新
    int viewCount;
    
    //操作的cell的index
    NSIndexPath * selectedIndexiPaht;
    
    UITextField * placeNameTextField;
    UITextField * loginNameTextField;
    UITextField * serviceTypeTextField;
    UITextField * stateTextField;
    UIButton * submitBtn;
    
    UITextField * placeNameTextField2;
    UITextField * serviceTypeTextField2;
    UITextField * stateTextField2;
    UIButton * submitBtn2;
}
@property (strong,nonatomic) UILabel * titleLabel;
@property (strong,nonatomic) UITableView * selectedTable;
@property (strong,nonatomic) NSMutableArray * dataList;
@property (strong,nonatomic) NSMutableArray * tempList;
@property (strong,nonatomic) UIView * blackView;
@property (strong,nonatomic) UITableView * tableViewForDisplay;
@property (strong,nonatomic) NSMutableArray * dataListForDisplay;
@property (strong,nonatomic) NSMutableDictionary * pagerDci;
@property (nonatomic,strong)DJRefresh *refresh;
@property (nonatomic,strong) NSMutableDictionary * cachaDataForDifferentSegPage0;
@property (nonatomic,strong) NSMutableDictionary * cachaDataForDifferentSegPage1;

@end
@implementation SearchForMyApply

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        interfaceTransform = [[NSDictionary alloc]initWithObjectsAndKeys:@"Szxwd",@"设置新网点",@"Cxpbfwwd",@"撤销普遍服务网点",@"Cxfpbfwwd",@"撤销非普遍服务网点",@"Baxxbg",@"备案信息变更",@"Jjqz",@"就近迁址",@"Txyw",@"停限业务",@"Ztxyw",@"暂停限业务",@"Hfyw",@"恢复业务",@"0",@"未审核",@"1",@"审核未上传照片",@"2",@"审核已上传照片",@"3",@"审核未通过", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userList:) name:@"userList" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getApplyList:) name:@"getApplyList" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cellBack:) name:@"isScrolledToRight" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(btnStatusAction:) name:@"BtnAction" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(formDataBack:) name:@"bsdtApi/get" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deleteForm:) name:@"bsdtApi/del" object:nil];

    isInitState =YES;
    //获取单例  userList
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    //设置导航栏label
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.textColor = [UIColor yellowColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = app.titleForCurrentPage;
    self.navigationItem.titleView = self.titleLabel;

    NSArray *array=@[@"全部申请查询",@"我的申请查询"];
    segmentControl=[[UISegmentedControl alloc]initWithItems:array];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16.f],NSFontAttributeName ,nil];
    [segmentControl setTitleTextAttributes:dic forState:UIControlStateSelected];
    //segmentControl.segmentedControlStyle=UISegmentedControlSegment;
    //设置位置 大小
    segmentControl.frame=CGRectMake(0, NAVIGATIONHEIGHT-1, self.view.frame.size.width, 50);
    //默认选择
    segmentControl.selectedSegmentIndex=0;
    //设置背景色
    segmentControl.tintColor=UIColorFromRGBValue(0xb3d5bd);
    //设置监听事件
    [segmentControl addTarget:self action:@selector(change) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentControl];
    [segmentControl.layer setMasksToBounds:YES];
    [segmentControl.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
    [segmentControl.layer setBorderWidth:2.0];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 2/255.0, 142/255.0, 69/255.0, 1 });
    [segmentControl.layer setBorderColor:colorref];//边框颜色
    
    allApplySearch = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIGATIONHEIGHT + segmentControl.frame.size.height, UISCREENWIDTH, 150)];
//    allApplySearch.backgroundColor = UIColorFromRGBValue(0xb3d5bd);
    [self.view addSubview: allApplySearch];
    
    UILabel * placeNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, UISCREENWIDTH/4, 30)];
    placeNameLabel.text = @"场所名称:";
    placeNameLabel.font = [UIFont systemFontOfSize:defualtFont];
    placeNameLabel.textAlignment = NSTextAlignmentCenter;
    [allApplySearch addSubview:placeNameLabel];
    placeNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(10 + UISCREENWIDTH/4, 5, UISCREENWIDTH*3/4-20, 30)];
    placeNameTextField.delegate = self;
    placeNameTextField.tag = 1;
    placeNameTextField.userInteractionEnabled = YES;
    placeNameTextField.font = [UIFont systemFontOfSize:defualtFont];
    [placeNameTextField setBorderStyle:UITextBorderStyleLine];
    placeNameTextField.returnKeyType = UIReturnKeyDone;
    [allApplySearch addSubview:placeNameTextField];
    
    UILabel * loginNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 , 10 + 30, UISCREENWIDTH/4, 30)];
    loginNameLabel.text = @"登录名:";
    loginNameLabel.font = [UIFont systemFontOfSize:defualtFont];
    loginNameLabel.textAlignment = NSTextAlignmentCenter;
    [allApplySearch addSubview:loginNameLabel];
    loginNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(10 + UISCREENWIDTH/4, 10+ 30, UISCREENWIDTH*3/4-20, 30)];
    loginNameTextField.delegate = self;
    loginNameTextField.tag = 2;
    loginNameTextField.font = [UIFont systemFontOfSize:defualtFont];
    [loginNameTextField setBorderStyle:UITextBorderStyleLine];
    loginNameTextField.text = @"全部登录名";
    loginNameTextField.returnKeyType = UIReturnKeyDone;
    [allApplySearch addSubview:loginNameTextField];
    
    UILabel * serviceTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 , 15 + 60, UISCREENWIDTH/4, 30)];
    serviceTypeLabel.text = @"业务类型:";
    serviceTypeLabel.font = [UIFont systemFontOfSize:defualtFont];
    serviceTypeLabel.textAlignment = NSTextAlignmentCenter;
    [allApplySearch addSubview:serviceTypeLabel];
    serviceTypeTextField = [[UITextField alloc]initWithFrame:CGRectMake(10 + UISCREENWIDTH/4, 15+ 60, UISCREENWIDTH*3/4-20, 30)];
    serviceTypeTextField.delegate = self;
    serviceTypeTextField.tag = 3;
    serviceTypeTextField.font = [UIFont systemFontOfSize:defualtFont];
    [serviceTypeTextField setBorderStyle:UITextBorderStyleLine];
    serviceTypeTextField.text = @"全部申请类型";
    serviceTypeTextField.returnKeyType = UIReturnKeyDone;
    [allApplySearch addSubview:serviceTypeTextField];
    
    UILabel * stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 , 20 + 90, UISCREENWIDTH/4, 30)];
    stateLabel.text = @"流程状态:";
    stateLabel.font = [UIFont systemFontOfSize:defualtFont];
    stateLabel.textAlignment = NSTextAlignmentCenter;
    [allApplySearch addSubview:stateLabel];
    stateTextField = [[UITextField alloc]initWithFrame:CGRectMake(10 + UISCREENWIDTH/4, 20+ 90, UISCREENWIDTH*3/4-30 - UISCREENWIDTH/5, 30)];
    stateTextField.delegate = self;
    stateTextField.tag = 4;
    stateTextField.font = [UIFont systemFontOfSize:defualtFont];
    [stateTextField setBorderStyle:UITextBorderStyleLine];
    stateTextField.text = @"全部";
    stateTextField.returnKeyType = UIReturnKeyDone;
    [allApplySearch addSubview:stateTextField];
    
    submitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submitBtn.frame = CGRectMake(10 + stateTextField.frame.origin.x + stateTextField.frame.size.width, 20+ 90, UISCREENWIDTH/5, 30);
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    submitBtn.backgroundColor = UIColorFromRGBValue(0x028e45);
    [submitBtn setTitleColor:[UIColor yellowColor]forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [allApplySearch addSubview:submitBtn];
    
    //我的申请查询
    myApplySearch = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIGATIONHEIGHT + segmentControl.frame.size.height, UISCREENWIDTH, 120)];
    [self.view addSubview: myApplySearch];
    myApplySearch.hidden = YES;
    
    UILabel * placeNameLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, UISCREENWIDTH/4, 30)];
    placeNameLabel2.text = @"场所名称:";
    placeNameLabel2.font = [UIFont systemFontOfSize:defualtFont];
    placeNameLabel2.textAlignment = NSTextAlignmentCenter;
    [myApplySearch addSubview:placeNameLabel2];
    placeNameTextField2 = [[UITextField alloc]initWithFrame:CGRectMake(10 + UISCREENWIDTH/4, 5, UISCREENWIDTH*3/4-20, 30)];
    placeNameTextField2.delegate = self;
    placeNameTextField2.tag = 5;
    placeNameTextField2.font = [UIFont systemFontOfSize:defualtFont];
    [placeNameTextField2 setBorderStyle:UITextBorderStyleLine];
    placeNameTextField2.returnKeyType = UIReturnKeyDone;
    [myApplySearch addSubview:placeNameTextField2];

    UILabel * serviceTypeLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(10 , 10 + 30, UISCREENWIDTH/4, 30)];
    serviceTypeLabel2.text = @"业务类型:";
    serviceTypeLabel2.font = [UIFont systemFontOfSize:defualtFont];
    serviceTypeLabel2.textAlignment = NSTextAlignmentCenter;
    [myApplySearch addSubview:serviceTypeLabel2];
    serviceTypeTextField2 = [[UITextField alloc]initWithFrame:CGRectMake(10 + UISCREENWIDTH/4, 10+ 30, UISCREENWIDTH*3/4-20, 30)];
    serviceTypeTextField2.delegate = self;
    serviceTypeTextField2.tag = 6;
    serviceTypeTextField2.font = [UIFont systemFontOfSize:defualtFont];
    [serviceTypeTextField2 setBorderStyle:UITextBorderStyleLine];
    serviceTypeTextField2.text = @"全部申请类型";
    serviceTypeTextField2.returnKeyType = UIReturnKeyDone;
    [myApplySearch addSubview:serviceTypeTextField2];
    
    UILabel * stateLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(10 , 15 + 60, UISCREENWIDTH/4, 30)];
    stateLabel2.text = @"流程状态:";
    stateLabel2.font = [UIFont systemFontOfSize:defualtFont];
    stateLabel2.textAlignment = NSTextAlignmentCenter;
    [myApplySearch addSubview:stateLabel2];
    stateTextField2 = [[UITextField alloc]initWithFrame:CGRectMake(10 + UISCREENWIDTH/4, 15+ 60, UISCREENWIDTH*3/4-30 - UISCREENWIDTH/5, 30)];
    stateTextField2.delegate = self;
    stateTextField2.tag = 7;
    stateTextField2.font = [UIFont systemFontOfSize:defualtFont];
    [stateTextField2 setBorderStyle:UITextBorderStyleLine];
    stateTextField2.text = @"全部";
    stateTextField2.returnKeyType = UIReturnKeyDone;
    [myApplySearch addSubview:stateTextField2];
    
    submitBtn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submitBtn2.frame = CGRectMake(10 + stateTextField.frame.origin.x + stateTextField.frame.size.width, 15+ 60, UISCREENWIDTH/5, 30);
    [submitBtn2 setTitle:@"提交" forState:UIControlStateNormal];
    submitBtn2.backgroundColor = UIColorFromRGBValue(0x028e45);
    [submitBtn2 setTitleColor:[UIColor yellowColor]forState:UIControlStateNormal];
    [submitBtn2 addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [myApplySearch addSubview:submitBtn2];
    
    _tempList = [[NSMutableArray alloc]init];
    _dataList = [[NSMutableArray alloc]init];
    _pagerDci = [[NSMutableDictionary alloc]init];
    _selectedTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) ];
    _selectedTable.center = self.view.center;
    _selectedTable.delegate = self;
    _selectedTable.dataSource = self;
    
    tableViewCacheDictionary = [[NSMutableDictionary alloc]init];
    
    self.blackView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.blackView.backgroundColor = [UIColor blackColor];
    self.blackView.alpha = 0.0;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelView)];
    [self.blackView addGestureRecognizer:recognizer];

    _dataListForDisplay = [[NSMutableArray alloc]init];//WithObjects:@"1",@"2", nil];
    _tableViewForDisplay = [[UITableView alloc]initWithFrame:CGRectMake(0, allApplySearch.frame.origin.y +allApplySearch.frame.size.height  , UISCREENWIDTH, UISCREENHEIGHT - NAVIGATIONHEIGHT - segmentControl.frame.size.height -allApplySearch.frame.size.height) ];
    _tableViewForDisplay.delegate = self;
    _tableViewForDisplay.dataSource = self;
//    _tableViewForDisplay.hidden = YES;
    [self.view addSubview:_tableViewForDisplay];
    
    app.pager = [app.pager init];

    _refresh=[[DJRefresh alloc] initWithScrollView:_tableViewForDisplay delegate:self];
    _refresh.topEnabled=YES;
    _refresh.bottomEnabled=YES;
    
    if (_type==eRefreshTypeProgress) {
        [_refresh registerClassForTopView:[DJRefreshProgressView class]];
    }
    _cachaDataForDifferentSegPage0 = [[NSMutableDictionary alloc]init];
    _cachaDataForDifferentSegPage1 = [[NSMutableDictionary alloc]init];
    segmentStateString = [NSString stringWithFormat:@"0"];
    viewCount = 1;
    didSelectedCell = NO;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    if (viewCount == 1) {
//        [self submit];
        viewCount ++;
    }
}

#pragma -mark  数据操作
-(void)cancelView
{
    [UIView animateWithDuration:0.3 animations:^{
        _blackView.alpha = 0.0;
        [_selectedTable removeFromSuperview];
        [_blackView removeFromSuperview];
    }];
    [tableViewCacheDictionary setObject:_selectedTable forKey:[NSString stringWithFormat:@"%ld",(long)selectedTextFieldTag]];
    
}

-(void)change{
    [(UITextField *)[self.view viewWithTag:1] resignFirstResponder];
    
    if (isLoading) {
        [segmentControl setSelectedSegmentIndex:[segmentStateString intValue]];
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"网络加载中" message:@"请加载完成过后再试！" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    //存储改变前页面数据
    if (segmentControl.selectedSegmentIndex == 1) {
        NSString * isSearchStateChangeString = [NSString stringWithFormat:@"%@",isSearchStateChange ? @"YES":@"NO"];
        [_cachaDataForDifferentSegPage0 setObject:tableViewCacheDictionary forKey:@"tableViewCacheDictionary"];
        [_cachaDataForDifferentSegPage0 setObject:app.pager forKey:@"pager"];
        [_cachaDataForDifferentSegPage0 setObject:_tableViewForDisplay forKey:@"_tableViewForDisplay"];
        [_cachaDataForDifferentSegPage0 setObject:_dataListForDisplay forKey:@"_dataListForDisplay"];
        [_cachaDataForDifferentSegPage0 setObject:isSearchStateChangeString forKey:@"isSearchStateChangeString"];
//        [_cachaDataForDifferentSegPage0 setObject:placeNameTextField forKey:@"placeNameTextField"];
//        [_cachaDataForDifferentSegPage0 setObject:loginNameTextField forKey:@"loginNameTextField"];
//        [_cachaDataForDifferentSegPage0 setObject:serviceTypeTextField forKey:@"serviceTypeTextField"];
//        [_cachaDataForDifferentSegPage0 setObject:stateTextField forKey:@"stateTextField"];
        NSLog(@"页面0已缓存");
    }else{
        NSString * isSearchStateChangeString = [NSString stringWithFormat:@"%@",isSearchStateChange ? @"YES":@"NO"];
        [_cachaDataForDifferentSegPage1 setObject:tableViewCacheDictionary forKey:@"tableViewCacheDictionary"];
        [_cachaDataForDifferentSegPage1 setObject:app.pager forKey:@"pager"];
        [_cachaDataForDifferentSegPage1 setObject:_tableViewForDisplay forKey:@"_tableViewForDisplay"];
        [_cachaDataForDifferentSegPage1 setObject:_dataListForDisplay forKey:@"_dataListForDisplay"];
        [_cachaDataForDifferentSegPage1 setObject:isSearchStateChangeString forKey:@"isSearchStateChangeString"];
//        [_cachaDataForDifferentSegPage1 setObject:placeNameTextField forKey:@"placeNameTextField"];
//        [_cachaDataForDifferentSegPage1 setObject:serviceTypeTextField forKey:@"serviceTypeTextField"];
//        [_cachaDataForDifferentSegPage1 setObject:stateTextField forKey:@"stateTextField"];
        NSLog(@"页面1已缓存");
    }
    
    if (segmentControl.selectedSegmentIndex == 0) {
        //判断是否有缓存
        if ([_cachaDataForDifferentSegPage0 objectForKey:@"tableViewCacheDictionary"] != nil) {
            //取出改变后页面数据
            NSLog(@"页面0有缓存  读取ing");
            NSString * isSearchStateChangeString;
            tableViewCacheDictionary = [_cachaDataForDifferentSegPage0 objectForKey:@"tableViewCacheDictionary"];
            app.pager = [_cachaDataForDifferentSegPage0 objectForKey:@"pager"];
            //_tableViewForDisplay = [_cachaDataForDifferentSegPage0 objectForKey:@"_tableViewForDisplay"];
            _dataListForDisplay = [_cachaDataForDifferentSegPage0 objectForKey:@"_dataListForDisplay"];
            isSearchStateChangeString = [_cachaDataForDifferentSegPage0 objectForKey:@"isSearchStateChangeString"];
//            placeNameTextField = [_cachaDataForDifferentSegPage0 objectForKey:@"placeNameTextField"];
//            loginNameTextField = [_cachaDataForDifferentSegPage0 objectForKey:@"loginNameTextField"];
//            serviceTypeTextField = [_cachaDataForDifferentSegPage0 objectForKey:@"serviceTypeTextField"];
//            stateTextField = [_cachaDataForDifferentSegPage0 objectForKey:@"stateTextField"];
            isSearchStateChange = [isSearchStateChangeString boolValue];
        }else{
            NSLog(@"页面0无缓存  创建中ing");
            tableViewCacheDictionary = [[NSMutableDictionary alloc]init];
            app.pager = [app.pager init];
            //_tableViewForDisplay = [[UITableView alloc]init];
            _dataListForDisplay = [[NSMutableArray alloc]init];
            isSearchStateChange = NO;
        }
        
        allApplySearch.hidden = NO;
        myApplySearch.hidden = YES;
        _tableViewForDisplay.frame = CGRectMake(0, allApplySearch.frame.origin.y +allApplySearch.frame.size.height  , UISCREENWIDTH, UISCREENHEIGHT - NAVIGATIONHEIGHT - segmentControl.frame.size.height -allApplySearch.frame.size.height);

    }else{
        //判断是否有缓存
        if ([_cachaDataForDifferentSegPage1 objectForKey:@"tableViewCacheDictionary"] != nil) {
            //取出改变后页面数据
            NSLog(@"页面1有缓存  读取ing");
            NSString * isSearchStateChangeString;
            tableViewCacheDictionary = [_cachaDataForDifferentSegPage1 objectForKey:@"tableViewCacheDictionary"];
            app.pager = [_cachaDataForDifferentSegPage1 objectForKey:@"pager"];
            //_tableViewForDisplay = [_cachaDataForDifferentSegPage0 objectForKey:@"_tableViewForDisplay"];
            _dataListForDisplay = [_cachaDataForDifferentSegPage1 objectForKey:@"_dataListForDisplay"];
            isSearchStateChangeString = [_cachaDataForDifferentSegPage1 objectForKey:@"isSearchStateChangeString"];
//            placeNameTextField2 = [_cachaDataForDifferentSegPage1 objectForKey:@"placeNameTextField2"];
//            serviceTypeTextField2 = [_cachaDataForDifferentSegPage1 objectForKey:@"serviceTypeTextField2"];
//            stateTextField2 = [_cachaDataForDifferentSegPage1 objectForKey:@"stateTextField2"];
            isSearchStateChange = [isSearchStateChangeString boolValue];
        }else{
            NSLog(@"页面1无缓存  创建中ing");
            tableViewCacheDictionary = [[NSMutableDictionary alloc]init];
            app.pager = [app.pager init];
            //_tableViewForDisplay = [[UITableView alloc]init];
            _dataListForDisplay = [[NSMutableArray alloc]init];
            isSearchStateChange = NO;
        }
        
        allApplySearch.hidden = YES;
        myApplySearch.hidden = NO;
        _tableViewForDisplay.frame = CGRectMake(0, myApplySearch.frame.origin.y +myApplySearch.frame.size.height  , UISCREENWIDTH, UISCREENHEIGHT - NAVIGATIONHEIGHT - segmentControl.frame.size.height -myApplySearch.frame.size.height) ;
    }
    [_tableViewForDisplay reloadData];
    
    if (_dataListForDisplay.count == 0) {
//        _tableViewForDisplay.hidden = YES;
    }else{
//        _tableViewForDisplay.hidden =NO;
    }
    
    [self submit];
}

- (void)submit{
    [placeNameTextField resignFirstResponder];
    [placeNameTextField2 resignFirstResponder];

    isSearchStateChange = NO;
    if (segmentControl.selectedSegmentIndex == 0) {
        segmentStateString = [NSString stringWithFormat:@"0"];
    }else{
        segmentStateString = [NSString stringWithFormat:@"1"];
    }
    [_refresh startRefreshingDirection:DJRefreshDirectionTop animation:YES];
}

//网络请求
- (void)getDataFromServerForSearchMyApply{
    if (isLoading == NO) {
        isLoading = YES;
        //[GMDCircleLoader setOnView:self.view withTitle:@"加载中..." animated:YES];
        if (segmentControl.selectedSegmentIndex == 0) {
            submitBtn.enabled = NO;
            segmentStateString = [NSString stringWithFormat:@"0"];
            UITextField * placeText = (UITextField *)[self.view viewWithTag:1];
            UITextField * loginNameText = (UITextField *)[self.view viewWithTag:2];
            NSString * loginName = loginNameText.text;
            if ([loginName rangeOfString:@"全部"].length != 0) {
                loginName = @"";
            }
            UITextField * typeNameText = (UITextField *)[self.view viewWithTag:3];
            NSString * typeName = typeNameText.text;
            if ([typeName rangeOfString:@"全部"].length != 0) {
                typeName = @"";
            }else{
                typeName = [interfaceTransform objectForKey:typeName];
            }
            
            UITextField * stateNameText = (UITextField *)[self.view viewWithTag:4];
            NSString * stateName = stateNameText.text;
            if ([stateName rangeOfString:@"全部"].length != 0) {
                stateName = @"";
            }else{
                stateName = [interfaceTransform objectForKey:stateName];
            }
            [app.network getAllApplyListWithToken:@"jiou" AndType:typeName AndUserName:loginName AndPlaceName:placeText.text AndState:stateName AndPager:app.pager];
        }else{
            submitBtn2.enabled = NO;

            segmentStateString = [NSString stringWithFormat:@"1"];
       
            NSString * loginName = [app.userData objectForKey:@"userName"];

            NSString * typeName = serviceTypeTextField2.text;
            if ([typeName rangeOfString:@"全部"].length != 0) {
                typeName = @"";
            }else{
                typeName = [interfaceTransform objectForKey:typeName];
            }
            
            NSString * stateName = stateTextField2.text;
            if ([stateName rangeOfString:@"全部"].length != 0) {
                stateName = @"";
            }else{
                stateName = [interfaceTransform objectForKey:stateName];
            }
            [app.network getAllApplyListWithToken:@"jiou" AndType:typeName AndUserName:loginName AndPlaceName:placeNameTextField2.text AndState:stateName AndPager:app.pager];
        }
    }
}


- (void)showTableViewWith:(UITextField *) textField{
    if ([tableViewCacheDictionary objectForKey:[NSString stringWithFormat:@"%ld",(long)selectedTextFieldTag]] != NULL) {
        _selectedTable = [tableViewCacheDictionary objectForKey:[NSString stringWithFormat:@"%ld",(long)selectedTextFieldTag]];
        NSLog(@"buweikong");
    }else  {
        _selectedTable = [[UITableView alloc]init];
        _selectedTable.tag = 100+ selectedTextFieldTag;
        self.selectedTable.dataSource = self;
        self.selectedTable.delegate = self;
    }
    
    _selectedTable.frame = CGRectMake(textField.frame.origin.x, textField.frame.origin.y+NAVIGATIONHEIGHT + segmentControl.frame.size.height, textField.frame.size.width, tableViewCellHeight*self.dataList.count);
    if (_selectedTable.frame.size.height+ _selectedTable.frame.origin.y> UISCREENHEIGHT -20) {
        self.selectedTable.frame = CGRectMake(textField.frame.origin.x, textField.frame.origin.y+NAVIGATIONHEIGHT + segmentControl.frame.size.height, textField.frame.size.width, UISCREENHEIGHT -20 - (textField.frame.origin.y + NAVIGATIONHEIGHT + segmentControl.frame.size.height));
    }
    [UIView animateWithDuration:0.3 animations:^{
        [self.view addSubview:_blackView];
        [self.view addSubview:_selectedTable];
        _blackView.alpha = 0.5;
    }];
    [tableViewCacheDictionary setObject:self.selectedTable forKey:[NSString stringWithFormat:@"%ld",(long)selectedTextFieldTag]];
}

//当有cell右滑滑出时  将其他cell左滑还原
- (void)cellBack:(NSNotification *)note{
    CustomTableViewCell * theCell = [[note userInfo]objectForKey:@"cell"];
    if (theCell != nil) {
        //遍历cell 并将其他cell左滑还原
        for (int row = 0; row < _dataListForDisplay.count; row ++) {
            NSUInteger section = 0;
            NSIndexPath * indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            CustomTableViewCell * cell = (CustomTableViewCell *)[_tableViewForDisplay cellForRowAtIndexPath:indexPath];
            if (cell.backgroundScrollView.contentOffset.x > UISCREENWIDTH /2  &&  cell != theCell) {
                [UIView animateWithDuration:0.3 animations:^{
                    cell.backgroundScrollView.contentOffset = CGPointMake(0, 0);
                }];
            }else if(cell == theCell){
//                NSLog(@"It's me, I will not back");
            }
        }
    }
    //所有的都还原
    else{
        for (int row = 0; row < _dataListForDisplay.count; row ++) {
            NSUInteger section = 0;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            CustomTableViewCell * cell = (CustomTableViewCell *)[_tableViewForDisplay cellForRowAtIndexPath:indexPath];
            [UIView animateWithDuration:0.3 animations:^{
                cell.backgroundScrollView.contentOffset = CGPointMake(0, 0);
            }];
        }
    }
}

//cell右滑后的按钮操作
-(void)btnStatusAction:(NSNotification *)note{
    NSString * actionString = [[note userInfo]objectForKey:@"action"];
    NSString * statusString;
    CustomTableViewCell * theCell = [[note userInfo]objectForKey:@"cell"];
    if (theCell != nil) {
        //遍历cell 找到点击按钮的cell
        for (int row = 0; row < _dataListForDisplay.count; row ++) {
            NSUInteger section = 0;
            NSIndexPath * indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            CustomTableViewCell * cell = (CustomTableViewCell *)[_tableViewForDisplay cellForRowAtIndexPath:indexPath];
            if(cell == theCell){
                //判断按钮响应类型
                if([actionString isEqualToString:@"delete"]){
                    statusString = [[[_dataListForDisplay objectAtIndex:row] objectForKey:@"status"]stringValue];
                    [self statusJuge:statusString AndAction:@"delete" AndIndexPath:indexPath];
                }else if ([actionString isEqualToString:@"edit"]){
                    statusString = [[[_dataListForDisplay objectAtIndex:row] objectForKey:@"status"]stringValue];
                    [self statusJuge:statusString AndAction:@"edit" AndIndexPath:indexPath];
                }else if ([actionString isEqualToString:@"upload"]){
                    app.selectedCellData = [_dataListForDisplay objectAtIndex:indexPath.row];
                    statusString = [[[_dataListForDisplay objectAtIndex:row] objectForKey:@"status"]stringValue];
                    [self statusJuge:statusString AndAction:@"upload" AndIndexPath:indexPath];
                }
                NSLog(@"It's me, I will not back");
            }
        }
    }
}

//改cell对应表的审核状态下是否能执行对应操作
- (void)statusJuge:(NSString *)status AndAction:(NSString*)action AndIndexPath:(NSIndexPath *)indexPath{
    selectedIndexiPaht = indexPath;
    //未审核  不能传照片  只能删除修改
    if ([status isEqualToString:@"0"]) {
        //该情况下不允许上传图片
        if ([action isEqualToString:@"upload"]) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"未审核" message:@"请在审核通过后上传照片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        //允许删除或者修改
        else if([action isEqualToString:@"delete"]){
            NSLog(@"delete");
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"删除" message:@"确定要删除吗？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            alert.delegate = self;
            [alert show];
            }
        //修改  状态变为2
        else if([action isEqualToString:@"edit"]){
            app.ServerData = 2;
            NSLog(@"edit");
        }
    }
    //审核未通过 不能传照片  只能删除修改
    else if ([status isEqualToString:@"3"]){
        if ([action isEqualToString:@"upload"]) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"审核未通过" message:@"请在审核通过后上传照片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }else if([action isEqualToString:@"delete"]){
            NSLog(@"delete");
        }else if([action isEqualToString:@"edit"]){
            app.ServerData = 2;
            NSLog(@"edit");
        }
    }
    //审核通过未上传  只能传照片
    else if ([status isEqualToString:@"1"]){
        if ([action isEqualToString:@"upload"]) {
            //上传
            NSLog(@"upload");
            //取到表的类型判断上传几张图片
            UploadPicViewController * upload;
            NSString * typeName = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"typeName"];
            if ([typeName isEqualToString:@"撤销普遍服务网点"]||[typeName isEqualToString:@"停限业务"]) {
                upload = [[UploadPicViewController alloc]initWithUploadState:YES AndUrl:nil AndCountOfPic:2 AndFormName:typeName];
            }else{
                upload = [[UploadPicViewController alloc]initWithUploadState:YES AndUrl:nil AndCountOfPic:1 AndFormName:typeName];
            }
            //            upload.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
                upload.providesPresentationContextTransitionStyle = YES;
                upload.definesPresentationContext = YES;
                upload.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                [self presentViewController:upload animated:YES completion:nil];
            } else {
                self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
                [self presentViewController:upload animated:NO completion:nil];
                self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            }
            
            //未上传照片  则无需加载图片
//            [GMDCircleLoader setOnView:self.view withTitle:@"加载中..." animated:YES];
//            NSMutableString * flowID = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"flowId"];
//            NSString * interface = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"type"];
//            [GMDCircleLoader setOnView:self.view withTitle:@"加载中..." animated:YES];
//            [app.network getFlowIDWithInterface:interface ANdToken:@"jiou" AndFlowID:flowID];
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"已审核" message:@"审核通过后只能上传照片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    //审核通过已上传  只能传照片
    else if ([status isEqualToString:@"2"]){
        if ([action isEqualToString:@"upload"]) {
            //上传
            NSLog(@"upload");
            //取到表的类型判断上传几张图片            http://img5.cache.netease.com/photo/0001/2015-09-22/B44FGIK900AN0001.jpg
            UploadPicViewController * upload;
            NSString * typeName = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"typeName"];
            if ([typeName isEqualToString:@"撤销普遍服务网点"]||[typeName isEqualToString:@"停限业务"]) {
                upload = [[UploadPicViewController alloc]initWithUploadState:YES AndUrl:nil AndCountOfPic:2 AndFormName:typeName];
            }else{
                upload = [[UploadPicViewController alloc]initWithUploadState:YES AndUrl:nil AndCountOfPic:1 AndFormName:typeName];
//                upload = [[UploadPicViewController alloc]initWithUploadState:NO AndUrl:@"http://img5.cache.netease.com/photo/0001/2015-09-22/B44FGIK900AN0001.jpg" AndCountOfPic:1 AndFormName:typeName];
            }
//            upload.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
                upload.providesPresentationContextTransitionStyle = YES;
                upload.definesPresentationContext = YES;
                upload.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                [self presentViewController:upload animated:YES completion:nil];
            } else {
                self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
                [self presentViewController:upload animated:NO completion:nil];
                self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            }
            //预读取之前已上传的图片
            [GMDCircleLoader setOnView:self.view withTitle:@"加载中..." animated:YES];
            NSMutableString * flowID = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"flowId"];
            NSString * interface = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"type"];
            [GMDCircleLoader setOnView:self.view withTitle:@"加载中..." animated:YES];
            [app.network getFlowIDWithInterface:interface ANdToken:@"jiou" AndFlowID:flowID];
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"已审核" message:@"审核通过后只能上传照片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

#pragma  -mark 网络返回
- (void)userList:(NSNotification *)note{
    [GMDCircleLoader hideFromView:self.view animated:YES];
    NSDictionary * dic = [note userInfo];
    if ([[dic objectForKey:@"result"] isEqualToString:@"1"]) {
        //有多个用户时data是一个数组  只有一个用户时则是字典
        NSArray * data = [dic objectForKey:@"data"];
        if ([data isKindOfClass:[NSArray class ]]) {
            for (NSDictionary * dics in data) {
                [_tempList addObject: [dics objectForKey:@"userName"]];
            }
            [_tempList insertObject:@"全部登录名" atIndex:0];
        }else if([data isKindOfClass:[NSDictionary class]]){
            [_tempList addObject: [(NSDictionary *)data objectForKey:@"userName"]];
            [_tempList insertObject:@"全部登录名" atIndex:0];
        }
    }
    [self submit];
}

- (void)getApplyList:(NSNotification *)note{
    //[GMDCircleLoader hideFromView:self.view animated:YES];
    submitBtn.enabled = YES;
    submitBtn2.enabled =YES;
    NSDictionary * dic = [[NSDictionary alloc]initWithDictionary: [note userInfo]];
    if ([[dic objectForKey:@"result"] isEqualToString:@"1"]) {
        //填充对应页面下方list的页面信息
        if ([dic objectForKey:@"listPager"] !=nil) {
            [_pagerDci setObject:[dic objectForKey:@"listPager"] forKey:segmentStateString];
        }
        app.pager.currentPage = [[[dic objectForKey:@"listPager"]objectForKey:@"currentPage"]intValue];
        app.pager.totalPages = [[[dic objectForKey:@"listPager"]objectForKey:@"totalPages"]intValue];
        NSArray * data = [dic objectForKey:@"list"];
        for (NSDictionary * dics in data) {
            [_dataListForDisplay addObject: dics];
        }
    }else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请求出错" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    if(_dataListForDisplay.count == 0){
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"数据为空" message:@"没有该项数据" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        
    }

     [self addDataWithDirection:directionForNow];
}

//表的详情返回
- (void)formDataBack:(NSNotification *)note{
    //判断是点击左滑按钮后的cell按钮返回  还是点击cell的返回
    if (!didSelectedCell) {
        return;
    }
    [GMDCircleLoader hideFromView:self.view animated:YES];
    NSDictionary * tempDic = [[NSDictionary alloc]initWithDictionary: [note userInfo]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if ([[tempDic objectForKey:@"result"] isEqualToString:@"1"]) {
        app.ServerData = 1;
        //申请新增
        if ([app.network.specialInterface isEqualToString: @"Szxwd"]) {
            app.applyAddDic = [tempDic objectForKey:@"info"];
            ApplyAddBranchViewController * applyAddBranchVC = [storyboard instantiateViewControllerWithIdentifier:@"applyAddBranchVC"];
            [self.navigationController pushViewController:applyAddBranchVC animated:YES];
        }
        //申请撤销网店  有时2个info       对应一个VC  两个页面   3各表   seg0是Cxpbfwwd  2个表   seg1是Cxfpbfwwd 1个表
        else if ([app.network.specialInterface isEqualToString: @"Cxpbfwwd"] || [app.network.specialInterface isEqualToString: @"Cxfpbfwwd"]){
            if (tempDic.count == 2) {
                app.applyResignDic = [tempDic objectForKey:@"info"];
                ApplyResignBranchViewController2 * applyResignBranchVC = [storyboard instantiateViewControllerWithIdentifier:@"applyResignBranchVC"];
                [self.navigationController pushViewController:applyResignBranchVC animated:YES];
            }else{
                NSDictionary * info1Dic = [tempDic objectForKey:@"info1"];
                NSDictionary * info2Dic = [tempDic objectForKey:@"info2"];
                app.applyResignDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:info1Dic,@"info1",info2Dic,@"info2", nil];
                ApplyResignBranchViewController2 * applyResignBranchVC = [storyboard instantiateViewControllerWithIdentifier:@"applyResignBranchVC"];
                [self.navigationController pushViewController:applyResignBranchVC animated:YES];
            }
        }
        //申请变更网点   分为seg0申请网点信息变更（备案信息变更） seg1就近迁址
        else if ([app.network.specialInterface isEqualToString: @"Baxxbg"] || [app.network.specialInterface isEqualToString: @"Jjqz"]){
            app.applyChangeDic = [tempDic objectForKey:@"info"];
            ApplyChangeBranchViewController * applyChangeBranchVC = [storyboard instantiateViewControllerWithIdentifier:@"applyChangeBranchVC"];
            [self.navigationController pushViewController:applyChangeBranchVC animated:YES];
        }
        //申请暂停限业务
        else if ([app.network.specialInterface isEqualToString: @"Ztxyw"]){
            app.applyPauseDic = [tempDic objectForKey:@"info"];
            ApplyPausedViewController * applyPausedBranchVC = [storyboard instantiateViewControllerWithIdentifier:@"applyPausedBranchVC"];
            [self.navigationController pushViewController:applyPausedBranchVC animated:YES];
        }
        //申请停限业务   2个表  两个info
        else if ([app.network.specialInterface isEqualToString: @"Txyw"]){
            NSDictionary * info1Dic = [tempDic objectForKey:@"info1"];
            NSDictionary * info2Dic = [tempDic objectForKey:@"info2"];
            app.applyStopDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:info1Dic,@"info1",info2Dic,@"info2", nil];
            ApplyStopBranchViewController * applyStopBranchVC = [storyboard instantiateViewControllerWithIdentifier:@"applyStopBranchVC"];
            [self.navigationController pushViewController:applyStopBranchVC animated:YES];
        }
        //申请恢复
        else if ([app.network.specialInterface isEqualToString: @"Hfyw"]){
                app.applyRestoreDic = [tempDic objectForKey:@"info"];
                ApplyRestoreBranchViewController * applyRestoreBranchVC = [storyboard instantiateViewControllerWithIdentifier:@"applyRestoreBranchVC"];
                [self.navigationController pushViewController:applyRestoreBranchVC animated:YES];
        }

    }else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"数据请求失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    didSelectedCell = NO;
}

- (void)deleteForm:(NSNotification *)note{
    [GMDCircleLoader hideFromView:self.view animated:YES];
    NSDictionary * dic = [[NSDictionary alloc]initWithDictionary:[note userInfo]];
    if ([[dic objectForKey:@"result"]isEqualToString:@"1"]) {
        [self cellBack:nil];
        [_dataListForDisplay removeObjectAtIndex:selectedIndexiPaht.row];
        [_tableViewForDisplay reloadData];
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"删除成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"删除失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }

}

#pragma mark - DJrefresh df
- (void)refresh:(DJRefresh *)refresh didEngageRefreshDirection:(DJRefreshDirection)direction{
    directionForNow = direction;
    //isLoading = YES;
    //if ([app.titleForCurrentPage isEqualToString:@"满意度调查结果通告"]) {
    if (isSearchStateChange) {
        [self submit];
        return;
    }
    [self cellBack:nil];
    if (self.refresh.refreshingDirection==DJRefreshingDirectionBottom){
        if (app.pager.currentPage < app.pager.totalPages) {
            //数据返回太快   影响动画效果  顾延迟请求
            [NSTimer scheduledTimerWithTimeInterval:0.4 target: self selector: @selector(getDataFromServerForSearchMyApply) userInfo:nil repeats:NO];
            app.pager.currentPage ++;
        }else{
            if (![alerts isVisible]) {
                alerts = [[UIAlertView alloc]initWithTitle:nil message:@"所有信息已加载完毕！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alerts show];
            }
            
            [self addDataWithDirection:directionForNow];
        }
    }else if(self.refresh.refreshingDirection==DJRefreshingDirectionTop){
        app.pager = [app.pager init];
        [_dataListForDisplay removeAllObjects];
        //下拉更新时将第一页数据缓存
//        shouldUpdateCacheForTitle = YES;
        //数据返回太快   影响动画效果  顾延迟请求
        [NSTimer scheduledTimerWithTimeInterval:0.4 target: self selector: @selector(getDataFromServerForSearchMyApply) userInfo:nil repeats:NO];
    }
}

- (void)addDataWithDirection:(DJRefreshDirection)direction{
    [_tableViewForDisplay reloadData];
    [_refresh finishRefreshingDirection:direction animation:YES];
    isLoading =NO;
}

#pragma mark - TextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textFieldHeight = textField.frame.size.height + textField.frame.origin.y;
    switch (textField.tag) {
//        case 1:
//            self.dataList = [[NSMutableArray alloc]initWithObjects:@"设置邮政普遍服务营业场所",@"设置其他邮政营业场所", nil];
//            selectedTextFieldTag = 1;
//            [self showTableViewWith:textField];
//            return NO;
//            break;
        case 2:
//            self.dataList = [[NSMutableArray alloc]initWithObjects:@"自办",@"委办", nil];
            [(UITextField *)[self.view viewWithTag:1] resignFirstResponder];
            _dataList = _tempList;
            selectedTextFieldTag = 2;
            [self showTableViewWith:textField];
            return NO;
            break;
        case 3:
            [(UITextField *)[self.view viewWithTag:1] resignFirstResponder];
            _dataList = [[NSMutableArray alloc]initWithObjects:@"全部申请类型",@"设置新网点",@"撤销普遍服务网点",@"撤销非普遍服务网点",@"备案信息变更",@"就近迁址",@"停限业务",@"暂停限业务",@"恢复业务", nil];
            selectedTextFieldTag = 3;
            [self showTableViewWith:textField];
            return NO;
            break;
        case 4:
            [(UITextField *)[self.view viewWithTag:1] resignFirstResponder];
            _dataList = [[NSMutableArray alloc]initWithObjects:@"全部",@"未审核",@"审核未通过",@"审核未上传照片",@"审核已上传照片", nil];
            selectedTextFieldTag = 4;
            [self showTableViewWith:textField];
            return NO;
            break;
//        case 5:
//            [(UITextField *)[self.view viewWithTag:1] resignFirstResponder];
//            selectedTextFieldTag = 5;
//            return NO;
//            break;
        case 6:
            [(UITextField *)[self.view viewWithTag:1] resignFirstResponder];
            _dataList = [[NSMutableArray alloc]initWithObjects:@"全部申请类型",@"设置新网点",@"撤销普遍服务网点",@"撤销非普遍服务网点",@"备案信息变更",@"就近迁址",@"停限业务",@"暂停限业务",@"恢复业务", nil];
            selectedTextFieldTag = 6;
            [self showTableViewWith:textField];
            return NO;
            break;
        case 7:
            [(UITextField *)[self.view viewWithTag:1] resignFirstResponder];
            _dataList = [[NSMutableArray alloc]initWithObjects:@"全部",@"未审核",@"审核未通过",@"审核未上传照片",@"审核已上传照片", nil];
            selectedTextFieldTag = 7;
            [self showTableViewWith:textField];
            return NO;
            break;
        default:
            return YES;
            
            break;
    }
        return YES;
}

// 一般用来隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (segmentControl.selectedSegmentIndex ==1) {
        
    }
    return YES;
}


#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _selectedTable) {
        return [_dataList count];
    }else{
        return [_dataListForDisplay count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _selectedTable) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" ];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:selectedfont];
//        if (indexPath.row == 0  && isInitState) {
//            cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        }
        return cell;
    }
    else{
        CustomTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" ];
        if (cell == nil) {
            cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColorFromRGBValue(0xf3f3f3);
        }else{
            cell.backgroundColor = [UIColor whiteColor];
        }
        
        if (indexPath.row < _dataListForDisplay.count) {
            cell.placeNameLabel.text = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"wdxx"];
            cell.serviceTypeLabel.text = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"typeName"];
            
            NSMutableString * timeAndApllyPersonString = [[NSMutableString alloc]initWithString:[NSString stringWithFormat:@"申请时间:%@",[[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"startTime"]]];
            [timeAndApllyPersonString setString:[timeAndApllyPersonString substringToIndex:15]];
            [timeAndApllyPersonString appendString:[NSString stringWithFormat:@"       申请人:%@",[[NSMutableString alloc]initWithString:[[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"applyUserName"]]]];
            cell.timeAndApllyPersonLabel.text = timeAndApllyPersonString;
        }
        //    cell.accessoryType = UITableViewCellAccessoryCheckmark;
        if (segmentControl.selectedSegmentIndex == 0) {
            //全部申请列表这不允许滑动
            cell.backgroundScrollView.scrollEnabled = NO;
        }else{
            cell.backgroundScrollView.scrollEnabled = YES;
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    //所有cell左滑还原
    [self cellBack:nil];
    if (tableView == _selectedTable) {
        isSearchStateChange = YES;
        UITextField * text = (UITextField *)[self.view viewWithTag:selectedTextFieldTag];
        text.text =  [self.dataList objectAtIndex:indexPath.row];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }else{
            for (int i = 0; i < self.dataList.count; i++) {
                NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:index];
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [_selectedTable reloadData];
        }
        [self cancelView];
        [tableViewCacheDictionary setObject:tableView forKey:[NSString stringWithFormat:@"%ld",(long)selectedTextFieldTag]];
    }
    //CustomCell
    else{
        if (isLoading) {
            return;
        }
        NSMutableString * flowID = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"flowId"];
        NSString * interface = [[_dataListForDisplay objectAtIndex:indexPath.row]objectForKey:@"type"];
        [GMDCircleLoader setOnView:self.view withTitle:@"加载中..." animated:YES];
        [app.network getFlowIDWithInterface:interface ANdToken:@"jiou" AndFlowID:flowID];
        didSelectedCell = YES;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _selectedTable) {
        return tableViewCellHeight;
    }else{
        return 80;
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - alertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSString * interface = [[_dataListForDisplay objectAtIndex:selectedIndexiPaht.row]objectForKey:@"type"];
        NSString * flowId = [[_dataListForDisplay objectAtIndex:selectedIndexiPaht.row]objectForKey:@"flowId"];
        [GMDCircleLoader setOnView:self.view withTitle:@"加载中..." animated:YES];
        [app.network deleteWithInterface:interface AndFlowID:flowId];
    }
}

#pragma mark - touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];   //scrollview捕获了touch事件
    UITouch *touch = [touches anyObject];
    if (touch.view != [self.view viewWithTag:1]) {
        [(UITextField *)[self.view viewWithTag:1] resignFirstResponder];
    }
    //不是cell  则将打开的cell全部左滑初始化
    if(![touch.view isKindOfClass:[CustomTableViewCell class]]){
        //遍历cell
        for (int row = 0; row < _dataListForDisplay.count; row ++) {
            NSUInteger section = 0;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            CustomTableViewCell * cell = (CustomTableViewCell *)[_tableViewForDisplay cellForRowAtIndexPath:indexPath];
            //判断是否右滑  如果右滑了左滑还原
            if (cell.backgroundScrollView.contentOffset.x > UISCREENWIDTH /2) {
                [UIView animateWithDuration:0.3 animations:^{
                    cell.backgroundScrollView.contentOffset = CGPointMake(0, 0);
                }];
            }
        }
    }
    //是cell  scrollView捕获了touch事件   这里监控不到了
//    else{
////        CustomTableViewCell * theCell = (CustomTableViewCell *)touch.view;
//        //如果是cell  则判断现在是初始状态还是已经划出
//        }
}

#pragma -mark Scroll
//1、只要view有滚动（不管是拖、拉、放大、缩小等导致）都会执行此函数
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
}
//2、将要开始拖拽，手指已经放在view上并准备拖动的那一刻
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //    NSLog(@"2");
    
}
//3、将要结束拖拽，手指已拖动过view并准备离开手指的那一刻，注意：当属性pagingEnabled为YES时，此函数不被调用
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    //    if (scrollToRight) {
    //        [UIView animateWithDuration:0.1 animations:^{
    //            //scrollView.contentOffset = CGPointMake(self.frame.size.width/2, 0);
    //            self.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    //        }];
    //    }else{
    //        [UIView animateWithDuration:0.1 animations:^{
    //            scrollView.contentOffset = CGPointMake(0, 0);
    //        }];
    //    }
    
    //    NSLog(@"contentOffset %f  %@",scrollView.contentOffset.x, scrollToRight ? @"right":@"left");
}
//4、已经结束拖拽，手指刚离开view的那一刻
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerat{
    //    NSLog(@"4");
    //    if (scrollView.contentOffset.x >= ) {
    //        <#statements#>
    //    }
    //    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    [self cellBack:nil];

    NSUInteger row = 0;
    NSUInteger section = 0;
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    
    for (row = 0; row < _dataListForDisplay.count; row++) {
        [_tableViewForDisplay deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    }
}

@end

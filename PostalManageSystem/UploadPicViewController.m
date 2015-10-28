//
//  UploadPicViewController.m
//  PostalManageSystem
//
//  Created by ZengYifei on 15/9/13.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

#import "UploadPicViewController.h"
#define BACKGROUNDIMGVIEWWIDTH (UISCREENHEIGHT*4/5 - 145)
#define BIGBACKGROUNDIMGVIEWWIDTH ((UISCREENHEIGHT*4/5 - 65)>UISCREENWIDTH ? UISCREENWIDTH:(UISCREENHEIGHT*4/5 - 65))
@interface UploadPicViewController()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate>{
    AppDelegate *app;
    BOOL picIsChoosen;
    UIAlertView * alerts;
    BOOL isUploading;
    BOOL uploadSuccess;
    int picCount;
    int stepFlag;
    UIButton * cancelBtn;
    UILabel * backgroundViewLabel;
    UIImageView * firstImgView;
    UIImageView * secondImgView;
    BOOL uploadStates;
    int uploadKinds;
}
@property (strong,nonatomic) UIImagePickerController * imagePicker;
@property (strong,nonatomic) UIView * backgroundView;
@property (strong,nonatomic) UIView * blackView;
@property (strong,nonatomic) UIImageView * backgroudnImgView;
@property (strong,nonatomic) NSMutableDictionary * formData;
@property (strong,nonatomic) NSMutableDictionary * formData2;
@end

@implementation UploadPicViewController


#pragma mark - UI

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(id) initWithUploadState:(BOOL)uploadState AndUrl:(NSString *)url AndCountOfPic:(int )count AndFormName:(NSString *)formName AndUploadKind:(int)uploadKind{
    
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.view.backgroundColor = [UIColor clearColor];
    }
    uploadKinds = uploadKind;
    uploadStates = uploadState;
    picCount = count;
    stepFlag = 1;
    _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, UISCREENHEIGHT/5, UISCREENWIDTH, UISCREENHEIGHT*4/5)];
    _backgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_backgroundView];
    
    backgroundViewLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UISCREENWIDTH, 45)];
    backgroundViewLabel.text = formName;
    backgroundViewLabel.font = [UIFont systemFontOfSize:14];
    backgroundViewLabel.backgroundColor = UIColorFromRGBValue(0xc0c0c0);
    backgroundViewLabel.textAlignment = NSTextAlignmentCenter;
    [_backgroundView addSubview:backgroundViewLabel];

    cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(UISCREENWIDTH -55, 0, 55, backgroundViewLabel.frame.size.height);
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelBtn setTitle:@"返回" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [_backgroundView addSubview:cancelBtn];
    
    if (picCount != 1) {
        if ([[app.selectedCellData objectForKey:@"type"]isEqualToString:@"Txyw"]) {
            backgroundViewLabel.text = @"停限业务申请表";
        }else{
            backgroundViewLabel.text = @"撤销场所登记表";
        }
        [cancelBtn setTitle:@"下一张" forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
        firstImgView = [[UIImageView alloc]init];
        secondImgView = [[UIImageView alloc]init];
    }else{
        [cancelBtn addTarget:self action:@selector(cancelViewForUpload) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIButton * imageFromAlbumBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageFromAlbumBtn.frame = CGRectMake((UISCREENWIDTH/4-33.75),_backgroundView.frame.size.height - 80, 45, 65);
    [imageFromAlbumBtn addTarget:self action:@selector(pickImageFromAlbum) forControlEvents:UIControlEventTouchUpInside];
    [imageFromAlbumBtn setTitleColor:[UIColor yellowColor]forState:UIControlStateNormal];
    [_backgroundView addSubview:imageFromAlbumBtn];
    
    UIImageView * imageFromAlbumImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    imageFromAlbumImgView.image = [UIImage imageNamed:@"images"];
    [imageFromAlbumBtn addSubview:imageFromAlbumImgView];
    
    UILabel * imageFromAlbumLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 45, 45, 25)];
    imageFromAlbumLabel.text = @"图库";
    imageFromAlbumLabel.font = [UIFont systemFontOfSize:15];
    imageFromAlbumLabel.textAlignment = NSTextAlignmentCenter;
    [imageFromAlbumBtn addSubview:imageFromAlbumLabel];
    
    UIButton * imageFromCameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageFromCameraBtn.frame = CGRectMake(UISCREENWIDTH/4*2-22.5, _backgroundView.frame.size.height - 80, 45, 65);
    [imageFromCameraBtn addTarget:self action:@selector(pickImageFromCamera) forControlEvents:UIControlEventTouchUpInside];
    [imageFromCameraBtn setTitleColor:[UIColor yellowColor]forState:UIControlStateNormal];
    [_backgroundView addSubview:imageFromCameraBtn];
    
    UIImageView * imageFromCameraImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    imageFromCameraImgView.image = [UIImage imageNamed:@"cameras"];
    [imageFromCameraBtn addSubview:imageFromCameraImgView];
    
    UILabel * imageFromCameraLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 45, 45, 25)];
    imageFromCameraLabel.text = @"相机";
    imageFromCameraLabel.font = [UIFont systemFontOfSize:15];
    imageFromCameraLabel.textAlignment = NSTextAlignmentCenter;
    [imageFromCameraBtn addSubview:imageFromCameraLabel];
    
    
    UIButton * imageUploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageUploadBtn.frame = CGRectMake(UISCREENWIDTH/4*3-11.25, _backgroundView.frame.size.height - 80, 45, 65);
    [imageUploadBtn addTarget:self action:@selector(uploadAction) forControlEvents:UIControlEventTouchUpInside];
    [imageUploadBtn setTitleColor:[UIColor yellowColor]forState:UIControlStateNormal];
    [_backgroundView addSubview:imageUploadBtn];
    
    UIImageView * imageUploadImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    imageUploadImgView.image = [UIImage imageNamed:@"uploads"];
    [imageUploadBtn addSubview:imageUploadImgView];
    
    UILabel * imageUploadLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 45, 45, 25)];
    imageUploadLabel.text = @"上传";
    imageUploadLabel.font = [UIFont systemFontOfSize:15];
    imageUploadLabel.textAlignment = NSTextAlignmentCenter;
    [imageUploadBtn addSubview:imageUploadLabel];
    
    _backgroudnImgView = [[UIImageView alloc]initWithFrame:CGRectMake((UISCREENWIDTH - BACKGROUNDIMGVIEWWIDTH)/2, 45, BACKGROUNDIMGVIEWWIDTH, BACKGROUNDIMGVIEWWIDTH)];
    _backgroudnImgView.image = [UIImage imageNamed:@"tup"];//backgroundImage
    [_backgroundView addSubview:_backgroudnImgView];
    
    _blackView = [[UIView alloc]initWithFrame:self.view.bounds];
    _blackView.alpha = 0.0;
    _blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_blackView];
    [self.view sendSubviewToBack:_blackView];
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    picIsChoosen = NO;
    isUploading = NO;
    uploadSuccess = NO;
    
    
    //判断状态  以下为查看状态
    if (!uploadStates) {
        [GMDCircleLoader setOnView:self.view withTitle:@"加载中..." animated:YES];
        imageUploadBtn.hidden = YES;
        imageFromCameraBtn.hidden = YES;
        imageFromAlbumBtn.hidden = YES;
        NSLog(@"%f",BIGBACKGROUNDIMGVIEWWIDTH);
        _backgroudnImgView.frame = CGRectMake((UISCREENWIDTH - BIGBACKGROUNDIMGVIEWWIDTH)/2, 45, BIGBACKGROUNDIMGVIEWWIDTH, BIGBACKGROUNDIMGVIEWWIDTH);
        NSDictionary * dic = [[NSDictionary alloc]initWithObjectsAndKeys:url,@"imageUrl", nil];
        NSDictionary * dics = [[NSDictionary alloc]initWithObjectsAndKeys:dic,@"info",@"resul",@"sdf", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"bsdtApi/get" object:self userInfo:dics];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(uploadFeedback:) name:@"bsdtApi/edit" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cellDataBack:) name:@"bsdtApi/get" object:nil];

    //获取单例
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGBValue(0x028e45)];//邮政的绿色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor yellowColor]];    //导航栏按钮颜色
}

- (void)viewDidAppear:(BOOL)animated{
    //[self pickImageFromAlbum];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    _blackView.alpha = 0.5;
    [UIView commitAnimations];
}

- (void)cellDataBack:(NSNotification *)note{
    NSDictionary * tempDic = [[NSDictionary alloc]initWithDictionary: [note userInfo]];
    if (tempDic.count == 2) {
        _formData = [tempDic objectForKey:@"info"];
        NSString * url = [_formData objectForKey:@"imageUrl"];
        if(url.length > 10){
            NSString * url = [_formData objectForKey:@"imageUrl"];
            NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
            UIImage * image = [[UIImage alloc] initWithData:imageData];
            //验证图片是否下载正确
            NSData * imgData = [ConnectionAPI picToStringWithImage:image];
            if ([imgData isKindOfClass:[NSData class]]) {
                _backgroudnImgView.image = [[UIImage alloc] initWithData:imageData];
                [self adjustPicForDisplay:_backgroudnImgView.image];
            }else{//图片加载失败
                UIImage * failedImg = [UIImage imageNamed:@"failed"];
                _backgroudnImgView.image =  failedImg;
                [self adjustPicForDisplay:_backgroudnImgView.image];
                [GMDCircleLoader hideFromView:self.view animated:YES];
                alerts = [[UIAlertView alloc]initWithTitle:nil message:@"图片加载失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alerts show];
            }
        }else{
            //没有图片  什么都不做
        }
    }else{
        //第一张图片
        _formData = [tempDic objectForKey:@"info1"];
        NSString * url = [_formData objectForKey:@"imageUrl"];
        if(url.length > 10){
            
            NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
            UIImage * image = [[UIImage alloc] initWithData:imageData];
            //验证图片是否下载正确
            NSData * imgData = [ConnectionAPI picToStringWithImage:image];
            if ([imgData isKindOfClass:[NSData class]]) {
                firstImgView.image = [[UIImage alloc] initWithData:imageData];
                _backgroudnImgView.image = [[UIImage alloc] initWithData:imageData];
                [self adjustPicForDisplay:_backgroudnImgView.image];
            }else{//图片加载失败
                UIImage * failedImg = [UIImage imageNamed:@"failed"];
                _backgroudnImgView.image =  failedImg;
                firstImgView.image =  failedImg;
                [self adjustPicForDisplay:_backgroudnImgView.image];
                [GMDCircleLoader hideFromView:self.view animated:YES];
                alerts = [[UIAlertView alloc]initWithTitle:nil message:@"图片加载失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alerts show];
            }
        }else{
            firstImgView.image = [UIImage imageNamed:@"tup"];
        }
        
        //第二张图片
        _formData2 = [tempDic objectForKey:@"info2"];
        url = [_formData2 objectForKey:@"imageUrl"];
        if(url.length > 10){
            NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
            UIImage * image = [[UIImage alloc] initWithData:imageData];
            //验证图片是否下载正确
            NSData * imgData = [ConnectionAPI picToStringWithImage:image];
            if ([imgData isKindOfClass:[NSData class]]) {
                secondImgView.image = [[UIImage alloc] initWithData:imageData];
            }else{//图片加载失败
                UIImage * failedImg = [UIImage imageNamed:@"failed"];
                secondImgView.image =  failedImg;

                [GMDCircleLoader hideFromView:self.view animated:YES];
                alerts = [[UIAlertView alloc]initWithTitle:nil message:@"图片加载失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alerts show];
            }
        }else{
            secondImgView.image = [UIImage imageNamed:@"tup"];
        }
    }
    [GMDCircleLoader hideFromView:self.view animated:YES];
}

//等比例缩放适配
- (void)adjustPicForDisplay:(UIImage *)selectedImg{
    float imgRatio = selectedImg.size.height/selectedImg.size.width ;
    NSLog(@"imgRatio:%@",NSStringFromCGSize(selectedImg.size));
    float screenDisplayAreaRatio;
    if (!uploadStates) {
        screenDisplayAreaRatio = BIGBACKGROUNDIMGVIEWWIDTH/UISCREENWIDTH;//1;
    }else{
        screenDisplayAreaRatio = BACKGROUNDIMGVIEWWIDTH/UISCREENWIDTH;//1;
    }
    CGSize bigImgSize;
    if (imgRatio>screenDisplayAreaRatio) {
        //高为最大值   宽等比例转换
        bigImgSize = CGSizeMake((screenDisplayAreaRatio * UISCREENWIDTH)/imgRatio, (screenDisplayAreaRatio * UISCREENWIDTH));
        //高为最大值  则高度固定    宽的起始点浮动（frame.x）
        _backgroudnImgView.frame = CGRectMake((UISCREENWIDTH - bigImgSize.width)/2, 50, bigImgSize.width, bigImgSize.height);
    }else{
        //宽为最大值   长等比例转换
        bigImgSize = CGSizeMake(UISCREENWIDTH, UISCREENWIDTH*imgRatio);
        //宽为最大值  则宽度固定    长的高度点浮动（frame.y）
        _backgroudnImgView.frame = CGRectMake((UISCREENWIDTH - bigImgSize.width)/2, 50, bigImgSize.width, bigImgSize.height);
    }
    _backgroudnImgView.center = CGPointMake(UISCREENWIDTH/2, 50+(screenDisplayAreaRatio * UISCREENWIDTH)/2);
}

//图片转二进制
+ (NSData *)picToStringWithImage:(UIImage *)image{
    NSData *data;
    if (UIImagePNGRepresentation(image)==nil) {
        data = UIImageJPEGRepresentation(image, 0.1);
    }else{
        data = UIImagePNGRepresentation(image);
    }
    return data;
}

//二进制转图片
+ (UIImage * )stringToPicWithImage:(NSData *)imageData{
    UIImage *image = [UIImage imageWithData: imageData];
    return image;
}

-(void)uploadAction{
    //上传图片
    if (picIsChoosen == NO) {
        alerts = [[UIAlertView alloc]initWithTitle:nil message:@"请先选择照片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alerts show];
        return;
    }
    if (isUploading) {
        return;
    }else{
        isUploading = YES;
    }
    alerts = [[UIAlertView alloc]initWithTitle:nil message:@"上传中" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alerts show];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector: @selector(uploadNow) userInfo:nil repeats:NO];
}

- (void)uploadNow{
////    压缩图片
//        NSData *data;
//        if (UIImagePNGRepresentation(_backgroudnImgView.image) == nil)
//        {
//            data = UIImageJPEGRepresentation(_backgroudnImgView.image, 0.8);
//        }
//        else
//        {
//            data = UIImagePNGRepresentation(_backgroudnImgView.image);
//        }
//
//    NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//    //文件管理器
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
//    [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
//    [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
//    //    得到选择后沙盒中图片的完整路径
//    NSString * filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
//    //读取沙盒中的图片数据
//    UIImage * imgs = [[UIImage alloc]initWithContentsOfFile:filePath];
    
//    _backgroudnImgView.image = imgs;
//    _backgroudnImgView.image = [UploadPicViewController stringToPicWithImage:data];
    
    //一张图片时
    if(picCount == 1){
        NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:_backgroudnImgView.image,@"pic", nil];
        NSString * resultString = [app.network PostImagesToServer:@"http://222.85.149.6:88/GuiYangPost/uploadpicture/upload" dicPostParams:dic dicImages:dic];
        uploadSuccess = NO;
        //返回后json解析
        NSData *aData = [resultString dataUsingEncoding: NSUTF8StringEncoding];
        
        NSDictionary * resultDic =  [NSJSONSerialization JSONObjectWithData:aData options:NSJSONReadingMutableContainers error:nil];
        if (resultDic == nil) {
            resultDic = [[NSDictionary alloc]init];
        }
        if ([[resultDic objectForKey:@"result"]isEqualToString:@"1"]) {
                [alerts dismissWithClickedButtonIndex:0 animated:NO];
                //将服务器返回的url存在本地  供详情列表提交时使用
                self.picUrl = [resultDic objectForKey:@"url"];
            if (uploadKinds == 0) {
                //修改
                NSString * interface = [app.selectedCellData objectForKey:@"type"];
                NSString * url = [resultDic objectForKey:@"url"];
                [_formData setObject:url forKey:@"imageUrl"];
                [app.network editWithInterface:interface AndInfo:_formData AndExtraInfo:nil];
            }
            //表内上传  无需绑定flowID
            else{
                uploadSuccess = YES;
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"上传成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                alert.delegate = self;
                [alert show];
                isUploading = NO;
            }
        }else{
            [alerts dismissWithClickedButtonIndex:0 animated:NO];
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"上传失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            isUploading = NO;
        }
    }
    //两张图片时
    else if (picCount == 2){
        //第一张图片上传
        NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:firstImgView.image,@"pic1", nil];
        NSDictionary * resultDic =  [self uploadPicAndGetResultWith:dic];
        if ([[resultDic objectForKey:@"result"]isEqualToString:@"1"]) {
            [alerts dismissWithClickedButtonIndex:0 animated:NO];
            //修改
            NSString * interface = [app.selectedCellData objectForKey:@"type"];
            NSString * url = [resultDic objectForKey:@"url"];
            [_formData setObject:url forKey:@"imageUrl"];
            
            //第二张图片上传
            NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:secondImgView.image,@"pic2", nil];
            NSDictionary * resultDic =  [self uploadPicAndGetResultWith:dic];
            if ([[resultDic objectForKey:@"result"]isEqualToString:@"1"]) {
                [alerts dismissWithClickedButtonIndex:0 animated:NO];
                //修改
                url = [resultDic objectForKey:@"url"];
                [_formData2 setObject:url forKey:@"imageUrl"];
                
                //集成1、2两张图片信息上传绑定flowdi
                [app.network editWithInterface:interface AndInfo:_formData AndExtraInfo:_formData2];
            }else{
                [alerts dismissWithClickedButtonIndex:0 animated:NO];
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"上传失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
                isUploading = NO;
                NSLog(@"第二张图片上传失败");
            }
        }else{
            [alerts dismissWithClickedButtonIndex:0 animated:NO];
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"上传失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            isUploading = NO;
            NSLog(@"第一张图片上传失败");
        }
    }
}

- (NSDictionary *)uploadPicAndGetResultWith:(NSMutableDictionary *)dic{
    NSString * resultString = [app.network PostImagesToServer:@"http://222.85.149.6:88/GuiYangPost/uploadpicture/upload" dicPostParams:dic dicImages:dic];
    uploadSuccess = NO;
    //返回后json解析
    NSData *aData = [resultString dataUsingEncoding: NSUTF8StringEncoding];
    
    NSDictionary * resultDic =  [NSJSONSerialization JSONObjectWithData:aData options:NSJSONReadingMutableContainers error:nil];
    if (resultDic == nil) {
        resultDic = [[NSDictionary alloc]init];
    }
    return resultDic;
}

- (void)uploadFeedback:(NSNotification *)note{
    NSString * state = [[note userInfo] objectForKey:@"result"];
    if ([state isEqualToString:@"0"]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"上传失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        uploadSuccess = YES;
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"上传成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alert.delegate = self;
        [alert show];
    }
    isUploading = NO;
}

- (void)pickImageFromCamera
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor lightTextColor]];//邮政的绿色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];    //导航栏按钮颜色
    
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    _imagePicker.allowsEditing = YES;
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

- (void)pickImageFromAlbum{
    [[UINavigationBar appearance] setBarTintColor:[UIColor lightTextColor]];//邮政的绿色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];    //导航栏按钮颜色
    
    _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    _imagePicker.allowsEditing = NO;
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

#pragma -mark 选择的图片
//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//        NSData *data;
//        if (UIImagePNGRepresentation(image) == nil)
//        {
//            data = UIImageJPEGRepresentation(image, 0.8);
//        }
//        else
//        {
//            data = UIImagePNGRepresentation(image);
//        }
//        //图片保存的路径
//        //这里将图片放在沙盒的documents文件夹中
//        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//        //文件管理器
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//       
//        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
//        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
//        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        //得到选择后沙盒中图片的完整路径

        //filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        //关闭相册界面

        [picker dismissViewControllerAnimated:YES completion:nil];
        //创建一个选择后图片的小图标放在下方
        //类似微薄选择图后的效果
//        UIImageView *smallimage = [[UIImageView alloc] initWithFrame:CGRectMake(50, NAVIGATIONHEIGHT + UISCREENWIDTH, 200, 200)];
        [self adjustPicForDisplay:image];
        
        //两张图片时识别对应状态并且赋值
        if (picCount == 2 && [cancelBtn.titleLabel.text isEqualToString:@"下一张"]) {
            firstImgView.image = image;
        }else if(picCount == 2 && [cancelBtn.titleLabel.text isEqualToString:@"上一张"]) {
            secondImgView.image = image;
        }
        
        _backgroudnImgView.image = image;
        picIsChoosen = YES;
        //加在视图中
//        [self.view addSubview:smallimage];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)nextStep{
    if (stepFlag == 1) {
        if ([[app.selectedCellData objectForKey:@"type"]isEqualToString:@"Txyw"]) {
            backgroundViewLabel.text = @"停限业务邮政营业场所基本情况表";
        }else{
            backgroundViewLabel.text = @"撤销场所基本情况表";
        }
        firstImgView.image = _backgroudnImgView.image;
        _backgroudnImgView.image = secondImgView.image;
        if (_backgroudnImgView.image !=nil) {
            [self adjustPicForDisplay:_backgroudnImgView.image];
        }
        [cancelBtn setTitle:@"上一张" forState:UIControlStateNormal];
        stepFlag = 2;
    }else if (stepFlag == 2){
        if ([[app.selectedCellData objectForKey:@"type"]isEqualToString:@"Txyw"]) {
            backgroundViewLabel.text = @"停限业务申请表";
        }else{
            backgroundViewLabel.text = @"撤销场所登记表";
        }
        secondImgView.image = _backgroudnImgView.image;
        _backgroudnImgView.image = firstImgView.image;
        if (_backgroudnImgView.image !=nil) {
            [self adjustPicForDisplay:_backgroudnImgView.image];
        }
        [cancelBtn setTitle:@"下一张" forState:UIControlStateNormal];
        stepFlag = 1;
    }
}

- (void)cancelViewForUpload{
//    if (picCount != 1) {
//    
//    }else{
        _blackView.alpha = 0.0;
        [self dismissViewControllerAnimated:YES completion:nil];
//    }
}

#pragma mark - touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    if (touch.view == _blackView) {
        [self cancelViewForUpload];
    }
}

#pragma mark - alertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView != alerts && buttonIndex == 0 && uploadSuccess) {
        [self cancelViewForUpload];
    }else if(alertView != alerts && buttonIndex == 0 && !uploadSuccess) {
//        [self cancelView];
    }
}
@end

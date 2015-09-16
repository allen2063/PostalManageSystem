//
//  CustomTableViewCell.m
//  PostalManageSystem
//
//  Created by ZengYifei on 15/9/14.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

#import "CustomTableViewCell.h"
#define CELLWIDTH (self.frame.size.width-15)
#define defualtFont 15
@implementation CustomTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width, 80);         //iPhone6上宽度实际是375
        //        self.backgroundColor = UIColorFromRGBValue(0xb3d5bd);//[UIColor whiteColor];f0f0f0 e2e2e2
        self.backgroundScrollView = [[MyScrollView alloc]initWithFrame:self.bounds];
        self.backgroundScrollView.contentSize = CGSizeMake(self.frame.size.width *1.6, self.frame.size.height);
        self.backgroundScrollView.delegate = self ;
        self.backgroundScrollView.pagingEnabled = YES;
        self.backgroundScrollView.showsHorizontalScrollIndicator = NO;
        self.backgroundScrollView.bounces = NO;
        [self addSubview:self.backgroundScrollView] ;
        
        self.serviceTypeLabel  =[[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.frame.size.width-15, self.frame.size.height/3)];
        self.serviceTypeLabel.backgroundColor = [UIColor clearColor];
        self.serviceTypeLabel.font = [UIFont systemFontOfSize:defualtFont];
        self.serviceTypeLabel.textAlignment = NSTextAlignmentLeft;
        self.serviceTypeLabel.text = @"业务类型:设置新网点";
        self.serviceTypeLabel.textColor = UIColorFromRGBValue(0x333333);
        self.serviceTypeLabel.numberOfLines = 2;
        [self.backgroundScrollView addSubview:self.serviceTypeLabel];
        
        self.placeNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, self.frame.size.height*1/3, self.frame.size.width-15, self.frame.size.height/3)];
        self.placeNameLabel.backgroundColor = [UIColor clearColor];
        self.placeNameLabel.font = [UIFont systemFontOfSize:defualtFont];
        self.placeNameLabel.text = @"场所名称:花溪区营业厅网店";
        self.placeNameLabel.textColor = UIColorFromRGBValue(0x333333);
        self.placeNameLabel.textAlignment = NSTextAlignmentLeft;
        [self.backgroundScrollView addSubview:self.placeNameLabel];
        
        self.timeAndApllyPersonLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, self.frame.size.height*2/3, self.frame.size.width-15, self.frame.size.height/3)];
        self.timeAndApllyPersonLabel.backgroundColor = [UIColor clearColor];
        self.timeAndApllyPersonLabel.font = [UIFont systemFontOfSize:defualtFont];
        self.timeAndApllyPersonLabel.text = @"申请时间:2015-08-29       申请人:测试";
        self.timeAndApllyPersonLabel.textColor = UIColorFromRGBValue(0x333333);
        self.timeAndApllyPersonLabel.textAlignment = NSTextAlignmentLeft;
        [self.backgroundScrollView addSubview:self.timeAndApllyPersonLabel];
        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width/5, self.frame.size.height);
        UIImageView * deleteImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _deleteBtn.frame.size.width*2/3, _deleteBtn.frame.size.width*2/3/7*9)];
        deleteImgView.frame = CGRectMake(0, 0, deleteImgView.frame.size.width/2, deleteImgView.frame.size.height/2);
        deleteImgView.center = CGPointMake(self.frame.size.width/10, self.frame.size.height/2);
        deleteImgView.image = [UIImage imageNamed:@"delete"];
        [_deleteBtn addSubview:deleteImgView];
        _deleteBtn.backgroundColor = UIColorFromRGBValue(0xc0c0c0);	//[UIColor lightGrayColor];
        [_deleteBtn.layer setMasksToBounds:YES];
        [_deleteBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
        [_deleteBtn.layer setBorderWidth:1.0];   //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
        [_deleteBtn.layer setBorderColor:colorref];//边框颜色
        _deleteBtn.tag = 1;
        [_deleteBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.backgroundScrollView addSubview:_deleteBtn];
        
        _modifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _modifyBtn.frame = CGRectMake(self.frame.size.width*6/5, 0, self.frame.size.width/5, self.frame.size.height);
        UIImageView * modifyImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _deleteBtn.frame.size.width*2/3, _deleteBtn.frame.size.width*2/3)];
        modifyImgView.frame = CGRectMake(0, 0, modifyImgView.frame.size.width/1.5, modifyImgView.frame.size.height/1.5);
        modifyImgView.center = CGPointMake(self.frame.size.width/10, self.frame.size.height/2);
        modifyImgView.image = [UIImage imageNamed:@"edit"];
        [_modifyBtn addSubview:modifyImgView];
        _modifyBtn.backgroundColor = UIColorFromRGBValue(0xacacac);//[UIColor lightGrayColor];acacac
        [_modifyBtn.layer setMasksToBounds:YES];
        [_modifyBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
        [_modifyBtn.layer setBorderWidth:1.0];   //边框宽度
        colorSpace = CGColorSpaceCreateDeviceRGB();
        colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
        [_modifyBtn.layer setBorderColor:colorref];//边框颜色
        _modifyBtn.tag = 2;
        [_modifyBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.backgroundScrollView addSubview:_modifyBtn];
        
        _uploadPicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _uploadPicBtn.frame = CGRectMake(self.frame.size.width*7/5, 0, self.frame.size.width/5, self.frame.size.height);
        UIImageView * uploadImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _deleteBtn.frame.size.width*2/3, _deleteBtn.frame.size.width*2/3/16*10)];
        uploadImgView.center = CGPointMake(self.frame.size.width/10, self.frame.size.height/2);
        uploadImgView.image = [UIImage imageNamed:@"upload"];
        [_uploadPicBtn addSubview:uploadImgView];
        _uploadPicBtn.backgroundColor = UIColorFromRGBValue(0x999999);//[UIColor lightGrayColor];
        [_uploadPicBtn.layer setMasksToBounds:YES];
        [_uploadPicBtn.layer setCornerRadius:0.0]; //设置矩形四个圆角半径
        [_uploadPicBtn.layer setBorderWidth:1.0];   //边框宽度
        colorSpace = CGColorSpaceCreateDeviceRGB();
        colorref = CGColorCreate(colorSpace,(CGFloat[]){ 204/255.0, 204/255.0, 204/255.0, 1 });
        [_uploadPicBtn.layer setBorderColor:colorref];//边框颜色
        _uploadPicBtn.tag = 3;
        [_uploadPicBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.backgroundScrollView addSubview:_uploadPicBtn];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)btnAction:(UIButton *)sender{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:self,@"cell", nil];
    switch (sender.tag) {
        case 1:
            [dic setObject:@"delete" forKey:@"action"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"BtnAction" object:self userInfo:dic];
            break;
        case 2:
            [dic setObject:@"edit" forKey:@"action"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"BtnAction" object:self userInfo:dic];
            break;
        case 3:
            [dic setObject:@"upload" forKey:@"action"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"BtnAction" object:self userInfo:dic];
            break;
        default:
            break;
    }
}


//- (void)scrollViewBack{
//    if (_isScrolledToRight == YES) {
//        [UIView animateWithDuration:0.3 animations:^{
//            self.backgroundScrollView.contentOffset = CGPointMake(0, 0);
//        }];
//    }
//}

#pragma -mark Scroll
//1、只要view有滚动（不管是拖、拉、放大、缩小等导致）都会执行此函数
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if (scrollView.contentOffset.x == self.frame.size.width*3/5) {
        _isScrolledToRight = YES;
        //        NSDictionary * dic = [[NSDictionary alloc]initWithObjectsAndKeys:self,@"cell", nil];
        //        [[NSNotificationCenter defaultCenter] postNotificationName:@"isScrolledToRight" object:self userInfo:dic];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //        [UIView animateWithDuration:0.3 animations:^{
        //            self.backgroundScrollView.contentOffset = CGPointMake(0, 0);
        //        }];
    }else if(scrollView.contentOffset.x == 0){
        //        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        _isScrolledToRight = NO;
    }else{
        _isScrolledToRight = NO;
    }
    //    NSLog(@"1");
}
//2、将要开始拖拽，手指已经放在view上并准备拖动的那一刻
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //    NSLog(@"2");
    
}
//3、将要结束拖拽，手指已拖动过view并准备离开手指的那一刻，注意：当属性pagingEnabled为YES时，此函数不被调用
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    //    NSLog(@"contentOffset %f  %@",scrollView.contentOffset.x, scrollToRight ? @"right":@"left");
}
//4、已经结束拖拽，手指刚离开view的那一刻
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerat{
    //    NSLog(@"4");
    NSDictionary * dic = [[NSDictionary alloc]initWithObjectsAndKeys:self,@"cell", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isScrolledToRight" object:self userInfo:dic];
    
}
@end



@implementation MyScrollView
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if ( !self.dragging )
    {
        [[self nextResponder] touchesBegan:touches withEvent:event];
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    if ( !self.dragging )
    {
        [[self nextResponder] touchesEnded:touches withEvent:event];
    }
}
@end

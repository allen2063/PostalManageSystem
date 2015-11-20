//
//  ApplyAddBranchViewController.swift
//  POST
//
//  Created by QiaoLibo on 15/9/6.
//  Copyright (c) 2015年 Qiaolibo. All rights reserved.
//

import UIKit

class ApplyAddBranchViewController: UIViewController, UIActionSheetDelegate, UITextFieldDelegate, UIScrollViewDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.textColor = UIColor.blackColor()
    }
    
    
    //当键盘出现或改变时调用
    var positionChangeY: CGFloat = 0
    
    func keyboardWillShow(aNotification: NSNotification)
    {
        let userInfo: NSDictionary = aNotification.userInfo!
        let aValue: NSValue = (userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey) as? NSValue)!
        let keyboardRect: CGRect = aValue.CGRectValue()
        let keyboardHeight: CGFloat = keyboardRect.size.height
        
        let rootView = self.view as! UIScrollView
        
        let realContentOffsetY = rootView.contentOffset.y
        
        self.positionChangeY = rootView.contentOffset.y
        
        if (UIScreen.mainScreen().bounds.height < keyboardHeight + textFieldHeight! - realContentOffsetY)
        {
//            rootView.contentSize = CGSize(width: 320, height: 1350)
            UIView.animateWithDuration(0.3, animations: {
       
                
                rootView.contentOffset.y = (keyboardHeight + self.textFieldHeight! ) - (UIScreen.mainScreen().bounds.height)
                
            })
        }
    }
    
    func keyboardWillHide(aNotification: NSNotification)
    {
        let rootView = self.view as! UIScrollView
        
//        rootView.contentSize = CGSize(width: 320, height: 1250)
        UIView.animateWithDuration(0.3, animations: {
            rootView.contentOffset.y = self.positionChangeY
        })
    }
    
    var textFieldHeight: CGFloat?
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textFieldHeight = textField.frame.size.height + textField.frame.origin.y
        return true
    }

    
    
    @IBOutlet weak var chooseShiXiang: UILabel!
    @IBOutlet weak var chooseJingYingFangShi: UILabel!
    @IBOutlet weak var chooseFangWuChangQuan: UILabel!
    @IBOutlet weak var chooseSheZhiDiYu: UILabel!
    @IBOutlet weak var chooseMenQianYouTong: UILabel!

    var tapedLabel = 0
    @IBAction func printActionSheet(sender: AnyObject) {
        if (sender as? UIGestureRecognizer != nil) {
            if sender.view == chooseShiXiang {
                let actionSheet = UIActionSheet(title: "选择事项", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "设置邮政普遍服务营业场所", "设置其他营业场所")
                actionSheet.showInView(self.view)
                tapedLabel = 1
            }
            
            if sender.view == chooseJingYingFangShi {
                let actionSheet = UIActionSheet(title: "选择经营方式", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自办","委办")
                actionSheet.showInView(self.view)
                tapedLabel = 2
            }
            
            if sender.view == chooseFangWuChangQuan {
                let actionSheet = UIActionSheet(title: "选择房屋产权", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自有","租用","无偿使用","其他")
                actionSheet.showInView(self.view)
                tapedLabel = 3
            }
            
            if sender.view == chooseSheZhiDiYu {
                let actionSheet = UIActionSheet(title: "选择地域", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "城市地区","乡镇地区","农村地区")
                actionSheet.showInView(self.view)
                tapedLabel = 4
            }
            
            if sender.view == chooseMenQianYouTong {
                let actionSheet = UIActionSheet(title: "选择有无门前邮筒", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "有","无")
                actionSheet.showInView(self.view)
                tapedLabel = 5
            }
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if actionSheet.buttonTitleAtIndex(buttonIndex) != "取消"{
            if  tapedLabel == 1 {
                chooseShiXiang.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseShiXiang.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 2 {
                chooseJingYingFangShi.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseJingYingFangShi.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 3 {
                chooseFangWuChangQuan.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseFangWuChangQuan.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 4 {
                chooseSheZhiDiYu.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseSheZhiDiYu.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 5 {
                chooseMenQianYouTong.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseMenQianYouTong.textColor = UIColor.blackColor()
            }
        }
    }

    //TextField
    @IBOutlet weak var changSuoMingCheng: UITextField!
    @IBOutlet weak var shi: UITextField!    //场所地址市
    @IBOutlet weak var xian: UITextField!   //场所地址县
    @IBOutlet weak var jieDao: UITextField! //场所地址街道
    @IBOutlet weak var menPaiHao: UITextField! //场所地址门牌号
    @IBOutlet weak var jingDu: UITextField! //场所地址经度
    @IBOutlet weak var weiDu: UITextField!  //场所地址纬度
    @IBOutlet weak var youBian: UITextField!  //场所地址邮编
    @IBOutlet weak var shangJiDanWei: UITextField!
    @IBOutlet weak var cangSuoFuZeRen: UITextField!
    @IBOutlet weak var lianXiDianHua: UITextField!
    @IBOutlet weak var kaiYeShiJian: UITextField!
    @IBOutlet weak var jianZhuMianJi: UITextField!
    @IBOutlet weak var yingYeShiJianZhouJi: UITextField!
    @IBOutlet weak var yingYeShiJianZhiZhouJi: UITextField!
    @IBOutlet weak var yingYeShiJianJiDian: UITextField!
    @IBOutlet weak var yingYeShiJianZhiJiDian: UITextField!
    @IBOutlet weak var zhouKaiQuTianShu: UITextField!
    @IBOutlet weak var riKaiQuPinCi: UITextField!
    @IBOutlet weak var fuWuQuYu: UITextField!
    @IBOutlet weak var zhouTouDiTianShu: UITextField!
    @IBOutlet weak var riTouDiPinCi: UITextField!
    @IBOutlet weak var fuWuBanJing: UITextField!
    @IBOutlet weak var fuWuRenKou: UITextField!
    
    
    @IBOutlet weak var XinJian: UIButton!
    @IBOutlet weak var WuLiu: UIButton!
    @IBOutlet weak var JiYou: UIButton!
    @IBOutlet weak var BaoGuo: UIButton!
    @IBOutlet weak var YinShuaPin: UIButton!
    @IBOutlet weak var BaoKanLingShou: UIButton!
    @IBOutlet weak var YouZhengChuXu: UIButton!
    @IBOutlet weak var MangRenDuWu: UIButton!
    @IBOutlet weak var TeKuaiZhuangDi: UIButton!
    @IBOutlet weak var BaoKanDingYue: UIButton!
    @IBOutlet weak var YouZhengHuiDui: UIButton!
    @IBOutlet weak var YIWuBingXinHan: UIButton!
    @IBOutlet weak var LieShiBaoGuo: UIButton!
    @IBOutlet weak var QiTa: UIButton!
    
    @IBAction func touchInsideBtm(sender: AnyObject) {
        
        if let sender = sender as? UIButton {
            if sender == XinJian {
                if XinJian.selected == false {
                    XinJian.selected = true
                } else {
                    XinJian.selected = false
                }
            }
            
            if sender == WuLiu {
                if WuLiu.selected == false {
                    WuLiu.selected = true
                } else {
                    WuLiu.selected = false
                }
                
            }
            if sender == JiYou {
                if JiYou.selected == false {
                    JiYou.selected = true
                } else {
                    JiYou.selected = false
                }
                
            }
            if sender == BaoGuo {
                if BaoGuo.selected == false {
                    BaoGuo.selected = true
                } else {
                    BaoGuo.selected = false
                }
                
            }
            if sender == YinShuaPin {
                if YinShuaPin.selected == false {
                    YinShuaPin.selected = true
                } else {
                    YinShuaPin.selected = false
                }
            }
            if sender == BaoKanLingShou {
                if BaoKanLingShou.selected == false {
                    BaoKanLingShou.selected = true
                } else {
                    BaoKanLingShou.selected = false
                }
                
            }
            if sender == YouZhengChuXu {
                if YouZhengChuXu.selected == false {
                    YouZhengChuXu.selected = true
                } else {
                    YouZhengChuXu.selected = false
                }
                
            }
            if sender == MangRenDuWu {
                if MangRenDuWu.selected == false {
                    MangRenDuWu.selected = true
                } else {
                    MangRenDuWu.selected = false
                }
                
            }
            if sender == TeKuaiZhuangDi {
                if TeKuaiZhuangDi.selected == false {
                    TeKuaiZhuangDi.selected = true
                } else {
                    TeKuaiZhuangDi.selected = false
                }
                
            }
            if sender == BaoKanDingYue {
                if BaoKanDingYue.selected == false {
                    BaoKanDingYue.selected = true
                } else {
                    BaoKanDingYue.selected = false
                }
                
            }
            if sender == YouZhengHuiDui {
                if YouZhengHuiDui.selected == false {
                    YouZhengHuiDui.selected = true
                } else {
                    YouZhengHuiDui.selected = false
                }
                
            }
            if sender == YIWuBingXinHan {
                if YIWuBingXinHan.selected == false {
                    YIWuBingXinHan.selected = true
                } else {
                    YIWuBingXinHan.selected = false
                }
                
            }
            if sender == LieShiBaoGuo {
                if LieShiBaoGuo.selected == false {
                    LieShiBaoGuo.selected = true
                } else {
                    LieShiBaoGuo.selected = false
                }
                
            }
            if sender == QiTa {
                if QiTa.selected == false {
                    QiTa.selected = true
                } else {
                    QiTa.selected = false
                }
            }
        }
    }
    
    let bkView = UIView(frame: CGRect(x: 0, y: UIScreen.mainScreen().bounds.size.height - 80, width: UIScreen.mainScreen().bounds.size.width, height: 80))
    let textViewOnBkView = UITextView(frame: CGRect(x: 45, y: 5, width: UIScreen.mainScreen().bounds.size.width - 80, height: 30))
    let btmOnBkView = UIButton(frame: CGRect(x: 45, y: 40, width: UIScreen.mainScreen().bounds.size.width - 80, height: 30))
    
    
    var flag = 0
    func shenHeYiJianBtnAction() {
        textViewOnBkView.textColor = UIColor.blackColor()
        textViewOnBkView.backgroundColor = UIColor(red: 199/255, green: 228/255, blue: 226/255, alpha: 1)
        
//        label.hidden = true
        
        if flag == 0 {
            btmOnBkView.setTitle("隐藏审核状态", forState: .Normal)
            flag = 1
            print("\(flag)")
            textViewOnBkView.text = app.applyAddDic.valueForKey("sppl") as? String
            textViewOnBkView.textAlignment = .Center
//            viewForShenHeYiJian.addSubview(label)
//            label.hidden = false
            bkView.addSubview(textViewOnBkView)
//            print("\(flag)\(label)")
        } else if flag == 1
        {
            btmOnBkView.setTitle("查看审核意见", forState: .Normal)
            flag = 0
//            label.hidden = true
//            print("\(flag)\(label.superview)")
            textViewOnBkView.removeFromSuperview()
            
        }
    }
    
//    var i = 0
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if UIScreen.mainScreen().bounds.width == 375 {
            bkView.frame.origin.y = (self.view as! UIScrollView).contentOffset.y + UIScreen.mainScreen().bounds.size.height - bkView.frame.size.height - 65
            bkView.frame.size.width = 340
            textViewOnBkView.frame.size.width = 240
            btmOnBkView.frame.size.width = 240
        }
        
        if UIScreen.mainScreen().bounds.width == 414 {
            bkView.frame.origin.y = (self.view as! UIScrollView).contentOffset.y + UIScreen.mainScreen().bounds.size.height - bkView.frame.size.height - 133
            bkView.frame.size.width = 340
            textViewOnBkView.frame.size.width = 240
            btmOnBkView.frame.size.width = 240
        }
        
        if UIScreen.mainScreen().bounds.width == 320 {
            bkView.frame.origin.y = (self.view as! UIScrollView).contentOffset.y + UIScreen.mainScreen().bounds.size.height - bkView.frame.size.height
        }
    }
    
    var app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidDisappear(animated: Bool) {
        app.ServerData = 0
    }
    
    @IBOutlet var tap1: UITapGestureRecognizer!
    @IBOutlet var tap2: UITapGestureRecognizer!
    @IBOutlet var tap3: UITapGestureRecognizer!
    @IBOutlet var tap4: UITapGestureRecognizer!
    @IBOutlet var tap5: UITapGestureRecognizer!
    @IBOutlet weak var commitBtn: UIButton!
    
    
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var bkImageInRootView: UIImageView!
    
    @IBOutlet weak var uploadBtn1: UIButton!
    @IBOutlet weak var uploadBtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("commitResult:"), name: "bsdtApi/add", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("commitResult:"), name: "bsdtApi/edit", object: nil)
        
        //增加监听，当键盘出现或改变时收出消息
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: "UIKeyboardWillShowNotification", object: nil)
        //增加监听，当键退出时收出消息
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: "UIKeyboardWillHideNotification", object: nil)
        
        let labelNav = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        //        labelNav.backgroundColor = UIColor.clearColor
        labelNav.font = UIFont.boldSystemFontOfSize(20)
        labelNav.textColor = UIColor.whiteColor()
        labelNav.textAlignment = .Center
        labelNav.text = "申请设置网点"
        
        self.navigationItem.titleView = labelNav
        
        
        //--------------------------------屏幕适配--------------------------------
        print(self.view.frame)
        if UIScreen.mainScreen().bounds.width == 375 {
            let scaleW: CGFloat = CGFloat(375.0 / 320.0)
            print(scaleW)
            let scaleH: CGFloat  = CGFloat(667.0 / 600.0)
            
            rootView.transform = CGAffineTransformMakeScale(scaleW, scaleH)
//            rootView.frame.origin = CGPoint(x: 0, y: 64)
        
            print(rootView.frame.origin)
            
//            bkImageInRootView.frame.origin.y -= 4
            
        }
        
        if UIScreen.mainScreen().bounds.width == 414 {
            let scaleW: CGFloat = CGFloat(414.0 / 320.0)
            print(scaleW)
            let scaleH: CGFloat  = CGFloat(736.0 / 600.0)
            
            rootView.transform = CGAffineTransformMakeScale(scaleW, scaleH)
            rootView.frame.origin = CGPoint(x: 0, y: 64)
            
        }
        //--------------------------------------------------------------------------
        
        
        
        //-----------------------------ServerData 0-----------------------------
        
        if app.ServerData == 0 {
            tap1.enabled = true
            tap2.enabled = true
            tap3.enabled = true
            tap4.enabled = true
            tap5.enabled = true
            
            changSuoMingCheng!.enabled = true
            shi!.enabled = true
            xian!.enabled = true
            jieDao!.enabled = true
            menPaiHao!.enabled = true
            jingDu!.enabled = true
            weiDu!.enabled = true
            
            youBian!.enabled = true
            shangJiDanWei!.enabled = true
            cangSuoFuZeRen!.enabled = true
            lianXiDianHua!.enabled = true
            
            kaiYeShiJian!.enabled = true
            
            jianZhuMianJi!.enabled = true
            yingYeShiJianZhouJi!.enabled = true
            yingYeShiJianZhiZhouJi!.enabled = true
            yingYeShiJianJiDian!.enabled = true
            yingYeShiJianZhiJiDian!.enabled = true
            
            
            zhouKaiQuTianShu!.enabled = true
            riKaiQuPinCi!.enabled = true
            
            fuWuQuYu!.enabled = true
            
            zhouTouDiTianShu!.enabled = true
            riTouDiPinCi!.enabled = true
            
            fuWuBanJing!.enabled = true
            fuWuRenKou!.enabled = true
            
                XinJian!.enabled = true
                WuLiu!.enabled = true
                JiYou!.enabled = true
                BaoGuo!.enabled = true
                YinShuaPin!.enabled = true
                BaoKanLingShou!.enabled = true
                YouZhengChuXu!.enabled = true
                MangRenDuWu!.enabled = true
                TeKuaiZhuangDi!.enabled = true
                BaoKanDingYue!.enabled = true
                YouZhengHuiDui!.enabled = true
                YIWuBingXinHan!.enabled = true
                LieShiBaoGuo!.enabled = true
                QiTa!.enabled = true

//            commitBtn.enabled = true
//            commitBtn.setTitle("提交", forState: .Normal)
            
            commitBtn.hidden = false
        }
        
        
        //-----------------------------ServerData 1-----------------------------
        
        if app.ServerData == 1 {
            
            let stateValueFromServer = app.applyAddDic.valueForKey("state") as! Int
            print(stateValueFromServer)
            if stateValueFromServer == 1 || stateValueFromServer == 2 || stateValueFromServer == 3 {
//                bkView.backgroundColor = UIColor.redColor()
//                let btmOnBkView = UIButton(frame: CGRect(x: 10, y: 30, width: 150, height: 30))
                btmOnBkView.backgroundColor = UIColor.redColor()
                btmOnBkView.setTitle("查看审核意见", forState: .Normal)
                btmOnBkView.addTarget(self, action:Selector("shenHeYiJianBtnAction") , forControlEvents: .TouchUpInside)
                self.view.addSubview(bkView)
                bkView.addSubview(btmOnBkView)
                bkView.backgroundColor = UIColor(red: 199/255, green: 228/255, blue: 226/255, alpha: 1)
                
            }
            
            
            tap1.enabled = false
            tap2.enabled = false
            tap3.enabled = false
            tap4.enabled = false
            tap5.enabled = false
            
            changSuoMingCheng!.enabled = false
            shi!.enabled = false
            xian!.enabled = false
            jieDao!.enabled = false
            menPaiHao!.enabled = false
            jingDu!.enabled = false
            weiDu!.enabled = false
            
            youBian!.enabled = false
            shangJiDanWei!.enabled = false
            cangSuoFuZeRen!.enabled = false
            lianXiDianHua!.enabled = false
            
            kaiYeShiJian!.enabled = false
            
            jianZhuMianJi!.enabled = false
            yingYeShiJianZhouJi!.enabled = false
            yingYeShiJianZhiZhouJi!.enabled = false
            yingYeShiJianJiDian!.enabled = false
            yingYeShiJianZhiJiDian!.enabled = false
            
            
            zhouKaiQuTianShu!.enabled = false
            riKaiQuPinCi!.enabled = false
            
            fuWuQuYu!.enabled = false
            
            zhouTouDiTianShu!.enabled = false
            riTouDiPinCi!.enabled = false
            
            fuWuBanJing!.enabled = false
            fuWuRenKou!.enabled = false
            
            XinJian!.enabled = false
            WuLiu!.enabled = false
            JiYou!.enabled = false
            BaoGuo!.enabled = false
            YinShuaPin!.enabled = false
            BaoKanLingShou!.enabled = false
            YouZhengChuXu!.enabled = false
            MangRenDuWu!.enabled = false
            TeKuaiZhuangDi!.enabled = false
            BaoKanDingYue!.enabled = false
            YouZhengHuiDui!.enabled = false
            YIWuBingXinHan!.enabled = false
            LieShiBaoGuo!.enabled = false
            QiTa!.enabled = false
            
//            commitBtn.enabled = false
//            commitBtn.setTitle("只可查看", forState: .Disabled)
            
            commitBtn.hidden = true
            
            uploadBtn1.setTitle("查看营业日期戳样", forState: .Normal)
            uploadBtn2.setTitle("查看投递日期戳样", forState: .Normal)
            
            initTianJia(app.applyAddDic)
        }
        
        
        
        //-----------------------------ServerData 2-----------------------------
        
        if app.ServerData == 2 {
            
            let stateValueFromServer = app.applyAddDic.valueForKey("state") as! Int
            print(stateValueFromServer)
            if stateValueFromServer == 1 || stateValueFromServer == 2 || stateValueFromServer == 3 {
//                bkView.backgroundColor = UIColor.redColor()
//                let btmOnBkView = UIButton(frame: CGRect(x: 10, y: 30, width: 150, height: 30))
                btmOnBkView.backgroundColor = UIColor.redColor()
                btmOnBkView.setTitle("查看审核意见", forState: .Normal)
                btmOnBkView.addTarget(self, action:Selector("shenHeYiJianBtnAction") , forControlEvents: .TouchUpInside)
                self.view.addSubview(bkView)
                bkView.addSubview(btmOnBkView)
                bkView.backgroundColor = UIColor(red: 199/255, green: 228/255, blue: 226/255, alpha: 1)

            }
            
            
            tap1.enabled = true
            tap2.enabled = true
            tap3.enabled = true
            tap4.enabled = true
            tap5.enabled = true
            
            changSuoMingCheng!.enabled = true
            shi!.enabled = true
            xian!.enabled = true
            jieDao!.enabled = true
            menPaiHao!.enabled = true
            jingDu!.enabled = true
            weiDu!.enabled = true
            
            youBian!.enabled = true
            shangJiDanWei!.enabled = true
            cangSuoFuZeRen!.enabled = true
            lianXiDianHua!.enabled = true
            
            kaiYeShiJian!.enabled = true
            
            jianZhuMianJi!.enabled = true
            yingYeShiJianZhouJi!.enabled = true
            yingYeShiJianZhiZhouJi!.enabled = true
            yingYeShiJianJiDian!.enabled = true
            yingYeShiJianZhiJiDian!.enabled = true
            
            
            zhouKaiQuTianShu!.enabled = true
            riKaiQuPinCi!.enabled = true
            
            fuWuQuYu!.enabled = true
            
            zhouTouDiTianShu!.enabled = true
            riTouDiPinCi!.enabled = true
            
            fuWuBanJing!.enabled = true
            fuWuRenKou!.enabled = true
            
            XinJian!.enabled = true
            WuLiu!.enabled = true
            JiYou!.enabled = true
            BaoGuo!.enabled = true
            YinShuaPin!.enabled = true
            BaoKanLingShou!.enabled = true
            YouZhengChuXu!.enabled = true
            MangRenDuWu!.enabled = true
            TeKuaiZhuangDi!.enabled = true
            BaoKanDingYue!.enabled = true
            YouZhengHuiDui!.enabled = true
            YIWuBingXinHan!.enabled = true
            LieShiBaoGuo!.enabled = true
            QiTa!.enabled = true
            
//            commitBtn.enabled = true
//            commitBtn.setTitle("提交", forState: .Normal)
            
            commitBtn.hidden = false
            
            initTianJia(app.applyAddDic)
        }
    }
    
    func commitResult(notification: NSNotification) {
        let noteDic: NSDictionary = notification.userInfo!
        let result: String = (noteDic.valueForKey("result") as? String)!
        
        if (result == "1") {
            let alert = UIAlertView(title: "提交成功", message: "", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
            self.navigationController?.popViewControllerAnimated(true)
            
        } else {
            let alert = UIAlertView(title: "提交失败", message: "", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }
    }
    
    let infoOfYzqyszyzyycsdjb = InfoOfYzqyszyzyycsdjb()
    
    @IBAction func commit(sender: AnyObject) {
        var COMMIT_OK = 0
        
        
        if  chooseShiXiang.text == "未选择" {
            chooseShiXiang.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
//            chooseShiXiang.textColor = UIColor.blackColor()
            if (chooseShiXiang.text == "设置邮政普遍服务营业场所")  {
                infoOfYzqyszyzyycsdjb.sx = "szyzpbfwyycs"
            }
            if(chooseShiXiang.text == "设置其他营业场所") {
                infoOfYzqyszyzyycsdjb.sx = "szqtyzyycs"
            }
        }
        
        if  chooseJingYingFangShi.text == "未选择" {
            chooseJingYingFangShi.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseJingYingFangShi.text == "自办")  {
                infoOfYzqyszyzyycsdjb.jyfs = "zb"
            }
            if(chooseJingYingFangShi.text == "委办") {
                infoOfYzqyszyzyycsdjb.jyfs = "wb"
            }
        }
        
        if  chooseFangWuChangQuan.text == "未选择" {
            chooseFangWuChangQuan.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseFangWuChangQuan.text == "自有")  {
                infoOfYzqyszyzyycsdjb.fwcq = "ziy"
            }
            if(chooseFangWuChangQuan.text == "租用") {
                infoOfYzqyszyzyycsdjb.fwcq = "zuy"
            }
            if (chooseFangWuChangQuan.text == "无偿使用")  {
                infoOfYzqyszyzyycsdjb.fwcq = "wucsy"
            }
            if(chooseFangWuChangQuan.text == "其他") {
                infoOfYzqyszyzyycsdjb.fwcq = "qt"
            }
        }
        
        if  chooseSheZhiDiYu.text == "未选择" {
            chooseSheZhiDiYu.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseSheZhiDiYu.text == "城市地区")  {
                infoOfYzqyszyzyycsdjb.szdy = "csdq"
            }
            if(chooseSheZhiDiYu.text == "乡镇地区") {
                infoOfYzqyszyzyycsdjb.szdy = "xzdq"
            }
            if(chooseSheZhiDiYu.text == "农村地区") {
                infoOfYzqyszyzyycsdjb.szdy = "ncdq"
            }
        }
        
        if  chooseMenQianYouTong.text == "未选择" {
            chooseMenQianYouTong.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseMenQianYouTong.text == "有")  {
                infoOfYzqyszyzyycsdjb.mqyt = "y"
            }
            if(chooseMenQianYouTong.text == "无") {
                infoOfYzqyszyzyycsdjb.mqyt = "w"
            }
        }
        
        if changSuoMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.yzyycsmc = changSuoMingCheng.text
        } else if (changSuoMingCheng.text == "")
        {
            
            changSuoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if shi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.csdz_s = shi.text
        } else if (shi.text == "")
        {
            
            shi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if xian.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.csdz_xqs = xian.text
        } else if (xian.text == "")
        {
            
            xian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if jieDao.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.csdz_jx = jieDao.text
        } else if (jieDao.text == "")
        {
            
            jieDao.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if menPaiHao.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.csdz_h = menPaiHao.text
        } else if (menPaiHao.text == "")
        {
            
            menPaiHao.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        let isMatchJingDu = rxJingWeiDu.isMatch(jingDu.text)
        if isMatchJingDu {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.csdz_jd = jingDu.text
        } else {
            
            let alertView = UIAlertView(title: "经度不符合要求", message:  "经度最大值:27.366667 最小值:26.183333", delegate: self, cancelButtonTitle: "返回编辑")
                alertView.show()
//            let label = UILabel(frame: CGRect(x: jingDu.frame.origin.x, y: jingDu.frame.origin.y + 40, width: 100, height: 100))
//            label.backgroundColor = UIColor.blueColor()
            
            print("经度不符合要求")
            jingDu.attributedPlaceholder = NSAttributedString(string: "不符要求"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchWeiDu = rxJingWeiDu.isMatch(weiDu.text)
        if isMatchWeiDu {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.csdz_wd = weiDu.text
        } else {
            
            let alertView = UIAlertView(title: "纬度不符合要求", message:  "纬度最大值:107.283333 最小值:106.116667", delegate: self, cancelButtonTitle: "返回编辑")
                alertView.show()
            
            print("纬度不符合要求")
            weiDu.attributedPlaceholder = NSAttributedString(string: "不符要求"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchYouBian = rxYouBian.isMatch(youBian.text)
        if isMatchYouBian {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.yzbm = youBian.text
        } else {
            
            print("邮政编码不符合要求")
//            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            youBian.text = "不符要求"
            youBian.textColor = UIColor.redColor()
        }


        if shangJiDanWei.text != "" {
            COMMIT_OK += 1
             infoOfYzqyszyzyycsdjb.sjdw = shangJiDanWei.text
        } else if (shangJiDanWei.text == "")
        {
            
            shangJiDanWei.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if cangSuoFuZeRen.text != "" {
            COMMIT_OK += 1
             infoOfYzqyszyzyycsdjb.yycsfzr = cangSuoFuZeRen.text
        } else if (cangSuoFuZeRen.text == "")
        {
            
            cangSuoFuZeRen.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchLianXiDianHua = rxLianXiDianHua.isMatch(lianXiDianHua.text)
        if isMatchLianXiDianHua {
            COMMIT_OK += 1
           infoOfYzqyszyzyycsdjb.lxdh = lianXiDianHua.text
        } else {
            
            print("联系电话不符合要求")
//            lianXiDianHua.attributedPlaceholder = NSAttributedString(string: "不符要求"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            lianXiDianHua.text = "不符要求"
            lianXiDianHua.textColor = UIColor.redColor()
        }
        
        if kaiYeShiJian.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.kysj = kaiYeShiJian.text
        } else if (kaiYeShiJian.text == "")
        {
            
            kaiYeShiJian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        let isMatchJianZhuMianJi = rxJianZhuMianJi.isMatch(jianZhuMianJi.text)
        if isMatchJianZhuMianJi {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.jzmj = jianZhuMianJi.text
        } else {
            
            print("建筑面积不符合要求")
//            jianZhuMianJi.attributedPlaceholder = NSAttributedString(string: "不符要求"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            jianZhuMianJi.text = "不符要求"
            jianZhuMianJi.textColor = UIColor.redColor()
        }
        
        if yingYeShiJianZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.zyyr_ks = yingYeShiJianZhouJi.text
        } else if (yingYeShiJianZhouJi.text == "")
        {
            
            yingYeShiJianZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if yingYeShiJianZhiZhouJi.text != "" {
            COMMIT_OK += 1
             infoOfYzqyszyzyycsdjb.zyyr_js = yingYeShiJianZhiZhouJi.text
        } else if (yingYeShiJianZhiZhouJi.text == "")
        {
            
            yingYeShiJianZhiZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if yingYeShiJianJiDian.text != "" {
            COMMIT_OK += 1
             infoOfYzqyszyzyycsdjb.ryysj_ks = yingYeShiJianJiDian.text
        } else if (yingYeShiJianJiDian.text == "")
        {
            
            yingYeShiJianJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if yingYeShiJianZhiJiDian.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.ryysj_js = yingYeShiJianZhiJiDian.text
        } else if (yingYeShiJianZhiJiDian.text == "")
        {
            
            yingYeShiJianZhiJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if zhouKaiQuTianShu.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.zkqts = zhouKaiQuTianShu.text
        } else if (zhouKaiQuTianShu.text == "")
        {
            
            zhouKaiQuTianShu.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        

        if riKaiQuPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.rkqpc = riKaiQuPinCi.text
        } else if (riKaiQuPinCi.text == "")
        {
            
            riKaiQuPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
       
        if fuWuQuYu.text != "" {
            COMMIT_OK += 1
             infoOfYzqyszyzyycsdjb.fwqy  = fuWuQuYu.text
        } else if (fuWuQuYu.text == "")
        {
            
            fuWuQuYu.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        

        if zhouTouDiTianShu.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.ztdts = zhouTouDiTianShu.text
        } else if (zhouTouDiTianShu.text == "")
        {
            
            zhouTouDiTianShu.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if riTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.rtdpc = riTouDiPinCi.text
        } else if (riTouDiPinCi.text == "")
        {
            
            riTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
      
        let isMatchFuWuBanJing = rxFuWuBanJing.isMatch(fuWuBanJing.text)
        if isMatchFuWuBanJing {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.fwbj = fuWuBanJing.text
        } else {
            
            print("服务半径不符合要求")
//            fuWuBanJing.attributedPlaceholder = NSAttributedString(string: "不符要求"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            fuWuBanJing.text = "不符要求"
            fuWuBanJing.textColor = UIColor.redColor()
        }
       
        let isMatchFuWuRenKou = rxFuWuRenKou.isMatch(fuWuRenKou.text)
        if isMatchFuWuRenKou {
            COMMIT_OK += 1
            infoOfYzqyszyzyycsdjb.fwrk = fuWuRenKou.text
        } else {
            print("服务人口不符合要求")
//            fuWuRenKou.attributedPlaceholder = NSAttributedString(string: "不符要求"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            fuWuRenKou.text = "不符要求"
            fuWuRenKou.textColor = UIColor.redColor()
        }
        
        var stringForEdit = ""
        if ((XinJian.selected || WuLiu.selected || JiYou.selected || BaoGuo.selected || YinShuaPin.selected || BaoKanLingShou.selected || YouZhengChuXu.selected || MangRenDuWu.selected || TeKuaiZhuangDi.selected || BaoKanDingYue.selected || YouZhengHuiDui.selected || YIWuBingXinHan.selected || LieShiBaoGuo.selected || QiTa.selected) == false)
        {
            
            let alertView = UIAlertView(title: "须选择业务范围", message:  "业务范围不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            if XinJian.selected {
                infoOfYzqyszyzyycsdjb.ywfw += "xj"
                stringForEdit += "xj"
            }
            if WuLiu.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",wl"
                stringForEdit += ",wl"
            }
            if JiYou.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",jy"
                stringForEdit += ",jy"
            }
            if BaoGuo.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",bgs"
                stringForEdit += ",bgs"
            }
            if YinShuaPin.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",ysp"
                stringForEdit += ",ysp"
            }
            if BaoKanLingShou.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",bkls"
                stringForEdit += ",bkls"
            }
            if YouZhengChuXu.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",yzcx"
                stringForEdit += ",yzcx"
            }
            if MangRenDuWu.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",mrdw"
                stringForEdit += ",mrdw"
            }
            if TeKuaiZhuangDi.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",tkzd"
                stringForEdit += ",tkzd"
            }
            if BaoKanDingYue.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",bkdy"
                stringForEdit += ",bkdy"
            }
            if YouZhengHuiDui.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",yzhd"
                stringForEdit += ",yzhd"
            }
            if YIWuBingXinHan.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",ywbxh"
                stringForEdit += ",ywbxh"
            }
            if LieShiBaoGuo.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",lsywbg"
                stringForEdit += ",lsywbg"
            }
            if QiTa.selected {
                infoOfYzqyszyzyycsdjb.ywfw += ",qt"
                stringForEdit += ",qt"
            }
        
        }
        
            //上传图片字段
            if uploadBtn1PicVC != nil && app.ServerData != 2 {
                infoOfYzqyszyzyycsdjb.yyrccy = (uploadBtn1PicVC?.picUrl)!
            }
            print(uploadBtn1PicVC?.picUrl)
            if infoOfYzqyszyzyycsdjb.yyrccy == "" {
                UIAlertView(title: "请上传图片", message: "上传营业日戳戳样", delegate: nil, cancelButtonTitle: "返回上传").show()
            } else {
                COMMIT_OK += 1
            }
            
            if uploadBtn2PicVC != nil && app.ServerData != 2 {
                infoOfYzqyszyzyycsdjb.tdrccy = (uploadBtn2PicVC?.picUrl)!
            }
            print(uploadBtn2PicVC?.picUrl)
            if infoOfYzqyszyzyycsdjb.tdrccy == "" {
                UIAlertView(title: "请上传图片", message: "上传投递日戳戳样", delegate: nil, cancelButtonTitle: "返回上传").show()
            } else {
                COMMIT_OK += 1
            }

        
        
        print("\(COMMIT_OK)", terminator: "\n")
        
//        print("\(infoOfYzqyszyzyycsdjb.ywfw)")
//        if (COMMIT_OK == 30) {
//            let alertView = UIAlertView(title: "提交成功", message:  "", delegate: self, cancelButtonTitle: "完成")
//            alertView.show()
//            print("\(ClassToJSON.getObjectData(infoOfYzqyszyzyycsdjb))")
//        } else if (COMMIT_OK != 30) {
//            print("提交失败!!!!!!!!!!!!!!!!!!!!!!!!")
//        }
        if (COMMIT_OK == 32) {
            
            if app.ServerData == 0 {
                //                app.network.editWithInterface("Cxfpbfwwd", andInfo: ClassToJSON.getObjectData(infoOfyzqycxyzyycsdjb) , andExtraInfo:nil)
                app.network.addWithInterface("Szxwd", andUser: app.userData, andInfo:  ClassToJSON.getObjectData(infoOfYzqyszyzyycsdjb), andExtraInfo: nil)
            }
            
            if app.ServerData == 2 {
                
                if (chooseShiXiang.text == "设置邮政普遍服务营业场所")  {
                    app.applyAddDic.setValue("szyzpbfwyycs", forKey: "sx")
                }
                if(chooseShiXiang.text == "设置其他营业场所") {
                    app.applyAddDic.setValue("szqtyzyycs", forKey: "sx")
                }
                
                app.applyAddDic.setValue(changSuoMingCheng.text, forKey: "yzyycsmc")
                
                if (chooseJingYingFangShi.text == "自办")  {
                    infoOfYzqyszyzyycsdjb.jyfs = "zb"
                    app.applyAddDic.setValue("zb", forKey: "jyfs")
                }
                if(chooseJingYingFangShi.text == "委办") {
                    app.applyAddDic.setValue("wb", forKey: "jyfs")
                }
                
                
                
                
                app.applyAddDic.setValue(shi.text, forKey: "csdz_s")
                app.applyAddDic.setValue(xian.text, forKey: "csdz_xqs")
                app.applyAddDic.setValue(jieDao.text, forKey: "csdz_jx")
                app.applyAddDic.setValue(menPaiHao.text, forKey: "csdz_h")
                app.applyAddDic.setValue(jingDu.text, forKey: "csdz_jd")
                app.applyAddDic.setValue(weiDu.text, forKey: "csdz_wd")
                app.applyAddDic.setValue(youBian.text, forKey: "yzbm")
                
                app.applyAddDic.setValue(shangJiDanWei.text, forKey: "sjdw")
                app.applyAddDic.setValue(cangSuoFuZeRen.text, forKey: "yycsfzr")
                app.applyAddDic.setValue(lianXiDianHua.text, forKey: "lxdh")
                
                if (chooseSheZhiDiYu.text == "城市地区")  {
                    app.applyAddDic.setValue("csdq", forKey: "szdy")
                }
                if(chooseSheZhiDiYu.text == "乡镇地区") {
                    app.applyAddDic.setValue("xzdq", forKey: "szdy")
                }
                if(chooseSheZhiDiYu.text == "农村地区") {
                    app.applyAddDic.setValue("ncdq", forKey: "szdy")
                }

                app.applyAddDic.setValue(kaiYeShiJian.text, forKey: "kysj")
                
                
                if (chooseFangWuChangQuan.text == "自有")  {
                    app.applyAddDic.setValue("ziy", forKey: "fwcq")
                }
                if(chooseFangWuChangQuan.text == "租用") {
                    app.applyAddDic.setValue("zuy", forKey: "fwcq")
                }
                if (chooseFangWuChangQuan.text == "无偿使用")  {
                    app.applyAddDic.setValue("wucsy", forKey: "fwcq")
                }
                if(chooseFangWuChangQuan.text == "其他") {
                    app.applyAddDic.setValue("qt", forKey: "fwcq")
                }

                
                
                
                
                app.applyAddDic.setValue(jianZhuMianJi.text, forKey: "jzmj")
                
                app.applyAddDic.setValue(yingYeShiJianZhouJi.text, forKey: "zyyr_ks")
                app.applyAddDic.setValue(yingYeShiJianZhiZhouJi.text, forKey: "zyyr_js")
                app.applyAddDic.setValue(yingYeShiJianJiDian.text, forKey: "ryysj_ks")
                app.applyAddDic.setValue(yingYeShiJianZhiJiDian.text, forKey: "ryysj_js")
                
                if (chooseMenQianYouTong.text == "有")  {
                    app.applyAddDic.setValue("y", forKey: "mqyt")
                }
                if(chooseMenQianYouTong.text == "无") {
                    app.applyAddDic.setValue("w", forKey: "mqyt")
                }

                
                app.applyAddDic.setValue(zhouKaiQuTianShu.text, forKey: "zkqts")
                
                app.applyAddDic.setValue(riKaiQuPinCi.text, forKey: "rkqpc")
                app.applyAddDic.setValue(fuWuQuYu.text, forKey: "fwqy")
                app.applyAddDic.setValue(zhouTouDiTianShu.text, forKey: "ztdts")
                app.applyAddDic.setValue(riTouDiPinCi.text, forKey: "rtdpc")
                
                app.applyAddDic.setValue(fuWuBanJing.text, forKey: "fwbj")
                app.applyAddDic.setValue(fuWuRenKou.text, forKey: "fwrk")
                app.applyAddDic.setValue(stringForEdit, forKey: "ywfw")
                
                if uploadBtn1PicVC == nil {
                    app.applyAddDic.setValue(app.applyAddDic.valueForKey("yyrccy"), forKey: "yyrccy")
                    //                print("\(app.applyAddDic.valueForKey("yyrccy"))")
                } else {
                    app.applyAddDic.setValue(uploadBtn1PicVC?.picUrl, forKey: "yyrccy")
                }
                
                if uploadBtn2PicVC == nil {
                    app.applyAddDic.setValue(app.applyAddDic.valueForKey("tdrccy"), forKey: "tdrccy")
                    //                print("\(app.applyAddDic.valueForKey("yyrccy"))")
                } else {
                    app.applyAddDic.setValue(uploadBtn2PicVC?.picUrl, forKey: "tdrccy")
                }
                
                
                
                app.network.editWithInterface("Szxwd", andInfo: app.applyAddDic as [NSObject : AnyObject] , andExtraInfo:nil)
            }
            
    }
    
    }
    
//    func init(dict: NSDictionary) {
//        initTianJia(dict)
//    }
    
    func initTianJia(dict: NSDictionary) {
        print("进入初始化添加方法\(chooseShiXiang!.description)")
        if (dict.valueForKey("sx") as! String == "szyzpbfwyycs")   {
            chooseShiXiang!.text! = "设置邮政普遍服务营业场所"
        }
        //崩溃   未初始化。。。
        if(dict.valueForKey("sx") as! String == "szqtyzyycs") {
            chooseShiXiang!.text! = "设置其他营业场所"
//            print("hahahahahahahahahahahahahahahah")
        }
        
        if (dict.valueForKey("jyfs") as! String == "zb")   {
            chooseJingYingFangShi!.text = "自办"
        }
        if(dict.valueForKey("jyfs") as! String == "wb") {
            chooseJingYingFangShi!.text = "委办"
        }
        
        if (dict.valueForKey("fwcq") as! String == "ziy")   {
            chooseFangWuChangQuan!.text = "自有"
        }
        if(dict.valueForKey("fwcq") as! String == "zuy") {
            chooseFangWuChangQuan!.text = "租用"
        }
        if (dict.valueForKey("fwcq") as! String == "wucsy")   {
            chooseFangWuChangQuan!.text = "无偿使用"
        }
        if(dict.valueForKey("fwcq") as! String == "qt") {
            chooseFangWuChangQuan!.text = "其他"
        }
        
        if(dict.valueForKey("szdy") as! String == "csdq") {
            chooseSheZhiDiYu!.text = "城市地区"
        }
        if (dict.valueForKey("szdy") as! String == "xzdq")   {
            chooseSheZhiDiYu!.text = "乡镇地区"
        }
        if(dict.valueForKey("szdy") as! String == "ncdq") {
            chooseSheZhiDiYu!.text = "农村地区"
        }
        
        if (dict.valueForKey("mqyt") as! String == "y")   {
            chooseMenQianYouTong!.text = "有"
        }
        if(dict.valueForKey("mqyt") as! String == "w") {
            chooseMenQianYouTong!.text = "无"
        }
        
        changSuoMingCheng!.text = dict.valueForKey("yzyycsmc") as? String
        shi!.text = dict.valueForKey("csdz_s") as? String
        xian!.text = dict.valueForKey("csdz_xqs") as? String
        jieDao!.text = dict.valueForKey("csdz_jx") as? String
        menPaiHao!.text = dict.valueForKey("csdz_h") as? String
        jingDu!.text = dict.valueForKey("csdz_jd") as? String
        weiDu!.text = dict.valueForKey("csdz_wd") as? String
        
        youBian!.text = dict.valueForKey("yzbm") as? String
        shangJiDanWei!.text = dict.valueForKey("sjdw") as? String
        cangSuoFuZeRen!.text = dict.valueForKey("yycsfzr") as? String
        lianXiDianHua!.text = dict.valueForKey("lxdh") as? String
        
        kaiYeShiJian!.text = dict.valueForKey("kysj") as? String
        
        jianZhuMianJi!.text = dict.valueForKey("jzmj") as? String
        yingYeShiJianZhouJi!.text = dict.valueForKey("zyyr_ks") as? String
        yingYeShiJianZhiZhouJi!.text = dict.valueForKey("zyyr_js") as? String
        yingYeShiJianJiDian!.text = dict.valueForKey("ryysj_ks") as? String
        yingYeShiJianZhiJiDian!.text = dict.valueForKey("ryysj_js") as? String
        
        
        zhouKaiQuTianShu!.text = dict.valueForKey("zkqts") as? String
        riKaiQuPinCi!.text = dict.valueForKey("rkqpc") as? String
        
        fuWuQuYu!.text = dict.valueForKey("fwqy") as? String
        
        zhouTouDiTianShu!.text = dict.valueForKey("ztdts") as? String
        riTouDiPinCi!.text = dict.valueForKey("rtdpc") as? String
        
        fuWuBanJing!.text = dict.valueForKey("fwbj") as? String
        fuWuRenKou!.text = dict.valueForKey("fwrk") as? String

        let ywsxArray = dict.valueForKey("ywfw") as! String
        if (ywsxArray.rangeOfString("xj") != nil) {
            XinJian!.selected = true
        }
        if (ywsxArray.rangeOfString("wl") != nil) {
            WuLiu!.selected = true
        }
        if (ywsxArray.rangeOfString("jy") != nil) {
            JiYou!.selected = true
        }
        if (ywsxArray.rangeOfString("bgs") != nil) {
            BaoGuo!.selected = true
        }
        if (ywsxArray.rangeOfString("ysp") != nil) {
            YinShuaPin!.selected = true
        }
        if (ywsxArray.rangeOfString("bkls") != nil) {
            BaoKanLingShou!.selected = true
        }
        if (ywsxArray.rangeOfString("yzcx") != nil) {
            YouZhengChuXu!.selected = true
        }
        if (ywsxArray.rangeOfString("ywfw") != nil) {
            MangRenDuWu!.selected = true
        }
        if (ywsxArray.rangeOfString("tkzd") != nil) {
            TeKuaiZhuangDi!.selected = true
        }
        if (ywsxArray.rangeOfString("bkdy") != nil) {
            BaoKanDingYue!.selected = true
        }
        if (ywsxArray.rangeOfString("yzhd") != nil) {
            YouZhengHuiDui!.selected = true
        }
        if (ywsxArray.rangeOfString("ywbxh") != nil) {
            YIWuBingXinHan!.selected = true
        }
        if (ywsxArray.rangeOfString("lsywbg") != nil) {
            LieShiBaoGuo!.selected = true
        }
        if (ywsxArray.rangeOfString("qt") != nil) {
            QiTa!.selected = true
        }
        
        let pic1ValueFromDict = app.applyAddDic.valueForKey("yyrccy")
        infoOfYzqyszyzyycsdjb.yyrccy = pic1ValueFromDict as! String
        
        let pic2ValueFromDict = app.applyAddDic.valueForKey("tdrccy")
        infoOfYzqyszyzyycsdjb.tdrccy = pic2ValueFromDict as! String
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //上传图片功能
    
    //上传照片类对应的实例对象 全局
    var uploadBtn1PicVC: UploadPicViewController?
    
    @IBAction func uploadYingYeRiQiChuoYang(sender: AnyObject) {
        if app.ServerData == 0 {
            uploadBtn1PicVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "营业日期戳样", andUploadKind: 1)
            
            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
                uploadBtn1PicVC!.providesPresentationContextTransitionStyle = true
                uploadBtn1PicVC!.definesPresentationContext = true
                if #available(iOS 8.0, *) {
                    uploadBtn1PicVC!.modalPresentationStyle = .OverCurrentContext
                } else {
                    // Fallback on earlier versions
                }
                self.presentViewController(uploadBtn1PicVC! ,animated: true, completion: nil)
            } else {
                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(uploadBtn1PicVC! ,animated: false, completion: nil)
                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
            }
        }
        
        if app.ServerData == 1 {
            let picValueFromDict = app.applyAddDic.valueForKey("yyrccy")
//            let picValueFromDict = app.applyAddDic.valueForKey("tdrccy")
            
            let uploadVC = UploadPicViewController(uploadState: false, andUrl: picValueFromDict as! String, andCountOfPic: 1, andFormName: "营业日期戳样", andUploadKind: 1)
            
            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
                uploadVC.providesPresentationContextTransitionStyle = true
                uploadVC.definesPresentationContext = true
                if #available(iOS 8.0, *) {
                    uploadVC.modalPresentationStyle = .OverCurrentContext
                } else {
                    // Fallback on earlier versions
                }
                self.presentViewController(uploadVC ,animated: true, completion: nil)
            } else {
                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(uploadVC ,animated: false, completion: nil)
                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
            }
        }
        
        if app.ServerData == 2 {
            let picValueFromDict = app.applyAddDic.valueForKey("yyrccy")
            
            uploadBtn1PicVC = UploadPicViewController(uploadState: true, andUrl: picValueFromDict as! String, andCountOfPic: 1, andFormName: "营业日期戳样", andUploadKind: 1)
            
            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
                uploadBtn1PicVC!.providesPresentationContextTransitionStyle = true
                uploadBtn1PicVC!.definesPresentationContext = true
                if #available(iOS 8.0, *) {
                    uploadBtn1PicVC!.modalPresentationStyle = .OverCurrentContext
                } else {
                    // Fallback on earlier versions
                }
                self.presentViewController(uploadBtn1PicVC! ,animated: true, completion: nil)
            } else {
                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(uploadBtn1PicVC! ,animated: false, completion: nil)
                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
            }
        }
        
        
        
//        UploadPicViewController * upload = [[UploadPicViewController alloc]initWithCountOfPic:1 AndFormName:typeName];
        
//        //            upload.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
//            upload.providesPresentationContextTransitionStyle = YES;
//            upload.definesPresentationContext = YES;
//            upload.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//            [self presentViewController:upload animated:YES completion:nil];
//        } else {
//            self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
//            [self presentViewController:upload animated:NO completion:nil];
//            self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
//        }
        
    }
    
    
    var uploadBtn2PicVC: UploadPicViewController?
    @IBAction func uploadTouDiRiQiChuoYang(sender: AnyObject) {
        if app.ServerData == 0 {
            uploadBtn2PicVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "投递日期戳样", andUploadKind: 1)
            
            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
                uploadBtn2PicVC!.providesPresentationContextTransitionStyle = true
                uploadBtn2PicVC!.definesPresentationContext = true
                if #available(iOS 8.0, *) {
                    uploadBtn2PicVC!.modalPresentationStyle = .OverCurrentContext
                } else {
                    // Fallback on earlier versions
                    uploadBtn2PicVC!.modalPresentationStyle = .CurrentContext
                }
                self.presentViewController(uploadBtn2PicVC! ,animated: true, completion: nil)
            } else {
                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(uploadBtn2PicVC! ,animated: false, completion: nil)
                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
            }
        }
        
        
        
        
        if app.ServerData == 1 {
            let picValueFromDict = app.applyAddDic.valueForKey("tdrccy")
            
            let uploadVC = UploadPicViewController(uploadState: false, andUrl: picValueFromDict as! String, andCountOfPic: 1, andFormName: "投递日期戳样", andUploadKind: 1)
            
            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
                uploadVC.providesPresentationContextTransitionStyle = true
                uploadVC.definesPresentationContext = true
                if #available(iOS 8.0, *) {
                    uploadVC.modalPresentationStyle = .OverCurrentContext
                } else {
                    // Fallback on earlier versions
                    uploadVC.modalPresentationStyle = .CurrentContext
                }
                self.presentViewController(uploadVC ,animated: true, completion: nil)
            } else {
                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(uploadVC ,animated: false, completion: nil)
                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
            }
        }

        
        
        
        if app.ServerData == 2 {
            let picValueFromDict = app.applyAddDic.valueForKey("tdrccy")
            
            uploadBtn2PicVC = UploadPicViewController(uploadState: true, andUrl: picValueFromDict as! String, andCountOfPic: 1, andFormName: "投递日期戳样", andUploadKind: 1)
            
            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
                uploadBtn2PicVC!.providesPresentationContextTransitionStyle = true
                uploadBtn2PicVC!.definesPresentationContext = true
                if #available(iOS 8.0, *) {
                    uploadBtn2PicVC!.modalPresentationStyle = .OverCurrentContext
                } else {
                    // Fallback on earlier versions
                    uploadBtn2PicVC!.modalPresentationStyle = .CurrentContext
                }
                self.presentViewController(uploadBtn2PicVC! ,animated: true, completion: nil)
            } else {
                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(uploadBtn2PicVC! ,animated: false, completion: nil)
                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
            }
        }

        
        
        
    }
    
    
    
    
    
    
}

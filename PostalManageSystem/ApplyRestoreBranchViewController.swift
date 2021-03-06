//
//  ApplyRestoreBranchViewController.swift
//  PostalManageSystem
//
//  Created by QiaoLibo on 15/9/10.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

import UIKit

class ApplyRestoreBranchViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
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
        
        rootView.contentSize.height = 960
        
        if (UIScreen.mainScreen().bounds.height < keyboardHeight + textFieldHeight! - realContentOffsetY)
        {
            UIView.animateWithDuration(0.3, animations: {
                
                rootView.contentOffset.y = (keyboardHeight + self.textFieldHeight! ) - (UIScreen.mainScreen().bounds.height)
                
            })
        }
    }
    
    func keyboardWillHide(aNotification: NSNotification)
    {
        let rootView = self.view as! UIScrollView
        
        rootView.contentSize.height = 840
        UIView.animateWithDuration(0.3, animations: {
            rootView.contentOffset.y = self.positionChangeY
        })
    }
    
    var textFieldHeight: CGFloat?
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textFieldHeight = textField.frame.size.height + textField.frame.origin.y
        return true
    }
    
    var rxYouBian = NSRegularExpression.rx("[1-9]\\d{5}(?!\\d)", ignoreCase:true)
    var rxLianXiDianHua = NSRegularExpression.rx("((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)", ignoreCase:true)
    
    @IBOutlet weak var qiYeMingCheng: UITextField!
    @IBOutlet weak var yingYeChangSUoMingCheng: UITextField!
    @IBOutlet weak var diZhi: UITextField!
    @IBOutlet weak var youBian: UITextField!
    @IBOutlet weak var lianXIRenXIngMing: UITextField!
    @IBOutlet weak var lianXiDianHua: UITextField!
    @IBOutlet weak var huiFuBanLiShiJian: UITextField!
    @IBOutlet weak var qiTaShuoMingShiXiang: UITextField!

    @IBOutlet weak var XinJian: UIButton! //
    @IBOutlet weak var YouZhengHuiDui: UIButton! //
    @IBOutlet weak var MangRenDuWu: UIButton! //
    @IBOutlet weak var YinShuaPin: UIButton! //
    @IBOutlet weak var BaoGuo: UIButton! //
    @IBOutlet weak var LieShiBaoGuo: UIButton! //
    @IBOutlet weak var GuoJiaGuiDingBaoKanDeFaXing: UIButton!
    @IBOutlet weak var YiWuBingXinHan: UIButton! //
    
    @IBAction func touchInsideBtm(sender: AnyObject) {
        
        if let sender = sender as? UIButton {
            if sender == XinJian {
                if XinJian.selected == false {
                    XinJian.selected = true
                } else {
                    XinJian.selected = false
                }
            }
            
            if sender == YouZhengHuiDui {
                if YouZhengHuiDui.selected == false {
                    YouZhengHuiDui.selected = true
                } else {
                    YouZhengHuiDui.selected = false
                }
                
            }
            if sender == MangRenDuWu {
                if MangRenDuWu.selected == false {
                    MangRenDuWu.selected = true
                } else {
                    MangRenDuWu.selected = false
                }
                
            }
            if sender == YinShuaPin {
                if YinShuaPin.selected == false {
                    YinShuaPin.selected = true
                } else {
                    YinShuaPin.selected = false
                }
                
            }
            if sender == BaoGuo {
                if BaoGuo.selected == false {
                    BaoGuo.selected = true
                } else {
                    BaoGuo.selected = false
                }
            }
            if sender == LieShiBaoGuo {
                if LieShiBaoGuo.selected == false {
                    LieShiBaoGuo.selected = true
                } else {
                    LieShiBaoGuo.selected = false
                }
                
            }
            if sender == GuoJiaGuiDingBaoKanDeFaXing {
                if GuoJiaGuiDingBaoKanDeFaXing.selected == false {
                    GuoJiaGuiDingBaoKanDeFaXing.selected = true
                } else {
                    GuoJiaGuiDingBaoKanDeFaXing.selected = false
                }
                
            }
            if sender == YiWuBingXinHan {
                if YiWuBingXinHan.selected == false {
                    YiWuBingXinHan.selected = true
                } else {
                    YiWuBingXinHan.selected = false
                }
            }
            
        }
    }
    
    var app = UIApplication.sharedApplication().delegate as! AppDelegate
    
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
            textViewOnBkView.text = app.applyRestoreDic.valueForKey("sppl") as? String
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
    
    override func viewDidDisappear(animated: Bool) {
        app.ServerData = 0
    }
    
    @IBOutlet weak var rootView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("commitResult:"), name: "bsdtApi/add", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("commitResult:"), name: "bsdtApi/edit", object: nil)
        
        //增加监听，当键盘出现或改变时收出消息
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: "UIKeyboardWillShowNotification", object: nil)
         //增加监听，当键退出时收出消息
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: "UIKeyboardWillHideNotification", object: nil)

        
        let rootview = self.view as! UIScrollView
        
        rootview.contentSize.height = 840
        print(rootview.frame)
//        rootView.frame = CGRect(x: 0, y: 0, width: 375, height: UIScreen.mainScreen().bounds.height)
        
        
        let labelNav = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        //labelNav.backgroundColor = UIColor.clearColor
        labelNav.font = UIFont.boldSystemFontOfSize(20)
        labelNav.textColor = UIColor.whiteColor()
        labelNav.textAlignment = .Center
        labelNav.text = "申请恢复办理业务"
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
        
        
        if app.ServerData == 0 {
            qiYeMingCheng.enabled = true
    
            XinJian.enabled = true
            YouZhengHuiDui.enabled = true
            MangRenDuWu.enabled = true
            YinShuaPin.enabled = true
            BaoGuo.enabled = true
            LieShiBaoGuo.enabled = true
            GuoJiaGuiDingBaoKanDeFaXing.enabled = true
            YiWuBingXinHan.enabled = true
            
            yingYeChangSUoMingCheng.enabled = true
            diZhi.enabled = true
            youBian.enabled = true
            lianXIRenXIngMing.enabled = true
            lianXiDianHua.enabled = true
            huiFuBanLiShiJian.enabled = true
            qiTaShuoMingShiXiang.enabled = true
            
            commitBtn.hidden = false
        }
        
        if app.ServerData == 1 {
            
            let stateValueFromServer = app.applyRestoreDic.valueForKey("state") as! Int
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

            
//            app.ServerData = 0

            qiYeMingCheng.enabled = false
            XinJian.enabled = false
            YouZhengHuiDui.enabled = false
            MangRenDuWu.enabled = false
            YinShuaPin.enabled = false
            BaoGuo.enabled = false
            LieShiBaoGuo.enabled = false
            GuoJiaGuiDingBaoKanDeFaXing.enabled = false
            YiWuBingXinHan.enabled = false
            
            yingYeChangSUoMingCheng.enabled = false
            diZhi.enabled = false
            youBian.enabled = false
            lianXIRenXIngMing.enabled = false
            lianXiDianHua.enabled = false
            huiFuBanLiShiJian.enabled = false
            qiTaShuoMingShiXiang.enabled = false
            
//            commitBtn.enabled = false
//            commitBtn.setTitle("只可查看", forState: .Disabled)

            commitBtn.hidden = true
            
            initHuiFu(app.applyRestoreDic)
        }
        
        if app.ServerData == 2 {
            
            let stateValueFromServer = app.applyRestoreDic.valueForKey("state") as! Int
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

            
            print("进入恢复业务修改页面！！！！！！！")
//            app.ServerData = 0
            initHuiFu(app.applyRestoreDic)
            
            qiYeMingCheng.enabled = true
            
            XinJian.enabled = true
            YouZhengHuiDui.enabled = true
            MangRenDuWu.enabled = true
            YinShuaPin.enabled = true
            BaoGuo.enabled = true
            LieShiBaoGuo.enabled = true
            GuoJiaGuiDingBaoKanDeFaXing.enabled = true
            YiWuBingXinHan.enabled = true
            
            yingYeChangSUoMingCheng.enabled = true
            diZhi.enabled = true
            youBian.enabled = true
            lianXIRenXIngMing.enabled = true
            lianXiDianHua.enabled = true
            huiFuBanLiShiJian.enabled = true
            qiTaShuoMingShiXiang.enabled = true
            
            commitBtn.hidden = false
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

    @IBOutlet weak var commitBtn: UIButton!
    @IBAction func commit(sender: AnyObject) {
        print("-------------------提交--------------------------")
       var  COMMIT_OK = 0
        let infoOfHfblyzpbhtsfwywbgb = InfoOfHfblyzpbhtsfwywbgb()

        if qiYeMingCheng.text != "" {
            COMMIT_OK += 1
           infoOfHfblyzpbhtsfwywbgb.yzyycsmc = qiYeMingCheng.text
        } else if (qiYeMingCheng.text == "")
        {
            
            qiYeMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        var stringForEdit = ""
        if ((XinJian.selected || YouZhengHuiDui.selected || MangRenDuWu.selected || YinShuaPin.selected || BaoGuo.selected || LieShiBaoGuo.selected || GuoJiaGuiDingBaoKanDeFaXing.selected || YiWuBingXinHan.selected) == false) {
            let alertView = UIAlertView(title: "须选择业务范围", message:  "业务范围不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            if XinJian.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += "xj"
                stringForEdit += "xj"
            }
            if YouZhengHuiDui.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",yzhd"
                stringForEdit += ",yzhd"
            }
            if MangRenDuWu.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",mrdw"
                stringForEdit += ",mrdw"
            }
            if YinShuaPin.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",ysp"
                stringForEdit += ",ysp"
            }
            if BaoGuo.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",bgs"
                stringForEdit += ",bgs"
            }
            if LieShiBaoGuo.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",gmlsyw"
                stringForEdit += ",gmlsyw"
            }
            if GuoJiaGuiDingBaoKanDeFaXing.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",gjgdbkdfx"
                stringForEdit += ",gjgdbkdfx"
            }
            if YiWuBingXinHan.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",ywbpcxh"
                stringForEdit += ",ywbpcxh"
            }
        }
        
    
        if yingYeChangSUoMingCheng.text != "" {
            COMMIT_OK += 1
              infoOfHfblyzpbhtsfwywbgb.tzhzyzblywqyhyycsmc = yingYeChangSUoMingCheng.text
        } else if (yingYeChangSUoMingCheng.text == "")
        {
            
            yingYeChangSUoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        
      
        if diZhi.text != "" {
            COMMIT_OK += 1
              infoOfHfblyzpbhtsfwywbgb.dz = diZhi.text
        } else if (diZhi.text == "")
        {
            
            diZhi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        let isMatchYouBian = rxYouBian.isMatch(youBian.text)
        if isMatchYouBian {
            COMMIT_OK += 1
            infoOfHfblyzpbhtsfwywbgb.yzbm = youBian.text
        } else {
            
            print("邮政编码不符合要求")
            //            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            youBian.text = "不符要求"
            youBian.textColor = UIColor.redColor()
        }
        
        
        if lianXIRenXIngMing.text != "" {
            COMMIT_OK += 1
            infoOfHfblyzpbhtsfwywbgb.lxrxm = lianXIRenXIngMing.text
        } else if (lianXIRenXIngMing.text == "")
        {
            
            lianXIRenXIngMing.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        
       
        let isMatchLianXiDianHua = rxLianXiDianHua.isMatch(lianXiDianHua.text)
        if isMatchLianXiDianHua {
            COMMIT_OK += 1
             infoOfHfblyzpbhtsfwywbgb.lxdh = lianXiDianHua.text
        } else {
            
            print("联系电话不符合要求")
            //            lianXiDianHua.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            lianXiDianHua.text = "不符要求"
            lianXiDianHua.textColor = UIColor.redColor()
        }
        
        
        
       
        if huiFuBanLiShiJian.text != "" {
            COMMIT_OK += 1
             infoOfHfblyzpbhtsfwywbgb.hfbldsj = huiFuBanLiShiJian.text
        } else if (huiFuBanLiShiJian.text == "")
        {
            
            huiFuBanLiShiJian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        
       
        if qiTaShuoMingShiXiang.text != "" {
            COMMIT_OK += 1
             infoOfHfblyzpbhtsfwywbgb.qtxysmdsx = qiTaShuoMingShiXiang.text
        } else if (qiTaShuoMingShiXiang.text == "")
        {
            
            qiTaShuoMingShiXiang.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        

        
//        print("\(COMMIT_OK)", terminator: "\n")
//        
//        
//        if (COMMIT_OK == 9) {
//            let alertView = UIAlertView(title: "提交成功", message:  "", delegate: self, cancelButtonTitle: "完成")
//            alertView.show()
//            print("\(ClassToJSON.getObjectData(infoOfHfblyzpbhtsfwywbgb))")
//        } else if (COMMIT_OK != 9) {
//            print("提交失败!!!!!!!!!!!!!!!!!!!!!!!!")
//        }
        
        print("\(COMMIT_OK)", terminator: "\n")
        
        if (COMMIT_OK == 9) {
            if app.ServerData == 0 {
                app.network.addWithInterface("Hfyw", andUser: app.userData, andInfo: ClassToJSON.getObjectData(infoOfHfblyzpbhtsfwywbgb), andExtraInfo: nil)
                
//                app.network.editWithInterface("bsdtApi/add", andInfo: ClassToJSON.getObjectData(infoOfHfblyzpbhtsfwywbgb) , andExtraInfo: nil)
            }
            
            if app.ServerData == 2 {
                app.applyRestoreDic.setValue(qiYeMingCheng.text, forKey: "yzyycsmc")
                app.applyRestoreDic.setValue(stringForEdit, forKey: "tzhxzblywsx")
                app.applyRestoreDic.setValue(yingYeChangSUoMingCheng.text, forKey: "tzhzyzblywqyhyycsmc")
                app.applyRestoreDic.setValue(diZhi.text, forKey: "dz")
                app.applyRestoreDic.setValue(youBian.text, forKey: "yzbm")
                app.applyRestoreDic.setValue(lianXIRenXIngMing.text, forKey: "lxrxm")
                app.applyRestoreDic.setValue(lianXiDianHua.text, forKey: "lxdh")
                app.applyRestoreDic.setValue(huiFuBanLiShiJian.text, forKey: "hfbldsj")
                app.applyRestoreDic.setValue(qiTaShuoMingShiXiang.text, forKey: "qtxysmdsx")
                
                
                
                app.network.editWithInterface("Hfyw", andInfo: app.applyRestoreDic as [NSObject : AnyObject], andExtraInfo: nil)
            }
        }
        
    }
    
    func initHuiFu(dict: NSDictionary) {
        qiYeMingCheng.text = dict.valueForKey("yzyycsmc") as? String
        
        let ywsxArray = dict.valueForKey("tzhxzblywsx") as! String
        if (ywsxArray.rangeOfString("xj") != nil) {
            XinJian.selected = true
        }
        if (ywsxArray.rangeOfString("yzhd") != nil) {
            YouZhengHuiDui.selected = true
        }
        if (ywsxArray.rangeOfString("mrdw") != nil) {
            MangRenDuWu.selected = true
        }
        if (ywsxArray.rangeOfString("ysp") != nil) {
            YinShuaPin.selected = true
        }
        if (ywsxArray.rangeOfString("bgs") != nil) {
            BaoGuo.selected = true
        }
        if (ywsxArray.rangeOfString("gmlsyw") != nil) {
            LieShiBaoGuo.selected = true
        }
        if (ywsxArray.rangeOfString("gjgdbkdfx") != nil) {
            GuoJiaGuiDingBaoKanDeFaXing.selected = true
        }
        if (ywsxArray.rangeOfString("ywbpcxh") != nil) {
            YiWuBingXinHan.selected = true
        }
        
        yingYeChangSUoMingCheng.text = dict.valueForKey("tzhzyzblywqyhyycsmc") as? String
        diZhi.text = dict.valueForKey("dz") as? String
        youBian.text = dict.valueForKey("yzbm") as? String
        lianXIRenXIngMing.text = dict.valueForKey("lxrxm") as? String
        lianXiDianHua.text = dict.valueForKey("lxdh") as? String
        huiFuBanLiShiJian.text = dict.valueForKey("hfbldsj") as? String
        qiTaShuoMingShiXiang.text = dict.valueForKey("qtxysmdsx") as? String
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

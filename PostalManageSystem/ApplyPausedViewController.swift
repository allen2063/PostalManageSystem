//
//  ApplyPausedViewController.swift
//  PostalManageSystem
//
//  Created by QiaoLibo on 15/9/10.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

import UIKit

class ApplyPausedViewController: UIViewController, UIActionSheetDelegate, UITextFieldDelegate, UIScrollViewDelegate {
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
            rootView.contentSize = CGSize(width: 320, height: 1075)
            UIView.animateWithDuration(0.3, animations: {
                rootView.contentOffset.y = (keyboardHeight + self.textFieldHeight! ) - (UIScreen.mainScreen().bounds.height)
                
            })
        }
    }
    
    func keyboardWillHide(aNotification: NSNotification)
    {
        let rootView = self.view as! UIScrollView
        
        rootView.contentSize = CGSize(width: 320, height: 975)
        UIView.animateWithDuration(0.3, animations: {
            rootView.contentOffset.y = self.positionChangeY
        })
    }
    
    var textFieldHeight: CGFloat?
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textFieldHeight = textField.frame.size.height + textField.frame.origin.y
        return true
    }
    
    
    @IBOutlet weak var changSuoMingCheng: UITextField!
    @IBOutlet weak var shangJiDanWei: UITextField!
    @IBOutlet weak var fuWuQuYu: UITextField!
    @IBOutlet weak var diZhi: UITextField!
    @IBOutlet weak var youBian: UITextField!
    @IBOutlet weak var lianXiRenXingMing: UITextField!
    @IBOutlet weak var lianXiDianHua: UITextField!
    @IBOutlet weak var zanTingShiJian: UITextField!
    @IBOutlet weak var zanXianYuanYin: UITextField!
    @IBOutlet weak var buJiuCuoShi: UITextField!
    
    
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
    
    @IBOutlet weak var chooseBanLiShiXiangLabel: UILabel!
    
    @IBAction func printActionSheet(sender: AnyObject) {
        if (sender as? UIGestureRecognizer != nil) {
            if sender.view == chooseBanLiShiXiangLabel {
                let actionSheet = UIActionSheet(title: "选择办理事项", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "暂时停止办理业务事项", "暂时限制办理业务事项")
                actionSheet.showInView(self.view)
            }
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if actionSheet.buttonTitleAtIndex(buttonIndex) != "取消"{
                chooseBanLiShiXiangLabel.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseBanLiShiXiangLabel.textColor = UIColor.blackColor()
        }
    }

    var app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidDisappear(animated: Bool) {
         app.ServerData = 0
    }
    
    @IBOutlet var tap1: UITapGestureRecognizer!
    @IBOutlet weak var commitBtn: UIButton!
    
    let bkView = UIView(frame: CGRect(x: 0, y: UIScreen.mainScreen().bounds.size.height - 80, width: UIScreen.mainScreen().bounds.size.width, height: 80))
    let label = UILabel(frame: CGRect(x: 45, y: 5, width: UIScreen.mainScreen().bounds.size.width - 80, height: 30))
    let btmOnBkView = UIButton(frame: CGRect(x: 45, y: 40, width: UIScreen.mainScreen().bounds.size.width - 80, height: 30))
    
    var flag = 0
    func shenHeYiJianBtnAction() {
        label.textColor = UIColor.blackColor()
        label.backgroundColor = UIColor(red: 199/255, green: 228/255, blue: 226/255, alpha: 1)
        
        //        label.hidden = true
        
        if flag == 0 {
            btmOnBkView.setTitle("隐藏审核状态", forState: .Normal)
            flag = 1
            print("\(flag)")
            label.text = app.applyAddDic.valueForKey("sppl") as? String
            label.textAlignment = .Center
            //            viewForShenHeYiJian.addSubview(label)
            //            label.hidden = false
            bkView.addSubview(label)
            //            print("\(flag)\(label)")
        } else if flag == 1
        {
            btmOnBkView.setTitle("查看审核意见", forState: .Normal)
            flag = 0
            //            label.hidden = true
            //            print("\(flag)\(label.superview)")
            label.removeFromSuperview()
            
        }
    }
    
    //    var i = 0
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //        print("QQQQQQQQQQQQQQQQQQQQQQQQ\(++i)")
        //        bkView.backgroundColor = UIColor.redColor()
        bkView.frame.origin.y = (self.view as! UIScrollView).contentOffset.y + UIScreen.mainScreen().bounds.size.height - bkView.frame.size.height
        //        print("\(bkView.bounds.origin.y)")
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
        
        let labelNav = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        //        labelNav.backgroundColor = UIColor.clearColor
        labelNav.font = UIFont.boldSystemFontOfSize(20)
        labelNav.textColor = UIColor.whiteColor()
        labelNav.textAlignment = .Center
        labelNav.text = "申请暂停/暂限办理业务"
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
            changSuoMingCheng.enabled = true
            shangJiDanWei.enabled = true
            
            tap1.enabled = true
            
                XinJian.enabled = true
                YouZhengHuiDui.enabled = true
                MangRenDuWu.enabled = true
                YinShuaPin.enabled = true
                BaoGuo.enabled = true
                LieShiBaoGuo.enabled = true
                GuoJiaGuiDingBaoKanDeFaXing.enabled = true
                YiWuBingXinHan.enabled = true
            
            fuWuQuYu.enabled = true
            diZhi.enabled = true
            youBian.enabled = true
            lianXiRenXingMing.enabled = true
            lianXiDianHua.enabled = true
            zanTingShiJian.enabled = true
            zanXianYuanYin.enabled = true
            buJiuCuoShi.enabled = true
            
            commitBtn.hidden = false
        }
        
        
        if app.ServerData == 1 {
            
            let stateValueFromServer = app.applyPauseDic.valueForKey("state") as! Int
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

            
            changSuoMingCheng.enabled = false
            shangJiDanWei.enabled = false
            
            tap1.enabled = false
            
            XinJian.enabled = false
            YouZhengHuiDui.enabled = false
            MangRenDuWu.enabled = false
            YinShuaPin.enabled = false
            BaoGuo.enabled = false
            LieShiBaoGuo.enabled = false
            GuoJiaGuiDingBaoKanDeFaXing.enabled = false
            YiWuBingXinHan.enabled = false
            
            fuWuQuYu.enabled = false
            diZhi.enabled = false
            youBian.enabled = false
            lianXiRenXingMing.enabled = false
            lianXiDianHua.enabled = false
            zanTingShiJian.enabled = false
            zanXianYuanYin.enabled = false
            buJiuCuoShi.enabled = false

            commitBtn.hidden = true
            
            initZanTing(app.applyPauseDic)
        }
        
        if app.ServerData == 2 {
            
            let stateValueFromServer = app.applyPauseDic.valueForKey("state") as! Int
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

            
            changSuoMingCheng.enabled = true
            shangJiDanWei.enabled = true
            
            tap1.enabled = true
            
            XinJian.enabled = true
            YouZhengHuiDui.enabled = true
            MangRenDuWu.enabled = true
            YinShuaPin.enabled = true
            BaoGuo.enabled = true
            LieShiBaoGuo.enabled = true
            GuoJiaGuiDingBaoKanDeFaXing.enabled = true
            YiWuBingXinHan.enabled = true
            
            fuWuQuYu.enabled = true
            diZhi.enabled = true
            youBian.enabled = true
            lianXiRenXingMing.enabled = true
            lianXiDianHua.enabled = true
            zanTingShiJian.enabled = true
            zanXianYuanYin.enabled = true
            buJiuCuoShi.enabled = true
            
            commitBtn.hidden = false
            
            initZanTing(app.applyPauseDic)
        }

//          NSNotificationCenter.defaultCenter().addObserver(self, selector: nil, name: UIKeyboardDidShowNotification, object: nil)
        }
    
//    func getKeyboardHeight(notif: NSNotification)
//    {
//        var info: NSDictionary = notif.userInfo!
//        var value: AnyObject? = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)
//        var keyboardSize: CGSize = value!.CGSizeValue()
//        println("\(keyboardSize)")
//    }
    
    var viewUp: Bool = false
    var shouldDragDismiss: Bool = false

//    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
//        //-----------------------------------------------------------
//        let rootView: UIScrollView = self.view as! UIScrollView
//        if textField.frame.origin.y - rootView.contentOffset.y > 300 && (viewUp == false) {
//            UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: {
//                rootView.contentOffset.y += 250
////                self.view.center.y -= 300
//                }, completion: nil)
//            viewUp = true
//            shouldDragDismiss = true
//        }
//        //-----------------------------------------------------------
////        if textField == zanTingShiJian {
////            UIView.animateWithDuration(0.3, animations: {
////                self.view.center.y -= 216
////            })
////            self.viewUp = true
////        }
//        return true
//    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        let rootView: UIScrollView = self.view as! UIScrollView
//        if viewUp == true {
//            UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: {
//                rootView.contentOffset.y -= 250
////                self.view.center.y += 300
//                }, completion: nil)
//            viewUp = false
//            shouldDragDismiss = false
//        }
//        if textField == zanTingShiJian {
//            UIView.animateWithDuration(0.3, animations: {
//                self.view.center.y += 216
//            })
//            self.viewUp = false
//        }
        return true
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
//        if shouldDragDismiss && (viewUp == false) {
//            UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: {
//                self.view.center.y += 350
//                }, completion: nil)
//            
//            viewUp = false
//            shouldDragDismiss = false
//        }
//        if self.viewUp {
//            UIView.animateWithDuration(0.3, animations: {
//                self.view.center.y += 216
//            })
//            self.viewUp = false
//        } else if !self.viewUp {
//            UIView.animateWithDuration(0.3, animations: {
//                self.view.center.y -= 216
//            })
//            self.viewUp = true
//        }
    }
    
    func commitResult(notification: NSNotification) {
        let noteDic: NSDictionary = notification.userInfo!
        let result: String = (noteDic.valueForKey("result") as? String)!
        
        if (result == "1") {
            let alert = UIAlertView(title: "提交成功", message: "", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        } else {
            let alert = UIAlertView(title: "提交失败", message: "", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }
    }
    
    @IBAction func commit(sender: AnyObject) {
        let infoOfZtbhxbyzpbfwhtsfwywdjb = InfoOfZtbhxbyzpbfwhtsfwywdjb()
        
        var COMMIT_OK = 0
        
        if changSuoMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.yzyycsmc = changSuoMingCheng.text
        } else if (changSuoMingCheng.text == "")
        {
            
            changSuoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if shangJiDanWei.text != "" {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.sjdw = shangJiDanWei.text
        } else if (shangJiDanWei.text == "")
        {
            
            shangJiDanWei.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
            
        //infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx = chooseBanLiShiXiangLabel.text
        if  chooseBanLiShiXiangLabel.text == "未选择" {
            chooseBanLiShiXiangLabel.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseBanLiShiXiangLabel.text == "暂时停止办理业务事项")  {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx = "zstzblywsx"
            }
            if(chooseBanLiShiXiangLabel.text == "暂时限制办理业务事项") {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx = "zsxzblywsx"
            }
        }
        
        var stringForEdit = ""
        if ((XinJian.selected || YouZhengHuiDui.selected || MangRenDuWu.selected || YinShuaPin.selected || BaoGuo.selected || LieShiBaoGuo.selected || GuoJiaGuiDingBaoKanDeFaXing.selected || YiWuBingXinHan.selected) == false)
        {
            
            let alertView = UIAlertView(title: "须选择办理事项", message:  "办理事项不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            if XinJian.selected {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx_ywfw += "xj"
                stringForEdit += "xj"
            }
            if YouZhengHuiDui.selected {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx_ywfw += ",yzhd"
                stringForEdit += ",yzhd"
            }
            if MangRenDuWu.selected {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx_ywfw += ",mrdw"
                stringForEdit += ",mrdw"
            }
            if YinShuaPin.selected {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx_ywfw += ",ysp"
                stringForEdit += ",ysp"
            }
            if BaoGuo.selected {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx_ywfw += ",bgs"
                stringForEdit += ",bgs"
            }
            if LieShiBaoGuo.selected {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx_ywfw += ",gmlsyw"
                stringForEdit += ",gmlsyw"
            }
            if GuoJiaGuiDingBaoKanDeFaXing.selected {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx_ywfw += ",gjgdbkdfx"
                stringForEdit += ",gjgdbkdfx"
            }
            if YiWuBingXinHan.selected {
                infoOfZtbhxbyzpbfwhtsfwywdjb.xzblsx_ywfw += ",ywbpcxh"
                stringForEdit += ",ywbpcxh"
            }
        }
        
        if fuWuQuYu.text != "" {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.zstzblhzxzblywdyzyycsdfwqy = fuWuQuYu.text
        } else if (fuWuQuYu.text == "")
        {
            
            fuWuQuYu.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        
        if diZhi.text != "" {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.dz = diZhi.text
        } else if (diZhi.text == "")
        {
            
            diZhi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchYouBian = rxYouBian.isMatch(youBian.text)
        if isMatchYouBian {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.yzbm = youBian.text
        } else {
            
            print("邮政编码不符合要求")
            //            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            youBian.text = "不符要求"
            youBian.textColor = UIColor.redColor()
        }
        
        if lianXiRenXingMing.text != "" {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.lxrxm = lianXiRenXingMing.text
        } else if (lianXiRenXingMing.text == "")
        {
            
            lianXiRenXingMing.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchLianXiDianHua = rxLianXiDianHua.isMatch(lianXiDianHua.text)
        if isMatchLianXiDianHua {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.lxdh = lianXiDianHua.text
        } else {
            
            print("联系电话不符合要求")
            //            lianXiDianHua.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            lianXiDianHua.text = "不符要求"
            lianXiDianHua.textColor = UIColor.redColor()
        }

        
        if zanTingShiJian.text != "" {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.zstzblhzxzblywdsj = zanTingShiJian.text
        } else if (zanTingShiJian.text == "")
        {
            
            zanTingShiJian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if zanXianYuanYin.text != "" {
            COMMIT_OK += 1
        infoOfZtbhxbyzpbfwhtsfwywdjb.zstzblhzxzblywdyy = zanXianYuanYin.text
        } else if (zanXianYuanYin.text == "")
        {
            
            zanXianYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if buJiuCuoShi.text != "" {
            COMMIT_OK += 1
            infoOfZtbhxbyzpbfwhtsfwywdjb.zstzblhzxzblywqjyzqycqdbjcs = buJiuCuoShi.text
        } else if (buJiuCuoShi.text == "")
        {
            
            buJiuCuoShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        print("\(COMMIT_OK)", terminator: "\n")
        
        if (COMMIT_OK == 12) {
            if app.ServerData == 0 {
                app.network.addWithInterface("Ztxyw", andUser: app.userData, andInfo:  ClassToJSON.getObjectData(infoOfZtbhxbyzpbfwhtsfwywdjb), andExtraInfo: nil)
            }
            
            if app.ServerData == 2 {
                app.applyPauseDic.setValue(changSuoMingCheng.text, forKey: "yzyycsmc")
                app.applyPauseDic.setValue(shangJiDanWei.text, forKey: "sjdw")
                app.applyPauseDic.setValue(chooseBanLiShiXiangLabel.text, forKey: "xzblsx")
                app.applyPauseDic.setValue(stringForEdit, forKey: "xzblsx_ywfw")
                app.applyPauseDic.setValue(fuWuQuYu.text, forKey: "zstzblhzxzblywdyzyycsdfwqy")
                app.applyPauseDic.setValue(diZhi.text, forKey: "dz")
                app.applyPauseDic.setValue(youBian.text, forKey: "yzbm")
                app.applyPauseDic.setValue(lianXiRenXingMing.text, forKey: "lxrxm")
                app.applyPauseDic.setValue(lianXiDianHua.text, forKey: "lxdh")
                app.applyPauseDic.setValue(zanTingShiJian.text, forKey: "zstzblhzxzblywdsj")
                app.applyPauseDic.setValue(zanXianYuanYin.text, forKey: "zstzblhzxzblywdyy")
                app.applyPauseDic.setValue(buJiuCuoShi.text, forKey: "zstzblhzxzblywqjyzqycqdbjcs")
                
                app.network.editWithInterface("Ztxyw", andInfo: app.applyPauseDic as [NSObject : AnyObject] , andExtraInfo:nil)
                
            }
        }
//       print("\(ClassToJSON.getObjectData(infoOfZtbhxbyzpbfwhtsfwywdjb))")
    }
    
    func initZanTing(dict: NSDictionary) {
        changSuoMingCheng.text = dict.valueForKey("yzyycsmc") as? String
        shangJiDanWei.text = dict.valueForKey("sjdw") as? String
        
        if (dict.valueForKey("xzblsx") as! String == "zstzblywsx")  {
            chooseBanLiShiXiangLabel.text = "暂时停止办理业务事项"
        }
        if (dict.valueForKey("xzblsx") as! String == "zsxzblywsx") {
            chooseBanLiShiXiangLabel.text = "暂时限制办理业务事项"
        }
        
        let ywsxArray = dict.valueForKey("xzblsx_ywfw") as! String
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
        
        fuWuQuYu.text = dict.valueForKey("zstzblhzxzblywdyzyycsdfwqy") as? String
        dict.valueForKey("dz") as! String
        diZhi.text = dict.valueForKey("dz") as? String
        youBian.text = dict.valueForKey("yzbm") as? String
        lianXiRenXingMing.text = dict.valueForKey("lxrxm") as? String
        lianXiDianHua.text = dict.valueForKey("lxdh") as? String
        zanTingShiJian.text = dict.valueForKey("zstzblhzxzblywdsj") as? String
        zanXianYuanYin.text = dict.valueForKey("zstzblhzxzblywdyy") as? String
        buJiuCuoShi.text = dict.valueForKey("zstzblhzxzblywqjyzqycqdbjcs") as? String
    }

    
}


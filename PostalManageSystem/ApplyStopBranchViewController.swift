//
//  ApplyStopBranchViewController.swift
//  PostalManageSystem
//
//  Created by QiaoLibo on 15/9/10.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

import UIKit

class ApplyStopBranchViewController: UIViewController, UIActionSheetDelegate, UIScrollViewDelegate, UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
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
//            rootView.contentSize = CGSize(width: 320, height: 1870)
            UIView.animateWithDuration(0.3, animations: {
                
                
                rootView.contentOffset.y = (keyboardHeight + self.textFieldHeight! ) - (UIScreen.mainScreen().bounds.height)
                
            })
        }
    }
    
    func keyboardWillHide(aNotification: NSNotification)
    {
//        let rootView = self.view as! UIScrollView
//        
////        rootView.contentSize = CGSize(width: 320, height: 1770)
//        UIView.animateWithDuration(0.3, animations: {
//            rootView.contentOffset.y = self.positionChangeY!
//        })
    }
    
    var textFieldHeight: CGFloat?
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textFieldHeight = textField.frame.size.height + textField.frame.origin.y
        return true
    }
    
    
    
    
    //停止或限制办理普遍和特殊服务申请
    var infoOfYzyycstbhybyzpbfwywhtsfwywdsq = InfoOfYzyycstbhybyzpbfwywhtsfwywdsq()
    
    @IBOutlet weak var fenGongSi: UITextField!
    @IBOutlet weak var yingYeChangSuoMingCheng: UITextField!
    @IBOutlet weak var beiShenQingDanWeiMingCheng: UITextField!
    @IBOutlet weak var shenQingZhuYaoYuanYin: UITextField!
    @IBOutlet weak var niTingBanShiJianNian: UITextField!
    @IBOutlet weak var niTingBanShiJianYue: UITextField!
    @IBOutlet weak var changSuoDiZhiShi: UITextField!
    @IBOutlet weak var changSuoDiZhiXian: UITextField!
    @IBOutlet weak var changSuoDiJie: UITextField!
    @IBOutlet weak var youZhengYingYeChangSuoMingCeng: UITextField!
    @IBOutlet weak var jiTiYeWuMingCheng: UITextField!
    @IBOutlet weak var yeWuJuTiQingXing: UITextField!
    @IBOutlet weak var niCaiQuBuJiuCuoShi: UITextField!
    @IBOutlet weak var zongTiFuWuShuiPing: UITextField!
    
    
    //拟停止或限制办理业务营业场所基本情况表
    var infoOfNthybywyzyycsjbqkb = InfoOfNthybywyzyycsjbqkb()
    
    @IBOutlet weak var yingYeChangSuoMingCheng1: UITextField!
    @IBOutlet weak var shangJiDanWei1: UITextField!
    
    @IBOutlet weak var chooseBanLiShiXiangLabel: UILabel!
    @IBOutlet weak var chooseTingXianBanLiYeWuZhongLei: UILabel!
    @IBOutlet weak var fuWuQuYu1: UITextField!
    @IBOutlet weak var diZhi1: UITextField!
    @IBOutlet weak var youBian1: UITextField!
    @IBOutlet weak var lianXiRenXingMing1: UITextField!
    @IBOutlet weak var lianXiDianHua1: UITextField!
    
    var tapedLabel = 0
    @IBAction func printActionSheet(sender: AnyObject) {
        if (sender as? UIGestureRecognizer != nil) {
            if sender.view == chooseBanLiShiXiangLabel {
                let actionSheet = UIActionSheet(title: "选择拟办理事项", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "停止办理", "限制办理")
                actionSheet.showInView(self.view)
                tapedLabel = 1
            }
            
            if sender.view == chooseTingXianBanLiYeWuZhongLei {
                let actionSheet = UIActionSheet(title: "选择停限办业务种类", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "邮政普遍服务业务","特殊服务业务")
                actionSheet.showInView(self.view)
                tapedLabel = 2
            }
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if actionSheet.buttonTitleAtIndex(buttonIndex) != "取消"{
            if  tapedLabel == 1 {
                chooseBanLiShiXiangLabel.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseBanLiShiXiangLabel.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 2 {
                chooseTingXianBanLiYeWuZhongLei.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseTingXianBanLiYeWuZhongLei.textColor = UIColor.blackColor()
            }
        }
    }

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

    @IBOutlet weak var XinJian1: UIButton! //
    @IBOutlet weak var YouZhengHuiDui1: UIButton! //
    @IBOutlet weak var MangRenDuWu1: UIButton! //
    @IBOutlet weak var YinShuaPin1: UIButton! //
    @IBOutlet weak var BaoGuo1: UIButton! //
    @IBOutlet weak var LieShiBaoGuo1: UIButton! //
    @IBOutlet weak var GuoJiaGuiDingBaoKanDeFaXing1: UIButton!
    @IBOutlet weak var YiWuBingXinHan1: UIButton! //
    
    @IBAction func touchInsideBtm2(sender: AnyObject) {
        
        if let sender = sender as? UIButton {
            if sender == XinJian1 {
                if XinJian1.selected == false {
                    XinJian1.selected = true
                } else {
                    XinJian1.selected = false
                }
            }
            
            if sender == YouZhengHuiDui1 {
                if YouZhengHuiDui1.selected == false {
                    YouZhengHuiDui1.selected = true
                } else {
                    YouZhengHuiDui1.selected = false
                }
                
            }
            if sender == MangRenDuWu1 {
                if MangRenDuWu1.selected == false {
                    MangRenDuWu1.selected = true
                } else {
                    MangRenDuWu1.selected = false
                }
                
            }
            if sender == YinShuaPin1 {
                if YinShuaPin1.selected == false {
                    YinShuaPin1.selected = true
                } else {
                    YinShuaPin1.selected = false
                }
                
            }
            if sender == BaoGuo1 {
                if BaoGuo1.selected == false {
                    BaoGuo1.selected = true
                } else {
                    BaoGuo1.selected = false
                }
            }
            if sender == LieShiBaoGuo1 {
                if LieShiBaoGuo1.selected == false {
                    LieShiBaoGuo1.selected = true
                } else {
                    LieShiBaoGuo1.selected = false
                }
                
            }
            if sender == GuoJiaGuiDingBaoKanDeFaXing1 {
                if GuoJiaGuiDingBaoKanDeFaXing1.selected == false {
                    GuoJiaGuiDingBaoKanDeFaXing1.selected = true
                } else {
                    GuoJiaGuiDingBaoKanDeFaXing1.selected = false
                }
                
            }
            if sender == YiWuBingXinHan1 {
                if YiWuBingXinHan1.selected == false {
                    YiWuBingXinHan1.selected = true
                } else {
                    YiWuBingXinHan1.selected = false
                }
            }
            
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

    @IBAction func commit(sender: AnyObject) {
        var COMMIT_OK = 0
//        println("\(infoOfYzyycstbhybyzpbfwywhtsfwywdsq.gsyyzzfyj)")
//        print("\(uploadVCForPicURL1?.picUrl)")
        
        if fenGongSi.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.zgyzjtgsttfgsmc = fenGongSi.text
        } else if (fenGongSi.text == "")
        {
            
            fenGongSi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if yingYeChangSuoMingCheng.text != "" {
            COMMIT_OK += 1
        infoOfYzyycstbhybyzpbfwywhtsfwywdsq.btyzyycsmc = yingYeChangSuoMingCheng.text
        } else if (yingYeChangSuoMingCheng.text == "")
        {
            
            yingYeChangSuoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if beiShenQingDanWeiMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.syzgljmc = beiShenQingDanWeiMingCheng.text
        } else if (beiShenQingDanWeiMingCheng.text == "")
        {
            
            beiShenQingDanWeiMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if shenQingZhuYaoYuanYin.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.sqtzblhzxzywdzyyy = shenQingZhuYaoYuanYin.text
        } else if (shenQingZhuYaoYuanYin.text == "")
        {
            
            shenQingZhuYaoYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if niTingBanShiJianNian.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzblsj_n = niTingBanShiJianNian.text
        } else if (niTingBanShiJianNian.text == "")
        {
            
            niTingBanShiJianNian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if niTingBanShiJianYue.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzblsj_y = niTingBanShiJianYue.text
        } else if (niTingBanShiJianYue.text == "")
        {
            
            niTingBanShiJianYue.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        //infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzbl = chooseBanLiShiXiangLabel.text
        if  chooseBanLiShiXiangLabel.text == "未选择" {
            chooseBanLiShiXiangLabel.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseBanLiShiXiangLabel.text == "停止办理")  {
                infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzbl = "tzbl"
            }
            if(chooseBanLiShiXiangLabel.text == "限制办理") {
                infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzbl = "xzbl"
            }
        }
        
        if changSuoDiZhiShi.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzbldz_s =  changSuoDiZhiShi.text
        } else if (changSuoDiZhiShi.text == "")
        {
            
            changSuoDiZhiShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if changSuoDiZhiXian.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzbldz_xqs = changSuoDiZhiXian.text
        } else if (changSuoDiZhiXian.text == "")
        {
            
            changSuoDiZhiXian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if changSuoDiJie.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzbldz_jx = changSuoDiJie.text
        } else if (changSuoDiJie.text == "")
        {
            
            changSuoDiJie.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        
        if youZhengYingYeChangSuoMingCeng.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.yzyycsmc = youZhengYingYeChangSuoMingCeng.text
        } else if (youZhengYingYeChangSuoMingCeng.text == "")
        {
            
            youZhengYingYeChangSuoMingCeng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        //infoOfYzyycstbhybyzpbfwywhtsfwywdsq.yzpbfwywhtsfwyw = chooseTingXianBanLiYeWuZhongLei.text
        if  chooseTingXianBanLiYeWuZhongLei.text == "未选择" {
            chooseTingXianBanLiYeWuZhongLei.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseTingXianBanLiYeWuZhongLei.text == "邮政普遍服务业务")  {
                infoOfYzyycstbhybyzpbfwywhtsfwywdsq.yzpbfwywhtsfwyw = "yzpbfwyw"
            }
            if (chooseTingXianBanLiYeWuZhongLei.text == "特殊服务业务") {
                infoOfYzyycstbhybyzpbfwywhtsfwywdsq.yzpbfwywhtsfwyw = "tsfwyw"
            }
        }
        
        if jiTiYeWuMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.jtywmc = jiTiYeWuMingCheng.text
        } else if (jiTiYeWuMingCheng.text == "")
        {
            
            jiTiYeWuMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if yeWuJuTiQingXing.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.xzblywdjtqx = yeWuJuTiQingXing.text
        } else if (yeWuJuTiQingXing.text == "")
        {
            
            yeWuJuTiQingXing.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if niCaiQuBuJiuCuoShi.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.cqdbjcs = niCaiQuBuJiuCuoShi.text
        } else if (niCaiQuBuJiuCuoShi.text == "")
        {
            
            niCaiQuBuJiuCuoShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if zongTiFuWuShuiPing.text != "" {
            COMMIT_OK += 1
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.yzpbfwztsp = zongTiFuWuShuiPing.text
        } else if (zongTiFuWuShuiPing.text == "")
        {
            
            zongTiFuWuShuiPing.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
    //上传图片字段
        if uploadBtn1PicVC != nil {
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.gsyyzzfyj = (uploadBtn1PicVC?.picUrl)!
        }
        print(uploadBtn1PicVC?.picUrl)
        if infoOfYzyycstbhybyzpbfwywhtsfwywdsq.gsyyzzfyj == "" {
            UIAlertView(title: "请上传图片", message: "上传邮政营业场所的工商营业执照复印件", delegate: nil, cancelButtonTitle: "返回上传").show()
        } else {
            COMMIT_OK += 1
        }
        
        if uploadBtn2PicVC != nil { 
            infoOfYzyycstbhybyzpbfwywhtsfwywdsq.zmwj = (uploadBtn2PicVC?.picUrl)!
        }
        print(uploadBtn2PicVC?.picUrl)
        if infoOfYzyycstbhybyzpbfwywhtsfwywdsq.zmwj == "" {
            UIAlertView(title: "请上传图片", message: "上传申请停限办业务原因的证明文件", delegate: nil, cancelButtonTitle: "返回上传").show()
        } else {
            COMMIT_OK += 1
        }
        
        //拟停止或限制办理业务营业场所基本情况表
        if yingYeChangSuoMingCheng1.text != "" {
            COMMIT_OK += 1
            infoOfNthybywyzyycsjbqkb.yzyycsmc = yingYeChangSuoMingCheng1.text
        } else if (yingYeChangSuoMingCheng1.text == "")
        {
            
            yingYeChangSuoMingCheng1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if shangJiDanWei1.text != "" {
            COMMIT_OK += 1
            infoOfNthybywyzyycsjbqkb.sjdw = shangJiDanWei1.text
        } else if (shangJiDanWei1.text == "")
        {
            
            shangJiDanWei1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
//        if ((XinJian.selected || YouZhengHuiDui.selected || MangRenDuWu.selected || YinShuaPin.selected || BaoGuo.selected || LieShiBaoGuo.selected || GuoJiaGuiDingBaoKanDeFaXing.selected || YiWuBingXinHan.selected) == false)
//        {
//            
//            let alertView = UIAlertView(title: "须选择停止办理业务事项", message:  "停止办理业务事项不能为空", delegate: self, cancelButtonTitle: "返回编辑")
//            alertView.show()
//        } else {
//            COMMIT_OK += 1
//            if XinJian.selected {
//                infoOfNthybywyzyycsjbqkb.tzblywsx += "xj"
//            }
//            if YouZhengHuiDui.selected {
//                infoOfNthybywyzyycsjbqkb.tzblywsx += ",yzhd"
//            }
//            if MangRenDuWu.selected {
//                infoOfNthybywyzyycsjbqkb.tzblywsx += ",mrdw"
//            }
//            if YinShuaPin.selected {
//                infoOfNthybywyzyycsjbqkb.tzblywsx += ",ysp"
//            }
//            if BaoGuo.selected {
//                infoOfNthybywyzyycsjbqkb.tzblywsx += ",bgs"
//            }
//            if LieShiBaoGuo.selected {
//                infoOfNthybywyzyycsjbqkb.tzblywsx += ",gmlsyw"
//            }
//            if GuoJiaGuiDingBaoKanDeFaXing.selected {
//                infoOfNthybywyzyycsjbqkb.tzblywsx += ",gjgdbkdfx"
//            }
//            if YiWuBingXinHan.selected {
//                infoOfNthybywyzyycsjbqkb.tzblywsx += ",ywbpcxh"
//            }
//        }
    
        var stringForEdit1 = ""
         var stringForEdit2 = ""
        //---------------
        if (((XinJian1.selected || YouZhengHuiDui1.selected || MangRenDuWu1.selected || YinShuaPin1.selected || BaoGuo1.selected || LieShiBaoGuo1.selected || GuoJiaGuiDingBaoKanDeFaXing1.selected || YiWuBingXinHan1.selected) == false) && ((XinJian.selected || YouZhengHuiDui.selected || MangRenDuWu.selected || YinShuaPin.selected || BaoGuo.selected || LieShiBaoGuo.selected || GuoJiaGuiDingBaoKanDeFaXing.selected || YiWuBingXinHan.selected) == false))
        {
            
            let alertView = UIAlertView(title: "停办业务事项和限办业务事项不能同时为空", message:  "", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            
            if XinJian.selected {
                infoOfNthybywyzyycsjbqkb.tzblywsx += "xj"
                stringForEdit1 += "xj"
            }
            if YouZhengHuiDui.selected {
                infoOfNthybywyzyycsjbqkb.tzblywsx += ",yzhd"
                stringForEdit1 += ",yzhd"
            }
            if MangRenDuWu.selected {
                infoOfNthybywyzyycsjbqkb.tzblywsx += ",mrdw"
                stringForEdit1 += ",mrdw"
            }
            if YinShuaPin.selected {
                infoOfNthybywyzyycsjbqkb.tzblywsx += ",ysp"
                stringForEdit1 += ",ysp"
            }
            if BaoGuo.selected {
                infoOfNthybywyzyycsjbqkb.tzblywsx += ",bgs"
                stringForEdit1 += ",bgs"
            }
            if LieShiBaoGuo.selected {
                infoOfNthybywyzyycsjbqkb.tzblywsx += ",gmlsyw"
                stringForEdit1 += ",gmlsyw"
            }
            if GuoJiaGuiDingBaoKanDeFaXing.selected {
                infoOfNthybywyzyycsjbqkb.tzblywsx += ",gjgdbkdfx"
                stringForEdit1 += ",gjgdbkdfx"
            }
            if YiWuBingXinHan.selected {
                infoOfNthybywyzyycsjbqkb.tzblywsx += ",ywbpcxh"
                stringForEdit1 += ",ywbpcxh"
            }
            
           
            //----------------不同时为空2---------------
            if XinJian1.selected {
                infoOfNthybywyzyycsjbqkb.xzblywsx += "xj"
                stringForEdit2 += "xj"
            }
            if YouZhengHuiDui1.selected {
                infoOfNthybywyzyycsjbqkb.xzblywsx += ",yzhd"
                stringForEdit2 += ",yzhd"
            }
            if MangRenDuWu1.selected {
                infoOfNthybywyzyycsjbqkb.xzblywsx += ",mrdw"
                stringForEdit2 += ",mrdw"
            }
            if YinShuaPin1.selected {
                infoOfNthybywyzyycsjbqkb.xzblywsx += ",ysp"
                stringForEdit2 += ",ysp"
            }
            if BaoGuo1.selected {
                infoOfNthybywyzyycsjbqkb.xzblywsx += ",bgs"
                stringForEdit2 += ",bgs"
            }
            if LieShiBaoGuo1.selected {
                infoOfNthybywyzyycsjbqkb.xzblywsx += ",lsywbg"
                stringForEdit2 += ",lsywbg"
            }
            if GuoJiaGuiDingBaoKanDeFaXing1.selected {
                infoOfNthybywyzyycsjbqkb.xzblywsx += ",gjgdbkdfx"
                stringForEdit2 += ",gjgdbkdfx"
            }
            if YiWuBingXinHan1.selected {
                infoOfNthybywyzyycsjbqkb.xzblywsx += ",ywbpcxh"
                stringForEdit2 += ",ywbpcxh"
            }
        }
        
        if fuWuQuYu1.text != "" {
            COMMIT_OK += 1
            infoOfNthybywyzyycsjbqkb.tbhxbywyzyycsdfwqy = fuWuQuYu1.text
        } else if (fuWuQuYu1.text == "")
        {
            
            fuWuQuYu1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if diZhi1.text != "" {
            COMMIT_OK += 1
            infoOfNthybywyzyycsjbqkb.dz = diZhi1.text
        } else if (diZhi1.text == "")
        {
            
            diZhi1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchYouBian = rxYouBian.isMatch(youBian1.text)
        if isMatchYouBian {
            COMMIT_OK += 1
            infoOfNthybywyzyycsjbqkb.yzbm = youBian1.text
        } else {
            
            print("邮政编码不符合要求")
            //            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            youBian1.text = "不符要求"
            youBian1.textColor = UIColor.redColor()
        }

        
        if lianXiRenXingMing1.text != "" {
            COMMIT_OK += 1
            infoOfNthybywyzyycsjbqkb.lxrxm = lianXiRenXingMing1.text
        } else if (lianXiRenXingMing1.text == "")
        {
            
            lianXiRenXingMing1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchLianXiDianHua = rxLianXiDianHua.isMatch(lianXiDianHua1.text)
        if isMatchLianXiDianHua {
            COMMIT_OK += 1
            infoOfNthybywyzyycsjbqkb.lxdh = lianXiDianHua1.text
        } else {
            
            print("联系电话不符合要求")
            //            lianXiDianHua.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            lianXiDianHua1.text = "不符要求"
            lianXiDianHua1.textColor = UIColor.redColor()
        }
        
        print("\(COMMIT_OK)", terminator: "\n")
        
        if (COMMIT_OK == 26) {
            if app.ServerData == 0 {
                app.network.addWithInterface("Txyw", andUser: app.userData, andInfo:  ClassToJSON.getObjectData(infoOfYzyycstbhybyzpbfwywhtsfwywdsq), andExtraInfo: ClassToJSON.getObjectData(infoOfNthybywyzyycsjbqkb))
                
            }
            
            if app.ServerData == 2 {
                let info1 = app.applyStopDic.valueForKey("info1")
                info1!.setValue(fenGongSi.text, forKey: "zgyzjtgsttfgsmc")
                info1!.setValue(yingYeChangSuoMingCheng.text, forKey: "btyzyycsmc")
                info1!.setValue(beiShenQingDanWeiMingCheng.text, forKey: "syzgljmc")
                info1!.setValue(shenQingZhuYaoYuanYin.text, forKey: "sqtzblhzxzywdzyyy")
                info1!.setValue(niTingBanShiJianNian.text, forKey: "tzblhzxzblsj_n")
                info1!.setValue(niTingBanShiJianYue.text, forKey: "tzblhzxzblsj_y")
                info1!.setValue(chooseBanLiShiXiangLabel.text, forKey: "tzblhzxzbl")
                info1!.setValue(changSuoDiZhiShi.text, forKey: "tzblhzxzbldz_s")
                info1!.setValue(changSuoDiZhiXian.text, forKey: "tzblhzxzbldz_xqs")
                info1!.setValue(changSuoDiJie.text, forKey: "tzblhzxzbldz_jx")
                info1!.setValue(youZhengYingYeChangSuoMingCeng.text, forKey: "yzyycsmc")
                info1!.setValue(chooseTingXianBanLiYeWuZhongLei.text, forKey: "yzpbfwywhtsfwyw")
                info1!.setValue(jiTiYeWuMingCheng.text, forKey: "jtywmc")
                info1!.setValue(yeWuJuTiQingXing.text, forKey: "xzblywdjtqx")
                info1!.setValue(niCaiQuBuJiuCuoShi.text, forKey: "cqdbjcs")
                info1!.setValue(zongTiFuWuShuiPing.text, forKey: "yzpbfwztsp")
                info1!.setValue(uploadBtn1PicVC?.picUrl, forKey: "gsyyzzfyj")
                info1!.setValue(uploadBtn2PicVC?.picUrl, forKey: "zmwj")
                
                let info2 = app.applyStopDic.valueForKey("info2")
                info2!.setValue(yingYeChangSuoMingCheng1.text, forKey: "yzyycsmc")
                info2!.setValue(shangJiDanWei1.text, forKey: "sjdw")
                info2!.setValue(stringForEdit1, forKey: "tzblywsx")
                info2!.setValue(stringForEdit2, forKey: "xzblywsx")
                info2!.setValue(fuWuQuYu1.text, forKey: "tbhxbywyzyycsdfwqy")
                info2!.setValue(diZhi1.text, forKey: "dz")
                info2!.setValue(youBian1.text, forKey: "yzbm")
                info2!.setValue(lianXiRenXingMing1.text, forKey: "lxrxm")
                info2!.setValue(lianXiDianHua1.text, forKey: "lxdh")
                
                app.network.editWithInterface("Txyw", andInfo: info1 as! [NSObject : AnyObject] , andExtraInfo: info2 as! [NSObject : AnyObject])
            }
        }
        
        
//        println("\(ClassToJSON.getObjectData(infoOfYzyycstbhybyzpbfwywhtsfwywdsq))")
//        
//        println("\(ClassToJSON.getObjectData(infoOfNthybywyzyycsjbqkb))")
        
    }
    
    func initTingZhi(dict: NSDictionary) {
        fenGongSi.text = dict.valueForKey("zgyzjtgsttfgsmc") as? String
        yingYeChangSuoMingCheng.text = dict.valueForKey("btyzyycsmc") as? String
        beiShenQingDanWeiMingCheng.text = dict.valueForKey("syzgljmc") as? String
        
        shenQingZhuYaoYuanYin.text = dict.valueForKey("sqtzblhzxzywdzyyy") as? String
        niTingBanShiJianNian.text = dict.valueForKey("tzblhzxzblsj_n") as? String
        niTingBanShiJianYue.text = dict.valueForKey("tzblhzxzblsj_y") as? String
        
        //infoOfYzyycstbhybyzpbfwywhtsfwywdsq.tzblhzxzbl = chooseBanLiShiXiangLabel.text
        if (dict.valueForKey("tzblhzxzbl") as! String == "tzbl")   {
           chooseBanLiShiXiangLabel.text = "停止办理"
        }
        if(dict.valueForKey("tzblhzxzbl") as! String == "xzbl") {
            chooseBanLiShiXiangLabel.text = "限制办理"
        }
        
        changSuoDiZhiShi.text = dict.valueForKey("tzblhzxzbldz_s") as? String
        changSuoDiZhiXian.text = dict.valueForKey("tzblhzxzbldz_xqs") as? String
        changSuoDiJie.text = dict.valueForKey("tzblhzxzbldz_jx") as? String
        youZhengYingYeChangSuoMingCeng.text = dict.valueForKey("yzyycsmc") as? String
        
        //infoOfYzyycstbhybyzpbfwywhtsfwywdsq.yzpbfwywhtsfwyw = chooseTingXianBanLiYeWuZhongLei.text
        if (dict.valueForKey("yzpbfwywhtsfwyw") as! String == "yzpbfwyw")  {
            chooseTingXianBanLiYeWuZhongLei.text = "邮政普遍服务业务"
        }
        if (dict.valueForKey("yzpbfwywhtsfwyw") as! String == "tsfwyw") {
            chooseTingXianBanLiYeWuZhongLei.text = "特殊服务业务"
        }
        
        jiTiYeWuMingCheng.text = dict.valueForKey("jtywmc") as? String
        yeWuJuTiQingXing.text = dict.valueForKey("xzblywdjtqx") as? String
        niCaiQuBuJiuCuoShi.text = dict.valueForKey("cqdbjcs") as? String
        zongTiFuWuShuiPing.text = dict.valueForKey("yzpbfwztsp") as? String
        
        //拟停止或限制办理业务营业场所基本情况表
        yingYeChangSuoMingCheng1.text = dict.valueForKey("yzyycsmc") as? String
        shangJiDanWei1.text = dict.valueForKey("sjdw") as? String
        
        let ywsxArray = dict.valueForKey("tzblywsx") as! String
        print("\(ywsxArray)")
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

        let ywsxArray2 = dict.valueForKey("xzblywsx") as! String
        if (ywsxArray2.rangeOfString("xj") != nil) {
            XinJian1.selected = true
        }
        if (ywsxArray2.rangeOfString("yzhd") != nil) {
            YouZhengHuiDui1.selected = true
        }
        if (ywsxArray2.rangeOfString("mrdw") != nil) {
            MangRenDuWu1.selected = true
        }
        if (ywsxArray2.rangeOfString("ysp") != nil) {
            YinShuaPin1.selected = true
        }
        if (ywsxArray2.rangeOfString("bgs") != nil) {
            BaoGuo1.selected = true
        }
        if (ywsxArray2.rangeOfString("gmlsyw") != nil) {
            LieShiBaoGuo1.selected = true
        }
        if (ywsxArray2.rangeOfString("gjgdbkdfx") != nil) {
            GuoJiaGuiDingBaoKanDeFaXing1.selected = true
        }
        if (ywsxArray2.rangeOfString("ywbpcxh") != nil) {
            YiWuBingXinHan1.selected = true
        }
        
        fuWuQuYu1.text = dict.valueForKey("tbhxbywyzyycsdfwqy") as? String
        diZhi1.text = dict.valueForKey("dz") as? String
        youBian1.text = dict.valueForKey("yzbm") as? String
        lianXiRenXingMing1.text = dict.valueForKey("lxrxm") as? String
        lianXiDianHua1.text = dict.valueForKey("lxdh") as? String

    }
    
    var app = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidDisappear(animated: Bool) {
        app.ServerData = 0
    }
    
    @IBOutlet var tap1: UITapGestureRecognizer!
    @IBOutlet var tap2: UITapGestureRecognizer!
    @IBOutlet weak var commitBtn: UIButton!

    let bkView = UIView(frame: CGRect(x: 0, y: UIScreen.mainScreen().bounds.size.height - 80, width: UIScreen.mainScreen().bounds.size.width, height: 80))
//    let textFieldOnBkView = UITextField(frame: CGRect(x: 45, y: 5, width: UIScreen.mainScreen().bounds.size.width - 80, height: 30))
    let textViewOnBkView = UITextView(frame: CGRect(x: 45, y: 5, width: UIScreen.mainScreen().bounds.size.width - 80, height: 30))
//    let label = UILabel(frame: CGRect(x: 45, y: 5, width: UIScreen.mainScreen().bounds.size.width - 80, height: 30))
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
            textViewOnBkView.text = app.applyStopDic.valueForKey("info1")!.valueForKey("sppl") as? String
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
        labelNav.text = "申请停止/限制办理业务"
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
            fenGongSi.enabled = true
            yingYeChangSuoMingCheng.enabled = true
            beiShenQingDanWeiMingCheng.enabled = true
            
            shenQingZhuYaoYuanYin.enabled = true
            niTingBanShiJianNian.enabled = true
            niTingBanShiJianYue.enabled = true
            
            tap1.enabled = true
            
            changSuoDiZhiShi.enabled = true
            changSuoDiZhiXian.enabled = true
            changSuoDiJie.enabled = true
            yingYeChangSuoMingCheng.enabled = true
            
            tap2.enabled = true
            
            jiTiYeWuMingCheng.enabled = true
            yeWuJuTiQingXing.enabled = true
            niCaiQuBuJiuCuoShi.enabled = true
            zongTiFuWuShuiPing.enabled = true
            
            //拟停止或限制办理业务营业场所基本情况表
            yingYeChangSuoMingCheng1.enabled = true
            shangJiDanWei1.enabled = true
            
            XinJian.enabled = true
            YouZhengHuiDui.enabled = true
            MangRenDuWu.enabled = true
            YinShuaPin.enabled = true
            BaoGuo.enabled = true
            LieShiBaoGuo.enabled = true
            GuoJiaGuiDingBaoKanDeFaXing.enabled = true
            YiWuBingXinHan.enabled = true
            XinJian1.enabled = true
            YouZhengHuiDui1.enabled = true
            MangRenDuWu1.enabled = true
            YinShuaPin1.enabled = true
            BaoGuo1.enabled = true
            LieShiBaoGuo1.enabled = true
            GuoJiaGuiDingBaoKanDeFaXing1.enabled = true
            YiWuBingXinHan1.enabled = true
            fuWuQuYu1.enabled = true
            diZhi1.enabled = true
            youBian1.enabled = true
            lianXiRenXingMing1.enabled = true
            lianXiDianHua1.enabled = true
            
            commitBtn.hidden = false
        }
        
        if app.ServerData == 1 {
            
            let stateValueFromServer1 = app.applyStopDic.valueForKey("info1")?.valueForKey("state") as? Int
            let stateValueFromServer2 = app.applyStopDic.valueForKey("info1")?.valueForKey("state") as? Int
            print(stateValueFromServer1)
            if stateValueFromServer1 == 1 || stateValueFromServer1 == 2 || stateValueFromServer1 == 3 || stateValueFromServer2 == 1 || stateValueFromServer2 == 2 || stateValueFromServer2 == 3 {
                //                bkView.backgroundColor = UIColor.redColor()
                //                let btmOnBkView = UIButton(frame: CGRect(x: 10, y: 30, width: 150, height: 30))
                btmOnBkView.backgroundColor = UIColor.redColor()
                btmOnBkView.setTitle("查看审核意见", forState: .Normal)
                btmOnBkView.addTarget(self, action:Selector("shenHeYiJianBtnAction") , forControlEvents: .TouchUpInside)
                self.view.addSubview(bkView)
                bkView.addSubview(btmOnBkView)
                bkView.backgroundColor = UIColor(red: 199/255, green: 228/255, blue: 226/255, alpha: 1)
            }

            
            fenGongSi.enabled = false
            yingYeChangSuoMingCheng.enabled = false
            beiShenQingDanWeiMingCheng.enabled = false
            
            shenQingZhuYaoYuanYin.enabled = false
            niTingBanShiJianNian.enabled = false
            niTingBanShiJianYue.enabled = false

            tap1.enabled = false
            
            changSuoDiZhiShi.enabled = false
            changSuoDiZhiXian.enabled = false
            changSuoDiJie.enabled = false
            youZhengYingYeChangSuoMingCeng.enabled = false
            
            tap2.enabled = false
            
            jiTiYeWuMingCheng.enabled = false
            yeWuJuTiQingXing.enabled = false
            niCaiQuBuJiuCuoShi.enabled = false
            zongTiFuWuShuiPing.enabled = false
            
            //拟停止或限制办理业务营业场所基本情况表
            yingYeChangSuoMingCheng1.enabled = false
            shangJiDanWei1.enabled = false
            
            XinJian.enabled = false
            YouZhengHuiDui.enabled = false
            MangRenDuWu.enabled = false
            
            YinShuaPin.enabled = false
            
            BaoGuo.enabled = false
            LieShiBaoGuo.enabled = false
            GuoJiaGuiDingBaoKanDeFaXing.enabled = false
            
            YiWuBingXinHan.enabled = false
            
            
            XinJian1.enabled = false
            YouZhengHuiDui1.enabled = false
            MangRenDuWu1.enabled = false
            YinShuaPin1.enabled = false
            BaoGuo1.enabled = false
            LieShiBaoGuo1.enabled = false
            GuoJiaGuiDingBaoKanDeFaXing1.enabled = false
            YiWuBingXinHan1.enabled = false
            fuWuQuYu1.enabled = false
            diZhi1.enabled = false
            youBian1.enabled = false
            lianXiRenXingMing1.enabled = false
            lianXiDianHua1.enabled = false
            
            let dict1 = app.applyStopDic.valueForKey("info1") as! NSMutableDictionary
            let dict2 = app.applyStopDic.valueForKey("info2") as! NSMutableDictionary
            dict1.addEntriesFromDictionary(dict2 as NSDictionary as [NSObject : AnyObject])
            
            initTingZhi(dict1)
            
            uploadBtn1.setTitle("查看邮政营业场所的工商营业执照复印件", forState: .Normal)
            uploadBtn2.setTitle("查看申请停限办业务原因的证明文件", forState: .Normal)
            
            commitBtn.hidden = true
        }
        
        if app.ServerData == 2 {
            
            let stateValueFromServer1 = app.applyStopDic.valueForKey("info1")?.valueForKey("state") as? Int
            let stateValueFromServer2 = app.applyStopDic.valueForKey("info1")?.valueForKey("state") as? Int
            print(stateValueFromServer1)
            if stateValueFromServer1 == 1 || stateValueFromServer1 == 2 || stateValueFromServer1 == 3 || stateValueFromServer2 == 1 || stateValueFromServer2 == 2 || stateValueFromServer2 == 3 {
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
            print("\(app.applyStopDic)")
            let dict1 = app.applyStopDic.valueForKey("info1") as! NSMutableDictionary
            let dict2 = app.applyStopDic.valueForKey("info2") as! NSMutableDictionary
            dict1.addEntriesFromDictionary(dict2 as NSDictionary as [NSObject : AnyObject])
            
            initTingZhi(dict1)
            
            fenGongSi.enabled = true
            yingYeChangSuoMingCheng.enabled = true
            beiShenQingDanWeiMingCheng.enabled = true
            
            shenQingZhuYaoYuanYin.enabled = true
            niTingBanShiJianNian.enabled = true
            niTingBanShiJianYue.enabled = true
            
            tap1.enabled = true
            
            changSuoDiZhiShi.enabled = true
            changSuoDiZhiXian.enabled = true
            changSuoDiJie.enabled = true
            yingYeChangSuoMingCheng.enabled = true
            
            tap2.enabled = true
            
            jiTiYeWuMingCheng.enabled = true
            yeWuJuTiQingXing.enabled = true
            niCaiQuBuJiuCuoShi.enabled = true
            zongTiFuWuShuiPing.enabled = true
            
            //拟停止或限制办理业务营业场所基本情况表
            yingYeChangSuoMingCheng1.enabled = true
            shangJiDanWei1.enabled = true
            
            XinJian.enabled = true
            YouZhengHuiDui.enabled = true
            MangRenDuWu.enabled = true
            YinShuaPin.enabled = true
            BaoGuo.enabled = true
            LieShiBaoGuo.enabled = true
            GuoJiaGuiDingBaoKanDeFaXing.enabled = true
            YiWuBingXinHan.enabled = true
            XinJian1.enabled = true
            YouZhengHuiDui1.enabled = true
            MangRenDuWu1.enabled = true
            YinShuaPin1.enabled = true
            BaoGuo1.enabled = true
            LieShiBaoGuo1.enabled = true
            GuoJiaGuiDingBaoKanDeFaXing1.enabled = true
            YiWuBingXinHan1.enabled = true
            fuWuQuYu1.enabled = true
            diZhi1.enabled = true
            youBian1.enabled = true
            lianXiRenXingMing1.enabled = true
            lianXiDianHua1.enabled = true
            
            commitBtn.hidden = false
        }
    }
    
    @IBOutlet weak var uploadBtn1: UIButton!
    @IBOutlet weak var uploadBtn2: UIButton!
    
    
    //图片上传
//    @IBAction func uploadYingYeChangSuoGongShangYingYeZhiZhaoFuYinJian(sender: AnyObject) {
//        
//        if app.ServerData == 0 {
//            let uploadVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "邮政营业场所工商营业执照复印件", andUploadKind: 1)
//            
//            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
//                uploadVC.providesPresentationContextTransitionStyle = true
//                uploadVC.definesPresentationContext = true
//                if #available(iOS 8.0, *) {
//                    uploadVC.modalPresentationStyle = .OverCurrentContext
//                } else {
//                    // Fallback on earlier versions
//                }
//                self.presentViewController(uploadVC ,animated: true, completion: nil)
//            } else {
//                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
//                self.presentViewController(uploadVC ,animated: false, completion: nil)
//                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
//            }
//            
//            uploadVCForPicURL1 = uploadVC
//            print("\(uploadVCForPicURL1)")
//            print("\(uploadVC)")
//            print("呵呵呵\(uploadVCForPicURL1!.picUrl)")
//            print("哈哈哈\(infoOfYzyycstbhybyzpbfwywhtsfwywdsq.gsyyzzfyj)")
//        }
//        
//        if app.ServerData == 1 {
////            app.ServerData = 0
//            let dict1 = app.applyStopDic.valueForKey("info1") as! NSMutableDictionary
//            
//            let picStr: AnyObject? = dict1.valueForKey("gsyyzzfyj") as! String
//            print("\(picStr!.description)")
////            var picNSString = NSString((CString: dict1.valueForKey("gsyyzzfyj") as! String), encoding: NSUTF8StringEncoding))
//            
//            let uploadVC = UploadPicViewController(uploadState: false, andUrl: picStr as! String, andCountOfPic: 1, andFormName: "邮政营业场所工商营业执照复印件", andUploadKind: 1)
//            
//            
//            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
//                uploadVC.providesPresentationContextTransitionStyle = true
//                uploadVC.definesPresentationContext = true
//                if #available(iOS 8.0, *) {
//                    uploadVC.modalPresentationStyle = .OverCurrentContext
//                } else {
//                    // Fallback on earlier versions
//                }
//                self.presentViewController(uploadVC ,animated: true, completion: nil)
//            } else {
//                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
//                self.presentViewController(uploadVC ,animated: false, completion: nil)
//                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
//            }
//        }
//        
//        if app.ServerData == 2 {
//            //            app.ServerData = 0
//            let dict1 = app.applyStopDic.valueForKey("info1") as! NSMutableDictionary
//            
//            let picStr: AnyObject? = dict1.valueForKey("gsyyzzfyj")
//            print("\(picStr!.description)")
//            //            var picNSString = NSString((CString: dict1.valueForKey("gsyyzzfyj") as! String), encoding: NSUTF8StringEncoding))
//            
//            let uploadVC = UploadPicViewController(uploadState: true, andUrl: picStr as! String, andCountOfPic: 1, andFormName: "邮政营业场所工商营业执照复印件", andUploadKind: 1)
//            
//            
//            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
//                uploadVC.providesPresentationContextTransitionStyle = true
//                uploadVC.definesPresentationContext = true
//                if #available(iOS 8.0, *) {
//                    uploadVC.modalPresentationStyle = .OverCurrentContext
//                } else {
//                    // Fallback on earlier versions
//                }
//                self.presentViewController(uploadVC ,animated: true, completion: nil)
//            } else {
//                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
//                self.presentViewController(uploadVC ,animated: false, completion: nil)
//                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
//            }
//        }
//
//
//    }
    
    //上传照片类对应的实例对象 全局
    var uploadBtn1PicVC: UploadPicViewController?
    
    @IBAction func uploadYingYeChangSuoGongShangYingYeZhiZhaoFuYinJian(sender: AnyObject) {
        
        if app.ServerData == 0 {
            uploadBtn1PicVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "邮政营业场所工商营业执照复印件", andUploadKind: 1)
            
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
            
//            uploadVCForPicURL1 = uploadBtn1PicVC
//            print("\(uploadVCForPicURL1)")
//            print("\(uploadBtn1PicVC)")
//            print("呵呵呵\(uploadVCForPicURL1!.picUrl)")
//            print("哈哈哈\(infoOfYzyycstbhybyzpbfwywhtsfwywdsq.gsyyzzfyj)")
        }
        
        if app.ServerData == 1 {
            //            app.ServerData = 0
            let dict1 = app.applyStopDic.valueForKey("info1") as! NSMutableDictionary
            
            let picStr: AnyObject? = dict1.valueForKey("gsyyzzfyj") as! String
            print("啊哈哈哈\(picStr!.description)")
            //            var picNSString = NSString((CString: dict1.valueForKey("gsyyzzfyj") as! String), encoding: NSUTF8StringEncoding))
            
            let uploadVC = UploadPicViewController(uploadState: false, andUrl: picStr as! String, andCountOfPic: 1, andFormName: "邮政营业场所工商营业执照复印件", andUploadKind: 1)
            
            
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
            //            app.ServerData = 0
            let dict1 = app.applyStopDic.valueForKey("info1") as! NSMutableDictionary
            
            let picStr: AnyObject? = dict1.valueForKey("gsyyzzfyj")
            print("\(picStr!.description)")
            //            var picNSString = NSString((CString: dict1.valueForKey("gsyyzzfyj") as! String), encoding: NSUTF8StringEncoding))
            
            let uploadVC = UploadPicViewController(uploadState: true, andUrl: picStr as! String, andCountOfPic: 1, andFormName: "邮政营业场所工商营业执照复印件", andUploadKind: 1)
            
            
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
        
        
    }
    
    
    
    
    
    
    
    
    var uploadBtn2PicVC: UploadPicViewController?
    
    @IBAction func uploadShenQingTingXianBanLiYeWuZhengMingWenJian(sender: AnyObject) {
        if app.ServerData == 0 {
            uploadBtn2PicVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "申请停限办业务原因的证明文件", andUploadKind: 1)
            
            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
                uploadBtn2PicVC!.providesPresentationContextTransitionStyle = true
                uploadBtn2PicVC!.definesPresentationContext = true
                if #available(iOS 8.0, *) {
                    uploadBtn2PicVC!.modalPresentationStyle = .OverCurrentContext
                } else {
                    // Fallback on earlier versions
                    uploadBtn2PicVC!.modalPresentationStyle = .CurrentContext
                }
                self.presentViewController(uploadBtn2PicVC!, animated: true, completion: nil)
            } else {
                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(uploadBtn2PicVC!, animated: false, completion: nil)
                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
            }
            
        }
        
        if app.ServerData == 1 {
//            app.ServerData = 0
            let dict2 = app.applyStopDic.valueForKey("info1") as! NSMutableDictionary
            print("\(dict2.valueForKey("zmwj"))")
            
            let uploadVC = UploadPicViewController(uploadState: false, andUrl: dict2.valueForKey("zmwj") as! String, andCountOfPic: 1, andFormName: "申请停限办业务原因的证明文件", andUploadKind: 1)
            
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
//            app.ServerData = 0
            let dict2 = app.applyStopDic.valueForKey("info1") as! NSMutableDictionary
            
            let uploadVC = UploadPicViewController(uploadState: true, andUrl: dict2.valueForKey("zmwj") as! String, andCountOfPic: 1, andFormName: "申请停限办业务原因的证明文件", andUploadKind: 1)
            
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
        
    }
    
}

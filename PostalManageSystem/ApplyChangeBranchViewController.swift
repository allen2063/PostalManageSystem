//
//  ApplyChangeBranchViewController.swift
//  POST
//
//  Created by QiaoLibo on 15/9/3.
//  Copyright (c) 2015年 Qiaolibo. All rights reserved.
//

import UIKit

class ApplyChangeBranchViewController: UIViewController, UIActionSheetDelegate, UITextFieldDelegate, UIScrollViewDelegate{
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
            if SegmentedControl.selectedSegmentIndex == 0 {
                rootView.contentSize = CGSize(width: 320, height: 1870)
            } else {
                rootView.contentSize = CGSize(width: 320, height: 2079)
            }
            
            UIView.animateWithDuration(0.3, animations: {
                
                
                rootView.contentOffset.y = (keyboardHeight + self.textFieldHeight!) - (UIScreen.mainScreen().bounds.height)
                
            })
        }
    }
    
    func keyboardWillHide(aNotification: NSNotification)
    {
        let rootView = self.view as! UIScrollView
        
        if SegmentedControl.selectedSegmentIndex == 0 {
            rootView.contentSize = CGSize(width: 320, height: 1670)
        } else {
            rootView.contentSize = CGSize(width: 320, height: 1879)
        }
        
        UIView.animateWithDuration(0.3, animations: {
            rootView.contentOffset.y = self.positionChangeY
        })
    }
    
    var textFieldHeight: CGFloat?
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textFieldHeight = textField.frame.size.height + textField.frame.origin.y + 42
        return true
    }

    
    
    @IBOutlet weak var applyChangeBranchInfoView: UIView!
    @IBOutlet weak var applyChangeBranchLocationView: UIView!
    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    
    @IBAction func changeBranchSegmentedControlValueChanged(sender: AnyObject) {
        if let segmentedControl = sender as? UISegmentedControl {
            let index = segmentedControl.selectedSegmentIndex
            print("Index: \(index)")
            switch index {
            case 0:
                applyChangeBranchInfoView.hidden = false
                applyChangeBranchLocationView.hidden = true
                if let rootView = self.view as? UIScrollView {
                    rootView.contentSize = CGSize(width: 320, height: 1670)
                }
            case 1:
                applyChangeBranchInfoView.hidden = true
                applyChangeBranchLocationView.hidden = false
                if let rootView = self.view as? UIScrollView {
                    rootView.contentSize = CGSize(width: 320, height: 1879)
                }
            default:
                break;
            }
        }
    }
    
    
    
    
    @IBOutlet weak var mingChengBianGeng: UIButton! //名称变更
    @IBOutlet weak var jingYingShiJianBianGeng: UIButton! //经营时间变更
    @IBOutlet weak var jingYingFangShiBianGeng: UIButton! //经营方式变更
    @IBOutlet weak var changQuanXingZhiBianGeng: UIButton!  //产权性质变更
    @IBAction func touchInsideChooseChangeIssueBtn(sender: AnyObject) {
        if let sender = sender as? UIButton {
            if sender == mingChengBianGeng {
                if mingChengBianGeng.selected == false {
                    mingChengBianGeng.selected = true
                    //                    jingYingShiJianBianGeng.enabled = false
                    //                    jingYingFangShiBianGeng.enabled = false
                    //                    changQuanXingZhiBianGeng.enabled = false
                } else {
                    mingChengBianGeng.selected = false
                    //                    jingYingShiJianBianGeng.enabled = true
                    //                    jingYingFangShiBianGeng.enabled = true
                    //                    changQuanXingZhiBianGeng.enabled = true
                }
            }
        }
        if let sender = sender as? UIButton {
            if sender == jingYingShiJianBianGeng {
                if jingYingShiJianBianGeng.selected == false {
                    jingYingShiJianBianGeng.selected = true
                    //                    mingChengBianGeng.enabled = false
                    //                    jingYingFangShiBianGeng.enabled = false
                    //                    changQuanXingZhiBianGeng.enabled = false
                } else {
                    jingYingShiJianBianGeng.selected = false
                    //                    mingChengBianGeng.enabled = true
                    //                    jingYingFangShiBianGeng.enabled = true
                    //                    changQuanXingZhiBianGeng.enabled = true
                }
            }
        }
        if let sender = sender as? UIButton {
            if sender == jingYingFangShiBianGeng {
                if jingYingFangShiBianGeng.selected == false {
                    jingYingFangShiBianGeng.selected = true
                    //                    mingChengBianGeng.enabled = false
                    //                    jingYingShiJianBianGeng.enabled = false
                    //                    changQuanXingZhiBianGeng.enabled = false
                } else {
                    jingYingFangShiBianGeng.selected = false
                    //                    mingChengBianGeng.enabled = true
                    //                    jingYingShiJianBianGeng.enabled = true
                    //                    changQuanXingZhiBianGeng.enabled = true
                }
            }
        }
        if let sender = sender as? UIButton {
            if sender == changQuanXingZhiBianGeng {
                if changQuanXingZhiBianGeng.selected == false {
                    changQuanXingZhiBianGeng.selected = true
                    //                    mingChengBianGeng.enabled = false
                    //                    jingYingFangShiBianGeng.enabled = false
                    //                    jingYingFangShiBianGeng.enabled = false
                } else {
                    changQuanXingZhiBianGeng.selected = false
                    //                    mingChengBianGeng.enabled = true
                    //                    jingYingFangShiBianGeng.enabled = true
                    //                    jingYingFangShiBianGeng.enabled = true
                }
            }
        }
    }
    
    @IBOutlet weak var chooseJingYingFangShiBianGengQian: UILabel!
    @IBOutlet weak var chooseFangWuChangQuanBianGengQian: UILabel!
    
    @IBOutlet weak var chooseJIngYingFangShi: UILabel!
    @IBOutlet weak var chooseSuoZaiDiDian: UILabel!
    @IBOutlet weak var chooseFangWuChangQuan: UILabel!
    
    @IBOutlet weak var chooseJIngYingFangShi1: UILabel!
    @IBOutlet weak var chooseSuoZaiDiDian1: UILabel!
    @IBOutlet weak var chooseFangWuChangQuan1: UILabel!
    
    @IBOutlet weak var chooseJIngYingFangShi2: UILabel!
    @IBOutlet weak var chooseSuoZaiDiDian2: UILabel!
    @IBOutlet weak var chooseFangWuChangQuan2: UILabel!
    
    var tapedLabel = 0
    @IBAction func printActionSheet(sender: AnyObject) {
        if (sender as? UIGestureRecognizer != nil) {
            if sender.view == chooseJIngYingFangShi {
                let actionSheet = UIActionSheet(title: "选择经营方式", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自办", "委办")
                actionSheet.showInView(self.view)
                tapedLabel = 1
            }
            
            if sender.view == chooseSuoZaiDiDian {
                let actionSheet = UIActionSheet(title: "选择所在地点", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "城市地区","乡镇地区","农村地区")
                actionSheet.showInView(self.view)
                tapedLabel = 2
            }
            
            if sender.view == chooseFangWuChangQuan{
                let actionSheet = UIActionSheet(title: "选择房屋产权", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自有","租用","无偿使用","其他")
                actionSheet.showInView(self.view)
                tapedLabel = 3
            }
            
            if sender.view == chooseJingYingFangShiBianGengQian{
                let actionSheet = UIActionSheet(title: "选择经营方式", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自办","委办")
                actionSheet.showInView(self.view)
                tapedLabel = 4
            }
            
            if sender.view == chooseFangWuChangQuanBianGengQian{
                let actionSheet = UIActionSheet(title: "选择房屋产权", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自有","租用","无偿使用","其他")
                actionSheet.showInView(self.view)
                tapedLabel = 5
            }
        }
    }
    
    var tapedLabel1 = 0
    @IBAction func printActionSheet1(sender: AnyObject) {
        if (sender as? UIGestureRecognizer != nil) {
            if sender.view == chooseJIngYingFangShi1 {
                let actionSheet = UIActionSheet(title: "选择经营方式", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自办", "委办")
                actionSheet.showInView(self.view)
                tapedLabel1 = 1
            }
            
            if sender.view == chooseSuoZaiDiDian1 {
                let actionSheet = UIActionSheet(title: "选择所在地点", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "城市地区","乡镇地区","农村地区")
                actionSheet.showInView(self.view)
                tapedLabel1 = 2
            }
            
            if sender.view == chooseFangWuChangQuan1{
                let actionSheet = UIActionSheet(title: "选择房屋产权", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自有","租用","无偿使用","其他")
                actionSheet.showInView(self.view)
                tapedLabel1 = 3
            }
        }
    }
    
    var tapedLabel2 = 0
    @IBAction func printActionSheet2(sender: AnyObject) {
        if (sender as? UIGestureRecognizer != nil) {
            if sender.view == chooseJIngYingFangShi2 {
                let actionSheet = UIActionSheet(title: "选择经营方式", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自办", "委办")
                actionSheet.showInView(self.view)
                tapedLabel2 = 1
            }
            
            if sender.view == chooseSuoZaiDiDian2 {
                let actionSheet = UIActionSheet(title: "选择所在地点", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "城市地区","乡镇地区","农村地区")
                actionSheet.showInView(self.view)
                tapedLabel2 = 2
            }
            
            if sender.view == chooseFangWuChangQuan2{
                let actionSheet = UIActionSheet(title: "选择房屋产权", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自有","租用","无偿使用","其他")
                actionSheet.showInView(self.view)
                tapedLabel2 = 3
            }
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if actionSheet.buttonTitleAtIndex(buttonIndex) != "取消"{
            if  tapedLabel == 1 {
                chooseJIngYingFangShi.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseJIngYingFangShi.textColor = UIColor.blackColor()
            }
            if  tapedLabel1 == 1 {
                chooseJIngYingFangShi1.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseJIngYingFangShi1.textColor = UIColor.blackColor()
            }
            if  tapedLabel2 == 1 {
                chooseJIngYingFangShi2.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseJIngYingFangShi2.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 2 {
                chooseSuoZaiDiDian.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseSuoZaiDiDian.textColor = UIColor.blackColor()
            }
            if tapedLabel1 == 2 {
                chooseSuoZaiDiDian1.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseSuoZaiDiDian1.textColor = UIColor.blackColor()
            }
            if tapedLabel2 == 2 {
                chooseSuoZaiDiDian2.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseSuoZaiDiDian2.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 3{
                chooseFangWuChangQuan.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseFangWuChangQuan.textColor = UIColor.blackColor()
            }
            if tapedLabel1 == 3{
                chooseFangWuChangQuan1.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseFangWuChangQuan1.textColor = UIColor.blackColor()
            }
            if tapedLabel2 == 3{
                chooseFangWuChangQuan2.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseFangWuChangQuan2.textColor = UIColor.blackColor()
            }
            if tapedLabel == 4{
                chooseJingYingFangShiBianGengQian.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseJingYingFangShiBianGengQian.textColor = UIColor.blackColor()
            }
            if tapedLabel == 5{
                chooseFangWuChangQuanBianGengQian.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseFangWuChangQuanBianGengQian.textColor = UIColor.blackColor()
            }
        }
    }
    
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
    
    @IBOutlet weak var XinJian1: UIButton!
    @IBOutlet weak var WuLiu1: UIButton!
    @IBOutlet weak var JiYou1: UIButton!
    @IBOutlet weak var BaoGuo1: UIButton!
    @IBOutlet weak var YinShuaPin1: UIButton!
    @IBOutlet weak var BaoKanLingShou1: UIButton!
    @IBOutlet weak var YouZhengChuXu1: UIButton!
    @IBOutlet weak var MangRenDuWu1: UIButton!
    @IBOutlet weak var TeKuaiZhuangDi1: UIButton!
    @IBOutlet weak var BaoKanDingYue1: UIButton!
    @IBOutlet weak var YouZhengHuiDui1: UIButton!
    @IBOutlet weak var YIWuBingXinHan1: UIButton!
    @IBOutlet weak var LieShiBaoGuo1: UIButton!
    @IBOutlet weak var QiTa1: UIButton!
    
    @IBAction func touchInsideBtm1(sender: AnyObject) {
        
        if let sender = sender as? UIButton {
            if sender == XinJian1 {
                if XinJian1.selected == false {
                    XinJian1.selected = true
                } else {
                    XinJian1.selected = false
                }
            }
            
            if sender == WuLiu1 {
                if WuLiu1.selected == false {
                    WuLiu1.selected = true
                } else {
                    WuLiu1.selected = false
                }
                
            }
            if sender == JiYou1 {
                if JiYou1.selected == false {
                    JiYou1.selected = true
                } else {
                    JiYou1.selected = false
                }
                
            }
            if sender == BaoGuo1 {
                if BaoGuo1.selected == false {
                    BaoGuo1.selected = true
                } else {
                    BaoGuo1.selected = false
                }
                
            }
            if sender == YinShuaPin1 {
                if YinShuaPin1.selected == false {
                    YinShuaPin1.selected = true
                } else {
                    YinShuaPin1.selected = false
                }
            }
            if sender == BaoKanLingShou1 {
                if BaoKanLingShou1.selected == false {
                    BaoKanLingShou1.selected = true
                } else {
                    BaoKanLingShou1.selected = false
                }
                
            }
            if sender == YouZhengChuXu1 {
                if YouZhengChuXu1.selected == false {
                    YouZhengChuXu1.selected = true
                } else {
                    YouZhengChuXu1.selected = false
                }
                
            }
            if sender == MangRenDuWu1 {
                if MangRenDuWu1.selected == false {
                    MangRenDuWu1.selected = true
                } else {
                    MangRenDuWu1.selected = false
                }
                
            }
            if sender == TeKuaiZhuangDi1 {
                if TeKuaiZhuangDi1.selected == false {
                    TeKuaiZhuangDi1.selected = true
                } else {
                    TeKuaiZhuangDi1.selected = false
                }
                
            }
            if sender == BaoKanDingYue1 {
                if BaoKanDingYue1.selected == false {
                    BaoKanDingYue1.selected = true
                } else {
                    BaoKanDingYue1.selected = false
                }
                
            }
            if sender == YouZhengHuiDui1 {
                if YouZhengHuiDui1.selected == false {
                    YouZhengHuiDui1.selected = true
                } else {
                    YouZhengHuiDui1.selected = false
                }
                
            }
            if sender == YIWuBingXinHan1 {
                if YIWuBingXinHan1.selected == false {
                    YIWuBingXinHan1.selected = true
                } else {
                    YIWuBingXinHan1.selected = false
                }
                
            }
            if sender == LieShiBaoGuo1 {
                if LieShiBaoGuo1.selected == false {
                    LieShiBaoGuo1.selected = true
                } else {
                    LieShiBaoGuo1.selected = false
                }
                
            }
            if sender == QiTa1 {
                if QiTa1.selected == false {
                    QiTa1.selected = true
                } else {
                    QiTa1.selected = false
                }
            }
        }
    }
    
    @IBOutlet weak var XinJian2: UIButton!
    @IBOutlet weak var WuLiu2: UIButton!
    @IBOutlet weak var JiYou2: UIButton!
    @IBOutlet weak var BaoGuo2: UIButton!
    @IBOutlet weak var YinShuaPin2: UIButton!
    @IBOutlet weak var BaoKanLingShou2: UIButton!
    @IBOutlet weak var YouZhengChuXu2: UIButton!
    @IBOutlet weak var MangRenDuWu2: UIButton!
    @IBOutlet weak var TeKuaiZhuangDi2: UIButton!
    @IBOutlet weak var BaoKanDingYue2: UIButton!
    @IBOutlet weak var YouZhengHuiDui2: UIButton!
    @IBOutlet weak var YIWuBingXinHan2: UIButton!
    @IBOutlet weak var LieShiBaoGuo2: UIButton!
    @IBOutlet weak var QiTa2: UIButton!
    
    @IBAction func touchInsideBtm2(sender: AnyObject) {
        
        if let sender = sender as? UIButton {
            if sender == XinJian2 {
                if XinJian2.selected == false {
                    XinJian2.selected = true
                } else {
                    XinJian2.selected = false
                }
            }
            
            if sender == WuLiu2 {
                if WuLiu2.selected == false {
                    WuLiu2.selected = true
                } else {
                    WuLiu2.selected = false
                }
                
            }
            if sender == JiYou2 {
                if JiYou2.selected == false {
                    JiYou2.selected = true
                } else {
                    JiYou2.selected = false
                }
                
            }
            if sender == BaoGuo2 {
                if BaoGuo2.selected == false {
                    BaoGuo2.selected = true
                } else {
                    BaoGuo2.selected = false
                }
                
            }
            if sender == YinShuaPin2 {
                if YinShuaPin2.selected == false {
                    YinShuaPin2.selected = true
                } else {
                    YinShuaPin2.selected = false
                }
            }
            if sender == BaoKanLingShou2 {
                if BaoKanLingShou2.selected == false {
                    BaoKanLingShou2.selected = true
                } else {
                    BaoKanLingShou2.selected = false
                }
                
            }
            if sender == YouZhengChuXu2 {
                if YouZhengChuXu2.selected == false {
                    YouZhengChuXu2.selected = true
                } else {
                    YouZhengChuXu2.selected = false
                }
                
            }
            if sender == MangRenDuWu2 {
                if MangRenDuWu2.selected == false {
                    MangRenDuWu2.selected = true
                } else {
                    MangRenDuWu2.selected = false
                }
                
            }
            if sender == TeKuaiZhuangDi2 {
                if TeKuaiZhuangDi2.selected == false {
                    TeKuaiZhuangDi2.selected = true
                } else {
                    TeKuaiZhuangDi2.selected = false
                }
                
            }
            if sender == BaoKanDingYue2 {
                if BaoKanDingYue2.selected == false {
                    BaoKanDingYue2.selected = true
                } else {
                    BaoKanDingYue2.selected = false
                }
                
            }
            if sender == YouZhengHuiDui2 {
                if YouZhengHuiDui2.selected == false {
                    YouZhengHuiDui2.selected = true
                } else {
                    YouZhengHuiDui2.selected = false
                }
                
            }
            if sender == YIWuBingXinHan2 {
                if YIWuBingXinHan2.selected == false {
                    YIWuBingXinHan2.selected = true
                } else {
                    YIWuBingXinHan2.selected = false
                }
                
            }
            if sender == LieShiBaoGuo2 {
                if LieShiBaoGuo2.selected == false {
                    LieShiBaoGuo2.selected = true
                } else {
                    LieShiBaoGuo2.selected = false
                }
                
            }
            if sender == QiTa2 {
                if QiTa2.selected == false {
                    QiTa2.selected = true
                } else {
                    QiTa2.selected = false
                }
            }
        }
    }
    
    
    // 邮政营业场所备案信息变更登记表 TextField
    //变更前
    @IBOutlet weak var changSuoMingChengBianGengQian: UITextField!
    @IBOutlet weak var dengJiBianHaoBianGengQian: UITextField!
    @IBOutlet weak var bgqCangSuoDiZhiShi: UITextField!
    @IBOutlet weak var bgqCangSuoDiZhiXian: UITextField!
    @IBOutlet weak var bgqCangSuoDiZhiJie: UITextField!
    @IBOutlet weak var bgqCangSuoDiZhiHao: UITextField!
    @IBOutlet weak var bgqCangSuoDiZhiJingDu: UITextField!
    @IBOutlet weak var bgqCangSuoDiZhiWeiDu: UITextField!
    @IBOutlet weak var bgqShangJiDanWei: UITextField!
    @IBOutlet weak var bgqYouZhengBianMa: UITextField!
    @IBOutlet weak var bgqKaiYeShiJian: UITextField!
    @IBOutlet weak var bgqJianZhuMianJi: UITextField!
    
    @IBOutlet weak var bgqYingYeShiJianZhouJi: UITextField!
    @IBOutlet weak var bgqYingYeShiJianZhiZhouJi: UITextField!
    @IBOutlet weak var bgqYingYeShiJianJiDian: UITextField!
    @IBOutlet weak var bgqYingYeShiJianZhiJiDian: UITextField!
    
    @IBOutlet weak var bgqKaiXiangPinCi: UITextField!
    @IBOutlet weak var bgqZhouTouDiPinCi: UITextField!
    @IBOutlet weak var bgqRiTouDiPinCi: UITextField!
    
    //变更后
    @IBOutlet weak var bghChangSuoMingCheng: UITextField!
    @IBOutlet weak var bghChangSuoMingChengBianGengYuanYin: UITextField!
    
    @IBOutlet weak var bghYingYeShiJianZhouJi: UITextField!
    @IBOutlet weak var bghYingYeShiJianZhiZhouJi: UITextField!
    @IBOutlet weak var bghYingYeShiJianJiDian: UITextField!
    @IBOutlet weak var bghYingYeShiJianZhiJiDian: UITextField!
    @IBOutlet weak var bghYingYeShiJianBianGengYuanYin: UITextField!
    
    @IBOutlet weak var bghJingYingFangShiBianGengYuanYin: UITextField!
    
    @IBOutlet weak var bghFangWuChanQuanBianGengYuanYin: UITextField!
    
    @IBOutlet weak var bghChangSuoDiZhi: UITextField!
    @IBOutlet weak var bghChangSuoDiZhiBianGengYuanYin: UITextField!
    
    
    //邮政普遍服务营业场所就近迁址登记表
    //迁址前
    @IBOutlet weak var qzqChangSuoMingCheng: UITextField!
    @IBOutlet weak var qzqDengJiBianHao: UITextField!
    
    @IBOutlet weak var qzqChangSuoDiZhiShi: UITextField!
    @IBOutlet weak var qzqChangSuoDiZhiXian: UITextField!
    @IBOutlet weak var qzqChangSuoDiZhiJie: UITextField!
    @IBOutlet weak var qzqChangSuoDiZhiHao: UITextField!
    
    @IBOutlet weak var qzqShangJiDanWei: UITextField!
    @IBOutlet weak var qzqYouZhengBianMa: UITextField!
    @IBOutlet weak var qzqKaiYeShiJian: UITextField!
    @IBOutlet weak var qzqJianZhuMianJi: UITextField!
    
    @IBOutlet weak var qzqYingYeShiJianZhouJi: UITextField!
    @IBOutlet weak var qzqYingYeShiJianZhiZhouJi: UITextField!
    @IBOutlet weak var qzqYingYeShiJianJiDian: UITextField!
    @IBOutlet weak var qzqYingYeShiJianZhiJiDian: UITextField!
    
    @IBOutlet weak var qzqKaiXiangPinCi: UITextField!
    @IBOutlet weak var qzqZhouTouDiPinCi: UITextField!
    @IBOutlet weak var qzqRiTouDiPinCi: UITextField!
    
    @IBOutlet weak var qzqQianZhiYuanYin: UITextField!
    
    //迁址后
    @IBOutlet weak var qzhChangSuoDiZhiShi: UITextField!
    @IBOutlet weak var qzhChangSuoDiZhiXian: UITextField!
    @IBOutlet weak var qzhChangSuoDiZhiJie: UITextField!
    @IBOutlet weak var qzhChangSuoDiZhiHao: UITextField!
    @IBOutlet weak var qzhYuYuanZhiZhiXianJuLi: UITextField!
    
    @IBOutlet weak var qzhyouZhengBianMa: UITextField!
    @IBOutlet weak var qzhKaiYeShiJian: UITextField!
    @IBOutlet weak var qzhJianZhuMianJi: UITextField!
    
    @IBOutlet weak var qzhYingYeShiJianZhouJi: UITextField!
    @IBOutlet weak var qzhYingYeShiJianZhiZhouJi: UITextField!
    @IBOutlet weak var qzhYingYeShiJianJiDian: UITextField!
    @IBOutlet weak var qzhYingYeShiJianZhiJiDian: UITextField!
    
    @IBOutlet weak var qzhKaiXiangPinCi: UITextField!
    @IBOutlet weak var qzhZhouTouDiPinCi: UITextField!
    @IBOutlet weak var qzhRiTouDiPinCi: UITextField!
    
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
    
    
    //变更Commit
    @IBAction func commit(sender: AnyObject) {
        var COMMIT_OK = 0
        
        //变更前
        let infoOfYzqyyzyycsbaxxbgdjb = InfoOfYzqyyzyycsbaxxbgdjb()
        
        var bianGengShiXiangForEdit = ""
        if ((mingChengBianGeng.selected || jingYingShiJianBianGeng.selected || jingYingFangShiBianGeng.selected || changQuanXingZhiBianGeng.selected) == false)
        {
            let alertView = UIAlertView(title: "须选择变更事项", message:  "变更事项不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            if mingChengBianGeng.selected {
                infoOfYzqyyzyycsbaxxbgdjb.bgsx += ",mcbg"
                bianGengShiXiangForEdit += ",mcbg"
            }
            if jingYingShiJianBianGeng.selected {
                infoOfYzqyyzyycsbaxxbgdjb.bgsx += ",yysjbg"
                bianGengShiXiangForEdit += ",yysjbg"
            }
            if  jingYingFangShiBianGeng.selected {
                infoOfYzqyyzyycsbaxxbgdjb.bgsx += ",jyfsbg"
                bianGengShiXiangForEdit += ",jyfsbg"
            }
            if  changQuanXingZhiBianGeng.selected {
                infoOfYzqyyzyycsbaxxbgdjb.bgsx += ",cqxzbg"
                bianGengShiXiangForEdit += ",cqxzbg"
            }
        }
        
        if changSuoMingChengBianGengQian.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csmc_bgq = changSuoMingChengBianGengQian.text
        } else if (changSuoMingChengBianGengQian.text == "")
        {
            
            changSuoMingChengBianGengQian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
//        if dengJiBianHaoBianGengQian.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.djbh_bgq = dengJiBianHaoBianGengQian.text
//        } else if (dengJiBianHaoBianGengQian.text == "")
//        {
//            
//            dengJiBianHaoBianGengQian.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
        if bgqCangSuoDiZhiShi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csdz_bgq_s = bgqCangSuoDiZhiShi.text
        } else if (bgqCangSuoDiZhiShi.text == "")
        {
            
            bgqCangSuoDiZhiShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bgqCangSuoDiZhiXian.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csdz_bgq_xqs = bgqCangSuoDiZhiXian.text
        } else if (bgqCangSuoDiZhiXian.text == "")
        {
            
            bgqCangSuoDiZhiXian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bgqCangSuoDiZhiJie.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csdz_bgq_jx = bgqCangSuoDiZhiJie.text
        } else if (bgqCangSuoDiZhiJie.text == "")
        {
            
            bgqCangSuoDiZhiJie.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bgqCangSuoDiZhiHao.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csdz_bgq_h = bgqCangSuoDiZhiHao.text
        } else if (bgqCangSuoDiZhiHao.text == "")
        {
            
            bgqCangSuoDiZhiHao.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchJingDu = rxJingWeiDu.isMatch(bgqCangSuoDiZhiJingDu.text)
        if isMatchJingDu {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csdz_bgq_jd = bgqCangSuoDiZhiJingDu.text
        } else {
            let alertView = UIAlertView(title: "经度不符合要求", message:  "经度最大值:27.366667 最小值:26.183333", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
            //            let label = UILabel(frame: CGRect(x: jingDu.frame.origin.x, y: jingDu.frame.origin.y + 40, width: 100, height: 100))
            //            label.backgroundColor = UIColor.blueColor()
            
            print("经度不符合要求")
            bgqCangSuoDiZhiJingDu.attributedPlaceholder = NSAttributedString(string: "不符要求"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchWeiDu = rxJingWeiDu.isMatch(bgqCangSuoDiZhiWeiDu.text)
        if isMatchWeiDu {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csdz_bgq_wd = bgqCangSuoDiZhiWeiDu.text
        } else {
            
            let alertView = UIAlertView(title: "纬度不符合要求", message:  "纬度最大值:107.283333 最小值:106.116667", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
            
            print("纬度不符合要求")
            bgqCangSuoDiZhiWeiDu.attributedPlaceholder = NSAttributedString(string: "不符要求"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if bgqShangJiDanWei.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.sjdw_bgq = bgqShangJiDanWei.text
        } else if (bgqShangJiDanWei.text == "")
        {
            
            bgqShangJiDanWei.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        //infoOfYzqyyzyycsbaxxbgdjb.jyfs_bgq = chooseJingYingFangShiBianGengQian.text
        
        if  chooseJingYingFangShiBianGengQian.text == "未选择" {
            chooseJingYingFangShiBianGengQian.textColor = UIColor.redColor()
        } else {
            COMMIT_OK += 1
            if (chooseJingYingFangShiBianGengQian.text == "自办")  {
                infoOfYzqyyzyycsbaxxbgdjb.jyfs_bgq = "zb"
            }
            if(chooseJingYingFangShiBianGengQian.text == "委办") {
                infoOfYzqyyzyycsbaxxbgdjb.jyfs_bgq = "wb"
            }
        }
        
        let isMatchYouBian = rxYouBian.isMatch(bgqYouZhengBianMa.text)
        if isMatchYouBian {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.yzbm_bgq  = bgqYouZhengBianMa.text
        } else {
            
            print("邮政编码不符合要求")
            //            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            bgqYouZhengBianMa.text = "不符要求"
            bgqYouZhengBianMa.textColor = UIColor.redColor()
        }
        
        
        
        //infoOfYzqyyzyycsbaxxbgdjb.szdy_bgq = chooseSuoZaiDiDian.text
        if  chooseSuoZaiDiDian.text == "未选择" {
            chooseSuoZaiDiDian.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            
            if (chooseSuoZaiDiDian.text == "城市地区")  {
                infoOfYzqyyzyycsbaxxbgdjb.szdy_bgq = "csdq"
            }
            if(chooseSuoZaiDiDian.text == "乡镇地区") {
                infoOfYzqyyzyycsbaxxbgdjb.szdy_bgq = "xzdq"
            }
            if(chooseSuoZaiDiDian.text == "农村地区") {
                infoOfYzqyyzyycsbaxxbgdjb.szdy_bgq = "ncdq"
            }
        }
        
        if bgqKaiYeShiJian.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.kysj_bgq = bgqKaiYeShiJian.text
        } else if (bgqKaiYeShiJian.text == "")
        {
            
            bgqKaiYeShiJian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        //infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgq = chooseFangWuChangQuanBianGengQian.text
        if  chooseFangWuChangQuanBianGengQian.text == "未选择" {
            chooseFangWuChangQuanBianGengQian.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            
            if (chooseFangWuChangQuanBianGengQian.text == "自有")  {
                infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgq = "ziy"
            }
            if(chooseFangWuChangQuanBianGengQian.text == "租用") {
                infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgq = "zuy"
            }
            if (chooseFangWuChangQuanBianGengQian.text == "无偿使用")  {
                infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgq = "wucsy"
            }
            if(chooseFangWuChangQuanBianGengQian.text == "其他") {
                infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgq = "qt"
            }
        }
        
        let isMatchJianZhuMianJi = rxJianZhuMianJi.isMatch(bgqJianZhuMianJi.text)
        if isMatchJianZhuMianJi {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.jzmj_bgq = bgqJianZhuMianJi.text
        } else {
            
            print("建筑面积不符合要求")
            //            jianZhuMianJi.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            bgqJianZhuMianJi.text = "不符要求"
            bgqJianZhuMianJi.textColor = UIColor.redColor()
        }
        
        if bgqYingYeShiJianZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.zyyr_bgq_ks = bgqYingYeShiJianZhouJi.text
        } else if (bgqYingYeShiJianZhouJi.text == "")
        {
            
            bgqYingYeShiJianZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bgqYingYeShiJianZhiZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.zyyr_bgq_js = bgqYingYeShiJianZhiZhouJi.text
        } else if (bgqYingYeShiJianZhiZhouJi.text == "")
        {
            
            bgqYingYeShiJianZhiZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if bgqYingYeShiJianJiDian.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.ryysj_bgq_ks = bgqYingYeShiJianJiDian.text
        } else if (bgqYingYeShiJianJiDian.text == "")
        {
            
            bgqYingYeShiJianJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bgqYingYeShiJianZhiJiDian.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.ryysj_bgq_js = bgqYingYeShiJianZhiJiDian.text
        } else if (bgqYingYeShiJianZhiJiDian.text == "")
        {
            
            bgqYingYeShiJianZhiJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bgqKaiXiangPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.kxpc_bgq = bgqKaiXiangPinCi.text
        } else if (bgqKaiXiangPinCi.text == "")
        {
            
            bgqKaiXiangPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bgqRiTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.rtdpc_bgq = bgqRiTouDiPinCi.text
        } else if (bgqRiTouDiPinCi.text == "")
        {
            
            bgqRiTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bgqZhouTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.ztdpc_bgq = bgqZhouTouDiPinCi.text
        } else if (bgqZhouTouDiPinCi.text == "")
        {
            
            bgqZhouTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        var stringForEdit = ""
        if ((XinJian.selected || WuLiu.selected || JiYou.selected || BaoGuo.selected || YinShuaPin.selected || BaoKanLingShou.selected || YouZhengChuXu.selected || MangRenDuWu.selected || TeKuaiZhuangDi.selected || BaoKanDingYue.selected || YouZhengHuiDui.selected || YIWuBingXinHan.selected || LieShiBaoGuo.selected || QiTa.selected) == false)
        {
            
            let alertView = UIAlertView(title: "须选择业务范围", message:  "业务范围不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            
            if XinJian.selected {
                if infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq == "" {
                    infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += "xj"
                    stringForEdit += "xj"
                } else {
                    infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",xj"
                    stringForEdit += ",xj"
                }
            }
            if WuLiu.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",wl"
                stringForEdit += ",wl"
            }
            if JiYou.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",jy"
                stringForEdit += ",jy"
            }
            if BaoGuo.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",bgs"
                stringForEdit += ",bgs"
            }
            if YinShuaPin.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",ysp"
                stringForEdit += ",ysp"
            }
            if BaoKanLingShou.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",bkls"
                stringForEdit += ",bkls"
            }
            if YouZhengChuXu.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",yzcx"
                stringForEdit += ",yzcx"
            }
            if MangRenDuWu.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",mrdw"
                stringForEdit += ",mrdw"
            }
            if TeKuaiZhuangDi.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",tkzd"
                stringForEdit += ",tkzd"
            }
            if BaoKanDingYue.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",bkdy"
                stringForEdit += ",bkdy"
            }
            if YouZhengHuiDui.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",yzhd"
                stringForEdit += ",yzhd"
            }
            if YIWuBingXinHan.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",ywbxh"
                stringForEdit += ",ywbxh"
            }
            if LieShiBaoGuo.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",lsywbg"
                stringForEdit += ",lsywbg"
            }
            if QiTa.selected {
                infoOfYzqyyzyycsbaxxbgdjb.ywfw_bgq += ",qt"
                stringForEdit += ",qt"
            }
        }
        
        //变更后
//        if bghChangSuoMingCheng.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csmc_bgh = bghChangSuoMingCheng.text
//        } else if (bghChangSuoMingCheng.text == "")
//        {
//            
//            bghChangSuoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
//        if bghChangSuoMingChengBianGengYuanYin.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.bgyy_bghcsmc = bghChangSuoMingChengBianGengYuanYin.text
//        } else if (bghChangSuoMingChengBianGengYuanYin.text == "")
//        {
//            
//            bghChangSuoMingChengBianGengYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
//        if bghYingYeShiJianZhouJi.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.zyyr_bgh_ks = bghYingYeShiJianZhouJi.text
//        } else if (bghYingYeShiJianZhouJi.text == "")
//        {
//            
//            bghYingYeShiJianZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
//        if bghYingYeShiJianZhiZhouJi.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.zyyr_bgh_js = bghYingYeShiJianZhiZhouJi.text
//        } else if (bghYingYeShiJianZhiZhouJi.text == "")
//        {
//            
//            bghYingYeShiJianZhiZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
//        if bghYingYeShiJianJiDian.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.ryysj_bgh_ks = bghYingYeShiJianJiDian.text
//        } else if (bghYingYeShiJianJiDian.text == "")
//        {
//            
//            bghYingYeShiJianJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
//        if bghYingYeShiJianZhiJiDian.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.ryysj_bgh_js = bghYingYeShiJianZhiJiDian.text
//        } else if (bghYingYeShiJianZhiJiDian.text == "")
//        {
//            
//            bghYingYeShiJianZhiJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
//        
//        if bghYingYeShiJianBianGengYuanYin.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.bgyy_bghyysj = bghYingYeShiJianBianGengYuanYin.text
//        } else if (bghYingYeShiJianBianGengYuanYin.text == "")
//        {
//            
//            bghYingYeShiJianBianGengYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
        
        //infoOfYzqyyzyycsbaxxbgdjb.jyfs_bgh = chooseJIngYingFangShi.text
//        if  chooseJIngYingFangShi.text == "未选择" {
//            chooseJIngYingFangShi.textColor = UIColor.redColor()
//        } else {
//            
//            COMMIT_OK += 1
            if (chooseJIngYingFangShi.text == "自办")  {
                infoOfYzqyyzyycsbaxxbgdjb.jyfs_bgh = "zb"
            }
            if(chooseJIngYingFangShi.text == "委办") {
                infoOfYzqyyzyycsbaxxbgdjb.jyfs_bgh = "wb"
            }
//        }
        
//        if bghJingYingFangShiBianGengYuanYin.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.bgyy_bghjyfs = bghJingYingFangShiBianGengYuanYin.text
//        } else if (bghJingYingFangShiBianGengYuanYin.text == "")
//        {
//            
//            bghJingYingFangShiBianGengYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
        
        //infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgh = chooseFangWuChangQuan.text
//        if  chooseFangWuChangQuan.text == "未选择" {
//            chooseFangWuChangQuan.textColor = UIColor.redColor()
//        } else {
//            
//            COMMIT_OK += 1
            if (chooseFangWuChangQuan.text == "自有")  {
                infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgh = "ziy"
            }
            if(chooseFangWuChangQuan.text == "租用") {
                infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgh = "zuy"
            }
            if (chooseFangWuChangQuan.text == "无偿使用")  {
                infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgh = "wucsy"
            }
            if(chooseFangWuChangQuan.text == "其他") {
                infoOfYzqyyzyycsbaxxbgdjb.fwcq_bgh = "qt"
            }
//        }
        
//        if bghFangWuChanQuanBianGengYuanYin.text != "" {
//            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.bgyy_bghfwcq = bghFangWuChanQuanBianGengYuanYin.text
//        } else if (bghFangWuChanQuanBianGengYuanYin.text == "")
//        {
//            
//            bghFangWuChanQuanBianGengYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
        if bghChangSuoDiZhi.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.csdz_bgh = bghChangSuoDiZhi.text
        } else if (bghChangSuoDiZhi.text == "")
        {
            
            bghChangSuoDiZhi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if bghChangSuoDiZhiBianGengYuanYin.text != "" {
            COMMIT_OK += 1
            infoOfYzqyyzyycsbaxxbgdjb.bgyy_bghcsmc = bghChangSuoDiZhiBianGengYuanYin.text
        } else if (bghChangSuoDiZhiBianGengYuanYin.text == "")
        {
            
            bghChangSuoDiZhiBianGengYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        print("\(COMMIT_OK)", terminator: "\n")
        
        if (COMMIT_OK == 25) {
            if app.ServerData == 0 {
                app.network.addWithInterface("Baxxbg", andUser: app.userData, andInfo:  ClassToJSON.getObjectData(infoOfYzqyyzyycsbaxxbgdjb), andExtraInfo: nil)
     
            }
            
            if app.ServerData == 2 {
            
                app.applyChangeDic.setValue(bianGengShiXiangForEdit, forKey: "bgsx")
                app.applyChangeDic.setValue(changSuoMingChengBianGengQian.text, forKey: "csmc_bgq")
                app.applyChangeDic.setValue(dengJiBianHaoBianGengQian.text, forKey: "djbh_bgq")
                app.applyChangeDic.setValue(bgqCangSuoDiZhiShi.text, forKey: "csdz_bgq_s")
                app.applyChangeDic.setValue(bgqCangSuoDiZhiXian.text, forKey: "csdz_bgq_xqs")
                app.applyChangeDic.setValue(bgqCangSuoDiZhiJie.text, forKey: "csdz_bgq_jx")
                app.applyChangeDic.setValue(bgqCangSuoDiZhiHao.text, forKey: "csdz_bgq_h")
                app.applyChangeDic.setValue(bgqCangSuoDiZhiJingDu.text, forKey: "csdz_bgq_jd")
                app.applyChangeDic.setValue(bgqCangSuoDiZhiWeiDu.text, forKey: "csdz_bgq_wd")
                app.applyChangeDic.setValue(bgqShangJiDanWei.text, forKey: "sjdw_bgq")
                app.applyChangeDic.setValue(chooseJingYingFangShiBianGengQian.text, forKey: "jyfs_bgq")
                app.applyChangeDic.setValue(bgqYouZhengBianMa.text, forKey: "yzbm_bgq")
                app.applyChangeDic.setValue(chooseSuoZaiDiDian.text, forKey: "szdy_bgq")
                app.applyChangeDic.setValue(bgqKaiYeShiJian.text, forKey: "kysj_bgq")
                app.applyChangeDic.setValue(chooseFangWuChangQuanBianGengQian.text, forKey: "fwcq_bgq")
                app.applyChangeDic.setValue(bgqJianZhuMianJi.text, forKey: "jzmj_bgq")
                app.applyChangeDic.setValue(bgqYingYeShiJianZhouJi.text, forKey: "zyyr_bgq_ks")
                app.applyChangeDic.setValue(bgqYingYeShiJianZhiZhouJi.text, forKey: "zyyr_bgq_js")
                app.applyChangeDic.setValue(bgqYingYeShiJianJiDian.text, forKey: "ryysj_bgq_ks")
                app.applyChangeDic.setValue(bgqYingYeShiJianZhiJiDian.text, forKey: "ryysj_bgq_js")
                app.applyChangeDic.setValue(bgqKaiXiangPinCi.text, forKey: "kxpc_bgq")
                app.applyChangeDic.setValue(bgqRiTouDiPinCi.text, forKey: "rtdpc_bgq")
                app.applyChangeDic.setValue(bgqZhouTouDiPinCi.text, forKey: "ztdpc_bgq")
                app.applyChangeDic.setValue(stringForEdit, forKey: "ywfw_bgq")
                
                
                app.applyChangeDic.setValue(bghChangSuoMingCheng.text, forKey: "csmc_bgh")
                app.applyChangeDic.setValue(bghChangSuoMingChengBianGengYuanYin.text, forKey: "bgyy_bghcsmc")
                app.applyChangeDic.setValue(bghYingYeShiJianZhouJi.text, forKey: "zyyr_bgh_ks")
                app.applyChangeDic.setValue(bghYingYeShiJianZhiZhouJi.text, forKey: "zyyr_bgh_js")
                app.applyChangeDic.setValue(bghYingYeShiJianJiDian.text, forKey: "ryysj_bgh_ks")
                app.applyChangeDic.setValue(bghYingYeShiJianZhiJiDian.text, forKey: "ryysj_bgh_js")
                app.applyChangeDic.setValue(bghYingYeShiJianBianGengYuanYin.text, forKey: "bgyy_bghyysj")
                app.applyChangeDic.setValue(chooseJIngYingFangShi.text, forKey: "jyfs_bgh")
                app.applyChangeDic.setValue(bghJingYingFangShiBianGengYuanYin.text, forKey: "bgyy_bghjyfs")
                app.applyChangeDic.setValue(chooseFangWuChangQuan.text, forKey: "fwcq_bgh")
                app.applyChangeDic.setValue(bghFangWuChanQuanBianGengYuanYin.text, forKey: "bgyy_bghfwcq")
                app.applyChangeDic.setValue(bghChangSuoDiZhi.text, forKey: "csdz_bgh")
                app.applyChangeDic.setValue(bghChangSuoDiZhiBianGengYuanYin.text, forKey: "bgyy_bghcsmc")

                
                app.network.editWithInterface("Baxxbg", andInfo: app.applyChangeDic as [NSObject : AnyObject] , andExtraInfo: nil)
            }
        }
//        print("\(ClassToJSON.getObjectData(infoOfYzqyyzyycsbaxxbgdjb))")
    }
    
    //迁址Commit
    @IBAction func commit2(sender: AnyObject) {
        var COMMIT_OK = 0
        
        let infoOfYzpbfwyycsjjqzdjb = InfoOfYzpbfwyycsjjqzdjb()
        if qzqChangSuoMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csmc_qzq = qzqChangSuoMingCheng.text
        } else if (qzqChangSuoMingCheng.text == "")
        {
            
            qzqChangSuoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
//        if qzqDengJiBianHao.text != "" {
//            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.djbh_qzq = qzqDengJiBianHao.text
//        } else if (qzqDengJiBianHao.text == "")
//        {
//            
//            qzqDengJiBianHao.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
        if qzqChangSuoDiZhiShi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csdz_qzq_s = qzqChangSuoDiZhiShi.text
        } else if (qzqChangSuoDiZhiShi.text == "")
        {
            
            qzqChangSuoDiZhiShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqChangSuoDiZhiXian.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csdz_qzq_xqs = qzqChangSuoDiZhiXian.text
        } else if (qzqChangSuoDiZhiXian.text == "")
        {
            
            qzqChangSuoDiZhiXian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqChangSuoDiZhiJie.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csdz_qzq_jx = qzqChangSuoDiZhiJie.text
        } else if (qzqChangSuoDiZhiJie.text == "")
        {
            
            qzqChangSuoDiZhiJie.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqChangSuoDiZhiHao.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csdz_qzq_h = qzqChangSuoDiZhiHao.text
        } else if (qzqChangSuoDiZhiHao.text == "")
        {
            
            qzqChangSuoDiZhiHao.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqShangJiDanWei.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.sjdw_qzq = qzqShangJiDanWei.text
        } else if (qzqShangJiDanWei.text == "")
        {
            
            qzqShangJiDanWei.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchYouBian = rxYouBian.isMatch(qzqYouZhengBianMa.text)
        if isMatchYouBian {
            infoOfYzpbfwyycsjjqzdjb.yzbm_qzq = qzqYouZhengBianMa.text
        } else {
            
            print("邮政编码不符合要求")
            //            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            qzqYouZhengBianMa.text = "不符要求"
            qzqYouZhengBianMa.textColor = UIColor.redColor()
        }
        
        //infoOfYzpbfwyycsjjqzdjb.jyfs_qzq = chooseJIngYingFangShi1.text
        if  chooseJIngYingFangShi1.text == "未选择" {
            chooseJIngYingFangShi1.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseJIngYingFangShi1.text == "自办")  {
                infoOfYzpbfwyycsjjqzdjb.jyfs_qzq = "zb"
            }
            if(chooseJIngYingFangShi1.text == "委办") {
                infoOfYzpbfwyycsjjqzdjb.jyfs_qzq = "wb"
            }
        }
        
        //infoOfYzpbfwyycsjjqzdjb.fwcq_qzq = chooseFangWuChangQuan1.text
        if  chooseFangWuChangQuan1.text == "未选择" {
            chooseFangWuChangQuan1.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseFangWuChangQuan1.text == "自有")  {
                infoOfYzpbfwyycsjjqzdjb.fwcq_qzq = "ziy"
            }
            if(chooseFangWuChangQuan1.text == "租用") {
                infoOfYzpbfwyycsjjqzdjb.fwcq_qzq = "zuy"
            }
            if (chooseFangWuChangQuan1.text == "无偿使用")  {
                infoOfYzpbfwyycsjjqzdjb.fwcq_qzq = "wucsy"
            }
            if(chooseFangWuChangQuan1.text == "其他") {
                infoOfYzpbfwyycsjjqzdjb.fwcq_qzq = "qt"
            }
        }
        
        //infoOfYzpbfwyycsjjqzdjb.szdy_qzq = chooseSuoZaiDiDian1.text
        if  chooseSuoZaiDiDian1.text == "未选择" {
            chooseSuoZaiDiDian1.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseSuoZaiDiDian1.text == "城市地区")  {
                infoOfYzpbfwyycsjjqzdjb.szdy_qzq = "csdq"
            }
            if(chooseSuoZaiDiDian1.text == "乡镇地区") {
                infoOfYzpbfwyycsjjqzdjb.szdy_qzq = "xzdq"
            }
            if(chooseSuoZaiDiDian1.text == "农村地区") {
                infoOfYzpbfwyycsjjqzdjb.szdy_qzq = "ncdq"
            }
        }
        
        
        if qzqKaiYeShiJian.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.kysj_qzq = qzqKaiYeShiJian.text
        } else if (qzqKaiYeShiJian.text == "")
        {
            
            qzqKaiYeShiJian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchJianZhuMianJi = rxJianZhuMianJi.isMatch(qzqJianZhuMianJi.text)
        if isMatchJianZhuMianJi {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.jzmj_qzq = qzqJianZhuMianJi.text
        } else {
            
            print("建筑面积不符合要求")
            //            jianZhuMianJi.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            qzqJianZhuMianJi.text = "不符要求"
            qzqJianZhuMianJi.textColor = UIColor.redColor()
        }

        
        if qzqYingYeShiJianZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.zyyr_qzq_ks = qzqYingYeShiJianZhouJi.text
        } else if (qzqYingYeShiJianZhouJi.text == "")
        {
            
            qzqYingYeShiJianZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqYingYeShiJianZhiZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.zyyr_qzq_js = qzqYingYeShiJianZhiZhouJi.text
        } else if (qzqYingYeShiJianZhiZhouJi.text == "")
        {
            
            qzqYingYeShiJianZhiZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqYingYeShiJianJiDian.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.ryysj_qzq_ks = qzqYingYeShiJianJiDian.text
        } else if (qzqYingYeShiJianJiDian.text == "")
        {
            
            qzqYingYeShiJianJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqYingYeShiJianZhiJiDian.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.ryysj_qzq_js = qzqYingYeShiJianZhiJiDian.text
        } else if (qzqYingYeShiJianZhiJiDian.text == "")
        {
            
            qzqYingYeShiJianZhiJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqKaiXiangPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.kxpc_qzq = qzqKaiXiangPinCi.text
        } else if (qzqKaiXiangPinCi.text == "")
        {
            
            qzqKaiXiangPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqZhouTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.ztdpc_qzq = qzqZhouTouDiPinCi.text
        } else if (qzqZhouTouDiPinCi.text == "")
        {
            
            qzqZhouTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzqRiTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.rtdpc_qzq = qzqRiTouDiPinCi.text
        } else if (qzqRiTouDiPinCi.text == "")
        {
            
            qzqRiTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        var stringForEdit1 = ""
        if ((XinJian1.selected || WuLiu1.selected || JiYou1.selected || BaoGuo1.selected || YinShuaPin1.selected || BaoKanLingShou1.selected || YouZhengChuXu1.selected || MangRenDuWu1.selected || TeKuaiZhuangDi1.selected || BaoKanDingYue1.selected || YouZhengHuiDui1.selected || YIWuBingXinHan1.selected || LieShiBaoGuo1.selected || QiTa1.selected) == false)
        {
            
            let alertView = UIAlertView(title: "须选择业务范围", message:  "业务范围不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            if XinJian1.selected {
                if infoOfYzpbfwyycsjjqzdjb.ywfw_qzq == "" {
                    infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += "xj"
                    stringForEdit1 += "xj"
                } else {
                    infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",xj"
                    stringForEdit1 += ",xj"
                }
            }
            if WuLiu1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",wl"
                stringForEdit1 += ",wl"
            }
            if JiYou1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",jy"
                stringForEdit1 += ",jy"
            }
            if BaoGuo1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",bgs"
                stringForEdit1 += ",bgs"
            }
            if YinShuaPin1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",ysp"
                stringForEdit1 += ",ysp"
            }
            if BaoKanLingShou1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",bkls"
                stringForEdit1 += ",bkls"
            }
            if YouZhengChuXu1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",yzcx"
                stringForEdit1 += ",yzcx"
            }
            if MangRenDuWu1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",mrdw"
                stringForEdit1 += ",mrdw"
            }
            if TeKuaiZhuangDi1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",tkzd"
                stringForEdit1 += ",tkzd"
            }
            if BaoKanDingYue1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",bkdy"
                stringForEdit1 += ",bkdy"
            }
            if YouZhengHuiDui1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",yzhd"
                stringForEdit1 += ",yzhd"
            }
            if YIWuBingXinHan1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",ywbxh"
                stringForEdit1 += ",ywbxh"
            }
            if LieShiBaoGuo1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",lsywbg"
                stringForEdit1 += ",lsywbg"
            }
            if QiTa1.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzq += ",qt"
                stringForEdit1 += ",qt"
            }
        }
        
        if qzqQianZhiYuanYin.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.qzyy_qzq = qzqQianZhiYuanYin.text
        } else if (qzqQianZhiYuanYin.text == "")
        {
            
            qzqQianZhiYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        //迁址后
        if qzhChangSuoDiZhiShi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csdz_qzh_s = qzhChangSuoDiZhiShi.text
        } else if (qzhChangSuoDiZhiShi.text == "")
        {
            
            qzhChangSuoDiZhiShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhChangSuoDiZhiXian.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csdz_qzh_xqs = qzhChangSuoDiZhiXian.text
        } else if (qzhChangSuoDiZhiXian.text == "")
        {
            
            qzhChangSuoDiZhiXian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhChangSuoDiZhiJie.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csdz_qzh_jx = qzhChangSuoDiZhiJie.text
        } else if (qzhChangSuoDiZhiJie.text == "")
        {
            
            qzhChangSuoDiZhiJie.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhChangSuoDiZhiHao.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.csdz_qzh_h = qzhChangSuoDiZhiHao.text
        } else if (qzhChangSuoDiZhiHao.text == "")
        {
            
            qzhChangSuoDiZhiHao.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhYuYuanZhiZhiXianJuLi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.yyzzxjl_qzh = qzhYuYuanZhiZhiXianJuLi.text
        } else if (qzhYuYuanZhiZhiXianJuLi.text == "")
        {
            
            qzhYuYuanZhiZhiXianJuLi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        //infoOfYzpbfwyycsjjqzdjb.jyfs_qzh = chooseJIngYingFangShi2.text
        if  chooseJIngYingFangShi2.text == "未选择" {
            chooseJIngYingFangShi2.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseJIngYingFangShi2.text == "自办")  {
                infoOfYzpbfwyycsjjqzdjb.jyfs_qzh = "zb"
            }
            if(chooseJIngYingFangShi2.text == "委办") {
                infoOfYzpbfwyycsjjqzdjb.jyfs_qzh = "wb"
            }
        }
        
        let isMatchYouBian2 = rxYouBian.isMatch(qzhyouZhengBianMa.text)
        if isMatchYouBian2 {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.yzbm_qzh = qzhyouZhengBianMa.text
        } else {
            
            print("邮政编码不符合要求")
            //            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            qzhyouZhengBianMa.text = "不符要求"
            qzhyouZhengBianMa.textColor = UIColor.redColor()
        }
        
        
        //infoOfYzpbfwyycsjjqzdjb.szdy_qzh = chooseSuoZaiDiDian2.text
        if  chooseSuoZaiDiDian2.text == "未选择" {
            chooseSuoZaiDiDian2.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseSuoZaiDiDian2.text == "城市地区")  {
                infoOfYzpbfwyycsjjqzdjb.szdy_qzh = "csdq"
            }
            if(chooseSuoZaiDiDian2.text == "乡镇地区") {
                infoOfYzpbfwyycsjjqzdjb.szdy_qzh = "xzdq"
            }
            if(chooseSuoZaiDiDian2.text == "农村地区") {
                infoOfYzpbfwyycsjjqzdjb.szdy_qzh = "ncdq"
            }
        }
        
        if qzhKaiYeShiJian.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.kysj_qzh = qzhKaiYeShiJian.text
        } else if (qzhKaiYeShiJian.text == "")
        {
            
            qzhKaiYeShiJian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        //infoOfYzpbfwyycsjjqzdjb.fwcq_qzh = chooseFangWuChangQuan2.text
        if  chooseFangWuChangQuan2.text == "未选择" {
            chooseFangWuChangQuan2.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseFangWuChangQuan2.text == "自有")  {
                infoOfYzpbfwyycsjjqzdjb.fwcq_qzh = "ziy"
            }
            if(chooseFangWuChangQuan2.text == "租用") {
                infoOfYzpbfwyycsjjqzdjb.fwcq_qzh = "zuy"
            }
            if (chooseFangWuChangQuan2.text == "无偿使用")  {
                infoOfYzpbfwyycsjjqzdjb.fwcq_qzh = "wucsy"
            }
            if(chooseFangWuChangQuan2.text == "其他") {
                infoOfYzpbfwyycsjjqzdjb.fwcq_qzh = "qt"
            }
        }
        
        let isMatchJianZhuMianJi2 = rxJianZhuMianJi.isMatch(qzhJianZhuMianJi.text)
        if isMatchJianZhuMianJi2 {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.jzmj_qzh = qzhJianZhuMianJi.text
        } else {
            
            print("建筑面积不符合要求")
            //            jianZhuMianJi.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            qzhJianZhuMianJi.text = "不符要求"
            qzhJianZhuMianJi.textColor = UIColor.redColor()
        }
        
        if qzhYingYeShiJianZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.zyyr_qzh_ks = qzhYingYeShiJianZhouJi.text
        } else if (qzhYingYeShiJianZhouJi.text == "")
        {
            
            qzhYingYeShiJianZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhYingYeShiJianZhiZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.zyyr_qzh_js = qzhYingYeShiJianZhiZhouJi.text
        } else if (qzhYingYeShiJianZhiZhouJi.text == "")
        {
            
            qzhYingYeShiJianZhiZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhYingYeShiJianJiDian.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.ryysj_qzh_ks = qzhYingYeShiJianJiDian.text
        } else if (qzhYingYeShiJianJiDian.text == "")
        {
            
            qzhYingYeShiJianJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhYingYeShiJianZhiJiDian.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.ryysj_qzh_js = qzhYingYeShiJianZhiJiDian.text
        } else if (qzhYingYeShiJianZhiJiDian.text == "")
        {
            
            qzhYingYeShiJianZhiJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhKaiXiangPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.kxpc_qzh = qzhKaiXiangPinCi.text
        } else if (qzhKaiXiangPinCi.text == "")
        {
            
            qzhKaiXiangPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhZhouTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.ztdpc_qzh = qzhZhouTouDiPinCi.text
        } else if (qzhZhouTouDiPinCi.text == "")
        {
            
            qzhZhouTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if qzhRiTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfYzpbfwyycsjjqzdjb.rtdpc_qzh = qzhRiTouDiPinCi.text
        } else if (qzhRiTouDiPinCi.text == "")
        {
            
            qzhRiTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        var stringForEdit2 = ""
        if ((XinJian2.selected || WuLiu2.selected || JiYou2.selected || BaoGuo2.selected || YinShuaPin2.selected || BaoKanLingShou2.selected || YouZhengChuXu2.selected || MangRenDuWu2.selected || TeKuaiZhuangDi2.selected || BaoKanDingYue2.selected || YouZhengHuiDui2.selected || YIWuBingXinHan2.selected || LieShiBaoGuo2.selected || QiTa2.selected) == false)
        {
            
            let alertView = UIAlertView(title: "须选择业务范围", message:  "业务范围不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            
            if XinJian2.selected {
                if infoOfYzpbfwyycsjjqzdjb.ywfw_qzh == "" {
                    infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += "xj"
                    stringForEdit2 += "xj"
                } else {
                    infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",xj"
                    stringForEdit2 += ",xj"
                }
            }
            if WuLiu2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",wl"
                stringForEdit2 += ",wl"
            }
            if JiYou2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",jy"
                stringForEdit2 += ",jy"
            }
            if BaoGuo2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",bgs"
                stringForEdit2 += ",bgs"
            }
            if YinShuaPin2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",ysp"
                stringForEdit2 += ",ysp"
            }
            if BaoKanLingShou2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",bkls"
                stringForEdit2 += ",bkls"
            }
            if YouZhengChuXu2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",yzcx"
                stringForEdit2 += ",yzcx"
            }
            if MangRenDuWu2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",mrdw"
                stringForEdit2 += ",mrdw"
            }
            if TeKuaiZhuangDi2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",tkzd"
                stringForEdit2 += ",tkzd"
            }
            if BaoKanDingYue2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",bkdy"
                stringForEdit2 += ",bkdy"
            }
            if YouZhengHuiDui2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",yzhd"
                stringForEdit2 += ",yzhd"
            }
            if YIWuBingXinHan2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",ywbxh"
                stringForEdit2 += ",ywbxh"
            }
            if LieShiBaoGuo2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",lsywbg"
                stringForEdit2 += ",lsywbg"
            }
            if QiTa2.selected {
                infoOfYzpbfwyycsjjqzdjb.ywfw_qzh += ",qt"
                stringForEdit2 += ",qt"
            }
        }
        //        var app=UIApplication.sharedApplication().delegate as! AppDelegate
        //        app.network .addWithInterface("Jjqz", andInfo: ClassToJSON.getObjectData(infoOfYzpbfwyycsjjqzdjb), andExtraInfo: nil)
        
        print("\(COMMIT_OK)", terminator: "\n")
        
        if (COMMIT_OK == 39) {
            if app.ServerData == 0 {
                
                app.network.addWithInterface("Jjqz", andUser: app.userData, andInfo:  ClassToJSON.getObjectData(infoOfYzpbfwyycsjjqzdjb), andExtraInfo: nil)
            }
            
            if app.ServerData == 2 {
                
                app.applyChangeDic.setValue(qzqChangSuoMingCheng.text, forKey: "csmc_qzq")
                app.applyChangeDic.setValue(qzqDengJiBianHao.text, forKey: "djbh_qzq")
                app.applyChangeDic.setValue(qzqChangSuoDiZhiShi.text, forKey: "csdz_qzq_s")
                app.applyChangeDic.setValue(qzqChangSuoDiZhiXian.text, forKey: "csdz_qzq_xqs")
                app.applyChangeDic.setValue(qzqChangSuoDiZhiJie.text, forKey: "csdz_qzq_jx")
                app.applyChangeDic.setValue(qzqChangSuoDiZhiHao.text, forKey: "csdz_qzq_h")
                app.applyChangeDic.setValue(qzqShangJiDanWei.text, forKey: "sjdw_qzq")
                app.applyChangeDic.setValue(qzqYouZhengBianMa.text, forKey: "yzbm_qzq")
                app.applyChangeDic.setValue(chooseJIngYingFangShi1.text, forKey: "jyfs_qzq")
                app.applyChangeDic.setValue(chooseFangWuChangQuan1.text, forKey: "fwcq_qzq")
                app.applyChangeDic.setValue(chooseSuoZaiDiDian1.text, forKey: "szdy_qzq")
                app.applyChangeDic.setValue(qzqKaiYeShiJian.text, forKey: "kysj_qzq")
                app.applyChangeDic.setValue(qzqJianZhuMianJi.text, forKey: "jzmj_qzq")
                app.applyChangeDic.setValue(qzqYingYeShiJianZhouJi.text, forKey: "zyyr_qzq_ks")
                app.applyChangeDic.setValue(qzqYingYeShiJianZhiZhouJi.text, forKey: "zyyr_qzq_js")
                app.applyChangeDic.setValue(qzqYingYeShiJianJiDian.text, forKey: "ryysj_qzq_ks")
                app.applyChangeDic.setValue(qzqYingYeShiJianZhiJiDian.text, forKey: "ryysj_qzq_js")
                app.applyChangeDic.setValue(qzqKaiXiangPinCi.text, forKey: "kxpc_qzq")
                app.applyChangeDic.setValue(qzqZhouTouDiPinCi.text, forKey: "ztdpc_qzq")
                app.applyChangeDic.setValue(qzqRiTouDiPinCi.text, forKey: "rtdpc_qzq")
                app.applyChangeDic.setValue(stringForEdit1, forKey: "ywfw_qzq")
                app.applyChangeDic.setValue(qzqQianZhiYuanYin.text, forKey: "qzyy_qzq")
                
                
                app.applyChangeDic.setValue(qzhChangSuoDiZhiShi.text, forKey: "csdz_qzh_s")
                app.applyChangeDic.setValue(qzhChangSuoDiZhiXian.text, forKey: "csdz_qzh_xqs")
                app.applyChangeDic.setValue(qzhChangSuoDiZhiJie.text, forKey: "csdz_qzh_jx")
                app.applyChangeDic.setValue(qzhChangSuoDiZhiHao.text, forKey: "csdz_qzh_h")
                app.applyChangeDic.setValue(qzhYuYuanZhiZhiXianJuLi.text, forKey: "yyzzxjl_qzh")
                app.applyChangeDic.setValue(chooseJIngYingFangShi2.text, forKey: "jyfs_qzh")
                app.applyChangeDic.setValue(qzhyouZhengBianMa.text, forKey: "yzbm_qzh")
                app.applyChangeDic.setValue(chooseSuoZaiDiDian2.text, forKey: "szdy_qzh")
                app.applyChangeDic.setValue(qzhKaiYeShiJian.text, forKey: "kysj_qzh")
                app.applyChangeDic.setValue(chooseFangWuChangQuan2.text, forKey: "fwcq_qzh")
                app.applyChangeDic.setValue(qzhJianZhuMianJi.text, forKey: "jzmj_qzh")
                app.applyChangeDic.setValue(qzhYingYeShiJianZhouJi.text, forKey: "zyyr_qzh_ks")
                app.applyChangeDic.setValue(qzhYingYeShiJianZhiZhouJi.text, forKey: "zyyr_qzh_js")
                app.applyChangeDic.setValue(qzhYingYeShiJianJiDian.text, forKey: "ryysj_qzh_ks")
                app.applyChangeDic.setValue(qzhYingYeShiJianZhiJiDian.text, forKey: "ryysj_qzh_js")
                app.applyChangeDic.setValue(qzhKaiXiangPinCi.text, forKey: "kxpc_qzh")
                app.applyChangeDic.setValue(qzhZhouTouDiPinCi.text, forKey: "ztdpc_qzh")
                app.applyChangeDic.setValue(qzhRiTouDiPinCi.text, forKey: "rtdpc_qzh")
                app.applyChangeDic.setValue(stringForEdit2, forKey: "ywfw_qzh")
                
                app.network.editWithInterface("Jjqz", andInfo: app.applyChangeDic as [NSObject : AnyObject] , andExtraInfo: nil)
            }
        }
        
//        print("\(ClassToJSON.getObjectData(infoOfYzpbfwyycsjjqzdjb))")
        //ClassToJSON.getObjectData(infoOfYzpbfwyycsjjqzdjb)
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
    @IBOutlet var tap6: UITapGestureRecognizer!
    @IBOutlet var tap7: UITapGestureRecognizer!
    @IBOutlet var tap8: UITapGestureRecognizer!
    @IBOutlet var tap9: UITapGestureRecognizer!
    @IBOutlet var tap10: UITapGestureRecognizer!
    @IBOutlet var tap11: UITapGestureRecognizer!
    
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
            textViewOnBkView.text = app.applyChangeDic.valueForKey("sppl") as? String
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
    
    @IBOutlet weak var commitBtn1: UIButton!
    @IBOutlet weak var commitBtn2: UIButton!
    
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
        labelNav.text = "申请变更网点"
        self.navigationItem.titleView = labelNav
        
        applyChangeBranchLocationView.hidden = true
        SegmentedControl.frame.size.height = 40
        
        if let rootview = self.view as? UIScrollView {
            rootview.contentSize = CGSize(width: 320, height: 1670)
            print("\(self.view.debugDescription)")
            // Do any additional setup after loading the view.
        }
        
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
        
        //服务器信息回填
        //------------------------------ServerData 0--------------------------------
        
        if app.ServerData == 0 {
            SegmentedControl.enabled = true
            commitBtn1.hidden = false
            commitBtn2.hidden = false
            
            mingChengBianGeng.enabled = true
            jingYingShiJianBianGeng.enabled = true
            jingYingFangShiBianGeng.enabled = true
            changQuanXingZhiBianGeng.enabled = true
            changSuoMingChengBianGengQian.enabled = true
            dengJiBianHaoBianGengQian.enabled = true
            bgqCangSuoDiZhiShi.enabled = true
            bgqCangSuoDiZhiXian.enabled = true
            bgqCangSuoDiZhiJie.enabled = true
            bgqCangSuoDiZhiHao.enabled = true
            bgqCangSuoDiZhiJingDu.enabled = true
            bgqCangSuoDiZhiWeiDu.enabled = true
            
            bgqShangJiDanWei.enabled = true
            
            tap1.enabled = true
            
            bgqYouZhengBianMa.enabled = true
            
            tap2.enabled = true
            
            bgqKaiYeShiJian.enabled = true
            
            tap3.enabled = true
            
            bgqJianZhuMianJi.enabled = true
            
            bgqYingYeShiJianZhouJi.enabled = true
            bgqYingYeShiJianZhiZhouJi.enabled = true
            bgqYingYeShiJianJiDian.enabled = true
            bgqYingYeShiJianZhiJiDian.enabled = true
            bgqKaiXiangPinCi.enabled = true
            bgqRiTouDiPinCi.enabled = true
            bgqZhouTouDiPinCi.enabled = true
            
            XinJian.enabled = true
            WuLiu.enabled = true
            JiYou.enabled = true
            BaoGuo.enabled = true
            YinShuaPin.enabled = true
            BaoKanLingShou.enabled = true
            YouZhengChuXu.enabled = true
            MangRenDuWu.enabled = true
            TeKuaiZhuangDi.enabled = true
            BaoKanDingYue.enabled = true
            YouZhengHuiDui.enabled = true
            YIWuBingXinHan.enabled = true
            LieShiBaoGuo.enabled = true
            QiTa.enabled = true
            
            //变更后
            bghChangSuoMingCheng.enabled = true
            bghChangSuoMingChengBianGengYuanYin.enabled = true
            bghYingYeShiJianZhouJi.enabled = true
            bghYingYeShiJianZhiZhouJi.enabled = true
            bghYingYeShiJianJiDian.enabled = true
            bghYingYeShiJianZhiJiDian.enabled = true
            bghYingYeShiJianBianGengYuanYin.enabled = true
            
            tap4.enabled = true
            
            bghJingYingFangShiBianGengYuanYin.enabled = true
            
            tap5.enabled = true
            
            bghFangWuChanQuanBianGengYuanYin.enabled = true
            bghChangSuoDiZhi.enabled = true
            bghChangSuoDiZhiBianGengYuanYin.enabled = true
            
            
            //-------------------------迁址控件状态变化------------------------------
            qzqChangSuoMingCheng.enabled = true
            qzqDengJiBianHao.enabled = true
            qzqChangSuoDiZhiShi.enabled = true
            qzqChangSuoDiZhiXian.enabled = true
            qzqChangSuoDiZhiJie.enabled = true
            qzqChangSuoDiZhiHao.enabled = true
            
            qzqShangJiDanWei.enabled = true
            
            qzqYouZhengBianMa.enabled = true
            
            tap6.enabled = true
            
            tap7.enabled = true
            
            tap8.enabled = true
            
            qzqKaiYeShiJian.enabled = true
            qzqJianZhuMianJi.enabled = true
            
            qzqYingYeShiJianZhouJi.enabled = true
            qzqYingYeShiJianZhiZhouJi.enabled = true
            qzqYingYeShiJianJiDian.enabled = true
            qzqYingYeShiJianZhiJiDian.enabled = true
            qzqKaiXiangPinCi.enabled = true
            qzqZhouTouDiPinCi.enabled = true
            qzqRiTouDiPinCi.enabled = true
            
            XinJian1.enabled = true
            WuLiu1.enabled = true
            JiYou1.enabled = true
            BaoGuo1.enabled = true
            YinShuaPin1.enabled = true
            BaoKanLingShou1.enabled = true
            YouZhengChuXu1.enabled = true
            MangRenDuWu1.enabled = true
            TeKuaiZhuangDi1.enabled = true
            BaoKanDingYue1.enabled = true
            YouZhengHuiDui1.enabled = true
            YIWuBingXinHan1.enabled = true
            LieShiBaoGuo1.enabled = true
            QiTa1.enabled = true
            
            qzqQianZhiYuanYin.enabled = true
            
            //迁址后
            qzhChangSuoDiZhiShi.enabled = true
            qzhChangSuoDiZhiXian.enabled = true
            qzhChangSuoDiZhiJie.enabled = true
            qzhChangSuoDiZhiHao.enabled = true
            
            qzhYuYuanZhiZhiXianJuLi.enabled = true
            
            tap9.enabled = true
            
            tap10.enabled = true
            
            qzhKaiYeShiJian.enabled = true
            
            tap11.enabled = true
            
            qzhJianZhuMianJi.enabled = true
            
            qzhYingYeShiJianZhouJi.enabled = true
            qzhYingYeShiJianZhiZhouJi.enabled = true
            qzhYingYeShiJianJiDian.enabled = true
            qzhYingYeShiJianZhiJiDian.enabled = true
            qzhKaiXiangPinCi.enabled = true
            qzhZhouTouDiPinCi.enabled = true
            qzhRiTouDiPinCi.enabled = true
            
            XinJian2.enabled = true
            WuLiu2.enabled = true
            JiYou2.enabled = true
            BaoGuo2.enabled = true
            YinShuaPin2.enabled = true
            BaoKanLingShou2.enabled = true
            YouZhengChuXu2.enabled = true
            MangRenDuWu2.enabled = true
            TeKuaiZhuangDi2.enabled = true
            BaoKanDingYue2.enabled = true
            YouZhengHuiDui2.enabled = true
            YIWuBingXinHan2.enabled = true
            LieShiBaoGuo2.enabled = true
            QiTa2.enabled = true
            
        }
        
        
        
        
        
        
        
        //------------------------------ServerData 1--------------------------------
        
        if app.ServerData == 1 {
            SegmentedControl.enabled = false
            
            if app.applyChangeDic.valueForKey("bgsx") != nil {
                
                commitBtn1.hidden = true
                commitBtn2.hidden = true
                
                mingChengBianGeng.enabled = false
                jingYingShiJianBianGeng.enabled = false
                jingYingFangShiBianGeng.enabled = false
                changQuanXingZhiBianGeng.enabled = false
                changSuoMingChengBianGengQian.enabled = false
                dengJiBianHaoBianGengQian.enabled = false
                bgqCangSuoDiZhiShi.enabled = false
                bgqCangSuoDiZhiXian.enabled = false
                bgqCangSuoDiZhiJie.enabled = false
                bgqCangSuoDiZhiHao.enabled = false
                bgqCangSuoDiZhiJingDu.enabled = false
                bgqCangSuoDiZhiWeiDu.enabled = false
                
                bgqShangJiDanWei.enabled = false
                
                tap1.enabled = false
                
                bgqYouZhengBianMa.enabled = false
                
                tap2.enabled = false
                
                bgqKaiYeShiJian.enabled = false
                
                tap3.enabled = false
                
                bgqJianZhuMianJi.enabled = false
                
                bgqYingYeShiJianZhouJi.enabled = false
                bgqYingYeShiJianZhiZhouJi.enabled = false
                bgqYingYeShiJianJiDian.enabled = false
                bgqYingYeShiJianZhiJiDian.enabled = false
                bgqKaiXiangPinCi.enabled = false
                bgqRiTouDiPinCi.enabled = false
                bgqZhouTouDiPinCi.enabled = false
                
                XinJian.enabled = false
                WuLiu.enabled = false
                JiYou.enabled = false
                BaoGuo.enabled = false
                YinShuaPin.enabled = false
                BaoKanLingShou.enabled = false
                YouZhengChuXu.enabled = false
                MangRenDuWu.enabled = false
                TeKuaiZhuangDi.enabled = false
                BaoKanDingYue.enabled = false
                YouZhengHuiDui.enabled = false
                YIWuBingXinHan.enabled = false
                LieShiBaoGuo.enabled = false
                QiTa.enabled = false
                
                //变更后
                bghChangSuoMingCheng.enabled = false
                bghChangSuoMingChengBianGengYuanYin.enabled = false
                bghYingYeShiJianZhouJi.enabled = false
                bghYingYeShiJianZhiZhouJi.enabled = false
                bghYingYeShiJianJiDian.enabled = false
                bghYingYeShiJianZhiJiDian.enabled = false
                bghYingYeShiJianBianGengYuanYin.enabled = false
                
                tap4.enabled = false
                
                bghJingYingFangShiBianGengYuanYin.enabled = false
                
                tap5.enabled = false
                tap6.enabled = false
                tap7.enabled = false
                tap8.enabled = false
                tap9.enabled = false
                tap10.enabled = false
                tap11.enabled = false
                
                
                bghFangWuChanQuanBianGengYuanYin.enabled = false
                bghChangSuoDiZhi.enabled = false
                bghChangSuoDiZhiBianGengYuanYin.enabled = false
                
                initBianGengXinXi(app.applyChangeDic)
            } else {
                
                commitBtn1.hidden = true
                commitBtn2.hidden = true
                //------------------------迁址控件状态变化--------------------------
                qzqChangSuoMingCheng.enabled = false
                qzqDengJiBianHao.enabled = false
                qzqChangSuoDiZhiShi.enabled = false
                qzqChangSuoDiZhiXian.enabled = false
                qzqChangSuoDiZhiJie.enabled = false
                qzqChangSuoDiZhiHao.enabled = false
                
                qzqShangJiDanWei.enabled = false
                
                qzqYouZhengBianMa.enabled = false
                
                tap1.enabled = false
                tap2.enabled = false
                tap3.enabled = false
                tap4.enabled = false
                tap5.enabled = false
                
                tap6.enabled = false
                
                tap7.enabled = false
                
                tap8.enabled = false
                
                qzqKaiYeShiJian.enabled = false
                qzqJianZhuMianJi.enabled = false
                
                qzqYingYeShiJianZhouJi.enabled = false
                qzqYingYeShiJianZhiZhouJi.enabled = false
                qzqYingYeShiJianJiDian.enabled = false
                qzqYingYeShiJianZhiJiDian.enabled = false
                qzqKaiXiangPinCi.enabled = false
                qzqZhouTouDiPinCi.enabled = false
                qzqRiTouDiPinCi.enabled = false
                
                XinJian1.enabled = false
                WuLiu1.enabled = false
                JiYou1.enabled = false
                BaoGuo1.enabled = false
                YinShuaPin1.enabled = false
                BaoKanLingShou1.enabled = false
                YouZhengChuXu1.enabled = false
                MangRenDuWu1.enabled = false
                TeKuaiZhuangDi1.enabled = false
                BaoKanDingYue1.enabled = false
                YouZhengHuiDui1.enabled = false
                YIWuBingXinHan1.enabled = false
                LieShiBaoGuo1.enabled = false
                QiTa1.enabled = false
                
                qzqQianZhiYuanYin.enabled = false
                
                //迁址后
                qzhChangSuoDiZhiShi.enabled = false
                qzhChangSuoDiZhiXian.enabled = false
                qzhChangSuoDiZhiJie.enabled = false
                qzhChangSuoDiZhiHao.enabled = false
                
                qzhYuYuanZhiZhiXianJuLi.enabled = false
                
                tap9.enabled = false
                
                tap10.enabled = false
                
                qzhKaiYeShiJian.enabled = false
                
                tap11.enabled = false
                
                qzhJianZhuMianJi.enabled = false
                
                qzhYingYeShiJianZhouJi.enabled = false
                qzhYingYeShiJianZhiZhouJi.enabled = false
                qzhYingYeShiJianJiDian.enabled = false
                qzhYingYeShiJianZhiJiDian.enabled = false
                qzhKaiXiangPinCi.enabled = false
                qzhZhouTouDiPinCi.enabled = false
                qzhRiTouDiPinCi.enabled = false
                
                XinJian2.enabled = false
                WuLiu2.enabled = false
                JiYou2.enabled = false
                BaoGuo2.enabled = false
                YinShuaPin2.enabled = false
                BaoKanLingShou2.enabled = false
                YouZhengChuXu2.enabled = false
                MangRenDuWu2.enabled = false
                TeKuaiZhuangDi2.enabled = false
                BaoKanDingYue2.enabled = false
                YouZhengHuiDui2.enabled = false
                YIWuBingXinHan2.enabled = false
                LieShiBaoGuo2.enabled = false
                QiTa2.enabled = false
                
                initBianGengQianZhi(app.applyChangeDic)
            }
        }
        
        
        
        
        
        
        //------------------------------ServerData 2--------------------------------
        if app.ServerData == 2 {
            SegmentedControl.enabled = false
            
            if app.applyChangeDic.valueForKey("bgsx") != nil {
                
                commitBtn1.hidden = false
                //                commitBtn2.hidden = false
                
                mingChengBianGeng.enabled = true
                jingYingShiJianBianGeng.enabled = true
                jingYingFangShiBianGeng.enabled = true
                changQuanXingZhiBianGeng.enabled = true
                changSuoMingChengBianGengQian.enabled = true
                dengJiBianHaoBianGengQian.enabled = true
                bgqCangSuoDiZhiShi.enabled = true
                bgqCangSuoDiZhiXian.enabled = true
                bgqCangSuoDiZhiJie.enabled = true
                bgqCangSuoDiZhiHao.enabled = true
                bgqCangSuoDiZhiJingDu.enabled = true
                bgqCangSuoDiZhiWeiDu.enabled = true
                
                bgqShangJiDanWei.enabled = true
                
                tap1.enabled = true
                
                bgqYouZhengBianMa.enabled = true
                
                tap2.enabled = true
                
                bgqKaiYeShiJian.enabled = true
                
                tap3.enabled = true
                
                bgqJianZhuMianJi.enabled = true
                
                bgqYingYeShiJianZhouJi.enabled = true
                bgqYingYeShiJianZhiZhouJi.enabled = true
                bgqYingYeShiJianJiDian.enabled = true
                bgqYingYeShiJianZhiJiDian.enabled = true
                bgqKaiXiangPinCi.enabled = true
                bgqRiTouDiPinCi.enabled = true
                bgqZhouTouDiPinCi.enabled = true
                
                XinJian.enabled = true
                WuLiu.enabled = true
                JiYou.enabled = true
                BaoGuo.enabled = true
                YinShuaPin.enabled = true
                BaoKanLingShou.enabled = true
                YouZhengChuXu.enabled = true
                MangRenDuWu.enabled = true
                TeKuaiZhuangDi.enabled = true
                BaoKanDingYue.enabled = true
                YouZhengHuiDui.enabled = true
                YIWuBingXinHan.enabled = true
                LieShiBaoGuo.enabled = true
                QiTa.enabled = true
                
                //变更后
                bghChangSuoMingCheng.enabled = true
                bghChangSuoMingChengBianGengYuanYin.enabled = true
                bghYingYeShiJianZhouJi.enabled = true
                bghYingYeShiJianZhiZhouJi.enabled = true
                bghYingYeShiJianJiDian.enabled = true
                bghYingYeShiJianZhiJiDian.enabled = true
                bghYingYeShiJianBianGengYuanYin.enabled = true
                
                tap4.enabled = true
                
                bghJingYingFangShiBianGengYuanYin.enabled = true
                
                tap5.enabled = true
                
                bghFangWuChanQuanBianGengYuanYin.enabled = true
                bghChangSuoDiZhi.enabled = true
                bghChangSuoDiZhiBianGengYuanYin.enabled = true
                
                initBianGengXinXi(app.applyChangeDic)
            } else {
                
                //                commitBtn1.hidden = false
                commitBtn2.hidden = false
                
                //-------------------------迁址控件状态变化------------------------------
                qzqChangSuoMingCheng.enabled = true
                qzqDengJiBianHao.enabled = true
                qzqChangSuoDiZhiShi.enabled = true
                qzqChangSuoDiZhiXian.enabled = true
                qzqChangSuoDiZhiJie.enabled = true
                qzqChangSuoDiZhiHao.enabled = true
                
                qzqShangJiDanWei.enabled = true
                
                qzqYouZhengBianMa.enabled = true
                
                tap6.enabled = true
                
                tap7.enabled = true
                
                tap8.enabled = true
                
                qzqKaiYeShiJian.enabled = true
                qzqJianZhuMianJi.enabled = true
                
                qzqYingYeShiJianZhouJi.enabled = true
                qzqYingYeShiJianZhiZhouJi.enabled = true
                qzqYingYeShiJianJiDian.enabled = true
                qzqYingYeShiJianZhiJiDian.enabled = true
                qzqKaiXiangPinCi.enabled = true
                qzqZhouTouDiPinCi.enabled = true
                qzqRiTouDiPinCi.enabled = true
                
                XinJian1.enabled = true
                WuLiu1.enabled = true
                JiYou1.enabled = true
                BaoGuo1.enabled = true
                YinShuaPin1.enabled = true
                BaoKanLingShou1.enabled = true
                YouZhengChuXu1.enabled = true
                MangRenDuWu1.enabled = true
                TeKuaiZhuangDi1.enabled = true
                BaoKanDingYue1.enabled = true
                YouZhengHuiDui1.enabled = true
                YIWuBingXinHan1.enabled = true
                LieShiBaoGuo1.enabled = true
                QiTa1.enabled = true
                
                qzqQianZhiYuanYin.enabled = true
                
                //迁址后
                qzhChangSuoDiZhiShi.enabled = true
                qzhChangSuoDiZhiXian.enabled = true
                qzhChangSuoDiZhiJie.enabled = true
                qzhChangSuoDiZhiHao.enabled = true
                
                qzhYuYuanZhiZhiXianJuLi.enabled = true
                
                tap9.enabled = true
                
                tap10.enabled = true
                
                qzhKaiYeShiJian.enabled = true
                
                tap11.enabled = true
                
                qzhJianZhuMianJi.enabled = true
                
                qzhYingYeShiJianZhouJi.enabled = true
                qzhYingYeShiJianZhiZhouJi.enabled = true
                qzhYingYeShiJianJiDian.enabled = true
                qzhYingYeShiJianZhiJiDian.enabled = true
                qzhKaiXiangPinCi.enabled = true
                qzhZhouTouDiPinCi.enabled = true
                qzhRiTouDiPinCi.enabled = true
                
                XinJian2.enabled = true
                WuLiu2.enabled = true
                JiYou2.enabled = true
                BaoGuo2.enabled = true
                YinShuaPin2.enabled = true
                BaoKanLingShou2.enabled = true
                YouZhengChuXu2.enabled = true
                MangRenDuWu2.enabled = true
                TeKuaiZhuangDi2.enabled = true
                BaoKanDingYue2.enabled = true
                YouZhengHuiDui2.enabled = true
                YIWuBingXinHan2.enabled = true
                LieShiBaoGuo2.enabled = true
                QiTa2.enabled = true
                
                
                initBianGengQianZhi(app.applyChangeDic)
            }
        }
    }
    
    func initBianGeng(dict: NSDictionary, segmentedControlIndex index:Int)
    {
        if index == 0 {
            initBianGengXinXi(dict)
        } else if index == 1{
            initBianGengQianZhi(dict)
        }
    }
    
    func initBianGengXinXi(dict: NSDictionary) {
        //segmentedControl预选定
        SegmentedControl.selectedSegmentIndex = 0
        applyChangeBranchInfoView.hidden = false
        applyChangeBranchLocationView.hidden = true
        if let rootView = self.view as? UIScrollView {
            rootView.contentSize = CGSize(width: 320, height: 1670)
            
            let stateValueFromServer = app.applyChangeDic.valueForKey("state") as? Int
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
            
            
            //属性预置
            if (dict.valueForKey("bgsx") as! String == "mcbg")   {
                mingChengBianGeng.selected = true
            }
            if(dict.valueForKey("bgsx") as! String == "yysjbg") {
                jingYingShiJianBianGeng.selected = true
            }
            if (dict.valueForKey("bgsx") as! String == "jyfsbg")   {
                jingYingFangShiBianGeng.selected = true
            }
            if(dict.valueForKey("bgsx") as! String == "cqxzbg") {
                changQuanXingZhiBianGeng.selected = true
            }
            
            changSuoMingChengBianGengQian.text = dict.valueForKey("csmc_bgq") as? String
            dengJiBianHaoBianGengQian.text = dict.valueForKey("djbh_bgq") as? String
            bgqCangSuoDiZhiShi.text = dict.valueForKey("csdz_bgq_s") as? String
            bgqCangSuoDiZhiXian.text = dict.valueForKey("csdz_bgq_xqs") as? String
            bgqCangSuoDiZhiJie.text = dict.valueForKey("csdz_bgq_jx") as? String
            bgqCangSuoDiZhiHao.text = dict.valueForKey("csdz_bgq_h") as? String
            bgqCangSuoDiZhiJingDu.text = dict.valueForKey("csdz_bgq_jd") as? String
            bgqCangSuoDiZhiWeiDu.text = dict.valueForKey("csdz_bgq_wd") as? String
            
            bgqShangJiDanWei.text = dict.valueForKey("sjdw_bgq") as? String
            
            if (dict.valueForKey("jyfs_bgq") as? String == "zb")   {
                chooseJingYingFangShiBianGengQian.text = "自办"
            }
            if(dict.valueForKey("jyfs_bgq") as? String == "wb") {
                chooseJingYingFangShiBianGengQian.text = "委办"
            }
            
            bgqYouZhengBianMa.text = dict.valueForKey("yzbm_bgq") as? String
            
            if(dict.valueForKey("szdy_bgq") as? String == "csdq") {
                chooseSuoZaiDiDian.text = "城市地区"
            }
            if (dict.valueForKey("szdy_bgq") as? String == "xzdq")   {
                chooseSuoZaiDiDian.text = "乡镇地区"
            }
            if(dict.valueForKey("szdy_bgq") as? String == "ncdq") {
                chooseSuoZaiDiDian.text = "农村地区"
            }
            
            bgqKaiYeShiJian.text = dict.valueForKey("kysj_bgq") as? String
            
            if (dict.valueForKey("fwcq_bgq") as? String == "ziy")   {
                chooseFangWuChangQuanBianGengQian.text = "自有"
            }
            if(dict.valueForKey("fwcq_bgq") as? String == "zuy") {
                chooseFangWuChangQuanBianGengQian.text = "租用"
            }
            if (dict.valueForKey("fwcq_bgq") as? String == "wucsy")   {
                chooseFangWuChangQuanBianGengQian.text = "无偿使用"
            }
            if(dict.valueForKey("fwcq_bgq") as? String == "qt") {
                chooseFangWuChangQuanBianGengQian.text = "其他"
            }
            
            bgqJianZhuMianJi.text = dict.valueForKey("jzmj_bgq") as? String
            
            bgqYingYeShiJianZhouJi.text = dict.valueForKey("zyyr_bgq_ks") as? String
            bgqYingYeShiJianZhiZhouJi.text = dict.valueForKey("zyyr_bgq_js") as? String
            bgqYingYeShiJianJiDian.text = dict.valueForKey("ryysj_bgq_ks") as? String
            bgqYingYeShiJianZhiJiDian.text = dict.valueForKey("ryysj_bgq_js") as? String
            
            bgqKaiXiangPinCi.text = dict.valueForKey("kxpc_bgq") as? String
            bgqRiTouDiPinCi.text = dict.valueForKey("rtdpc_bgq") as? String
            bgqZhouTouDiPinCi.text = dict.valueForKey("ztdpc_bgq") as? String
            
            let ywsxArray = dict.valueForKey("ywfw_bgq") as? String
            if (ywsxArray!.rangeOfString("xj") != nil) {
                XinJian.selected = true
            }
            if (ywsxArray!.rangeOfString("wl") != nil) {
                WuLiu.selected = true
            }
            if (ywsxArray!.rangeOfString("jy") != nil) {
                JiYou.selected = true
            }
            if (ywsxArray!.rangeOfString("bgs") != nil) {
                BaoGuo.selected = true
            }
            if (ywsxArray!.rangeOfString("ysp") != nil) {
                YinShuaPin.selected = true
            }
            if (ywsxArray!.rangeOfString("bkls") != nil) {
                BaoKanLingShou.selected = true
            }
            if (ywsxArray!.rangeOfString("yzcx") != nil) {
                YouZhengChuXu.selected = true
            }
            if (ywsxArray!.rangeOfString("ywfw") != nil) {
                MangRenDuWu.selected = true
            }
            if (ywsxArray!.rangeOfString("tkzd") != nil) {
                TeKuaiZhuangDi.selected = true
            }
            if (ywsxArray!.rangeOfString("bkdy") != nil) {
                BaoKanDingYue.selected = true
            }
            if (ywsxArray!.rangeOfString("yzhd") != nil) {
                YouZhengHuiDui.selected = true
            }
            if (ywsxArray!.rangeOfString("ywbxh") != nil) {
                YIWuBingXinHan.selected = true
            }
            if (ywsxArray!.rangeOfString("lsywbg") != nil) {
                LieShiBaoGuo.selected = true
            }
            if (ywsxArray!.rangeOfString("qt") != nil) {
                QiTa.selected = true
            }
            
            //变更后
            bghChangSuoMingCheng.text = dict.valueForKey("csmc_bgh") as? String
            bghChangSuoMingChengBianGengYuanYin.text = dict.valueForKey("bgyy_bghcsmc") as? String
            bghYingYeShiJianZhouJi.text = dict.valueForKey("zyyr_bgh_ks") as? String
            bghYingYeShiJianZhiZhouJi.text = dict.valueForKey("zyyr_bgh_js") as? String
            bghYingYeShiJianJiDian.text = dict.valueForKey("ryysj_bgh_ks") as? String
            bghYingYeShiJianZhiJiDian.text = dict.valueForKey("ryysj_bgh_js") as? String
            bghYingYeShiJianBianGengYuanYin.text = dict.valueForKey("bgyy_bghyysj") as? String
            
            if (dict.valueForKey("jyfs_bgh") as? String == "zb")   {
                chooseJIngYingFangShi.text = "自办"
            }
            if(dict.valueForKey("jyfs_bgh") as? String == "wb") {
                chooseJIngYingFangShi.text = "委办"
            }
            
            bghJingYingFangShiBianGengYuanYin.text = dict.valueForKey("bgyy_bghjyfs") as? String
            
            if (dict.valueForKey("fwcq_bgh") as? String == "ziy")   {
                chooseFangWuChangQuan.text = "自有"
            }
            if(dict.valueForKey("fwcq_bgh") as? String == "zuy") {
                chooseFangWuChangQuan.text = "租用"
            }
            if (dict.valueForKey("fwcq_bgh") as? String == "wucsy")   {
                chooseFangWuChangQuan.text = "无偿使用"
            }
            if(dict.valueForKey("fwcq_bgh") as? String == "qt") {
                chooseFangWuChangQuan.text = "其他"
            }
            
            bghFangWuChanQuanBianGengYuanYin.text = dict.valueForKey("bgyy_bghfwcq") as? String
            bghChangSuoDiZhi.text = dict.valueForKey("csdz_bgh") as? String
            bghChangSuoDiZhiBianGengYuanYin.text = dict.valueForKey("bgyy_bghcsmc") as? String
        }
    }
    
    
    func initBianGengQianZhi(dict: NSDictionary) {
        //segmentedControl预选定
        SegmentedControl.selectedSegmentIndex = 1
        applyChangeBranchInfoView.hidden = true
        applyChangeBranchLocationView.hidden = false
        if let rootView = self.view as? UIScrollView {
            rootView.contentSize = CGSize(width: 320, height: 1879)
            
            let stateValueFromServer = app.applyChangeDic.valueForKey("state") as? Int
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
            
            
            //属性预置
            //迁址前
            qzqChangSuoMingCheng.text = dict.valueForKey("csmc_qzq") as? String
            qzqDengJiBianHao.text = dict.valueForKey("djbh_qzq") as? String
            qzqChangSuoDiZhiShi.text = dict.valueForKey("csdz_qzq_s") as? String
            qzqChangSuoDiZhiXian.text = dict.valueForKey("csdz_qzq_xqs") as? String
            qzqChangSuoDiZhiJie.text = dict.valueForKey("csdz_qzq_jx") as? String
            qzqChangSuoDiZhiHao.text = dict.valueForKey("csdz_qzq_h") as? String
            
            qzqShangJiDanWei.text = dict.valueForKey("sjdw_qzq") as? String
            
            qzqYouZhengBianMa.text = dict.valueForKey("yzbm_qzq") as? String
            
            if (dict.valueForKey("jyfs_qzq") as? String == "zb")   {
                chooseJIngYingFangShi1.text = "自办"
            }
            if(dict.valueForKey("jyfs_qzq") as? String == "wb") {
                chooseJIngYingFangShi1.text = "委办"
            }
            
            if (dict.valueForKey("fwcq_qzq") as? String == "ziy")   {
                chooseFangWuChangQuan1.text = "自有"
            }
            if(dict.valueForKey("fwcq_qzq") as? String == "zuy") {
                chooseFangWuChangQuan1.text = "租用"
            }
            if (dict.valueForKey("fwcq_qzq") as? String == "wucsy")   {
                chooseFangWuChangQuan1.text = "无偿使用"
            }
            if(dict.valueForKey("fwcq_qzq") as? String == "qt") {
                chooseFangWuChangQuan1.text = "其他"
            }
            
            if(dict.valueForKey("szdy_qzq") as? String == "csdq") {
                chooseSuoZaiDiDian1.text = "城市地区"
            }
            if (dict.valueForKey("szdy_qzq") as? String == "xzdq")   {
                chooseSuoZaiDiDian1.text = "乡镇地区"
            }
            if(dict.valueForKey("szdy_qzq") as? String == "ncdq") {
                chooseSuoZaiDiDian1.text = "农村地区"
            }
            
            qzqKaiYeShiJian.text = dict.valueForKey("kysj_qzq") as? String
            qzqJianZhuMianJi.text = dict.valueForKey("jzmj_qzq") as? String
            
            qzqYingYeShiJianZhouJi.text = dict.valueForKey("zyyr_qzq_ks") as? String
            qzqYingYeShiJianZhiZhouJi.text = dict.valueForKey("zyyr_qzq_js") as? String
            qzqYingYeShiJianJiDian.text = dict.valueForKey("ryysj_qzq_ks") as? String
            qzqYingYeShiJianZhiJiDian.text = dict.valueForKey("ryysj_qzq_js") as? String
            
            qzqKaiXiangPinCi.text = dict.valueForKey("kxpc_qzq") as? String
            qzqZhouTouDiPinCi.text = dict.valueForKey("rtdpc_qzq") as? String
            qzqRiTouDiPinCi.text = dict.valueForKey("ztdpc_qzq") as? String
            
            let ywsxArray1 = dict.valueForKey("ywfw_qzq") as? String
            if (ywsxArray1!.rangeOfString("xj") != nil) {
                XinJian1.selected = true
            }
            if (ywsxArray1!.rangeOfString("wl") != nil) {
                WuLiu1.selected = true
            }
            if (ywsxArray1!.rangeOfString("jy") != nil) {
                JiYou1.selected = true
            }
            if (ywsxArray1!.rangeOfString("bgs") != nil) {
                BaoGuo1.selected = true
            }
            if (ywsxArray1!.rangeOfString("ysp") != nil) {
                YinShuaPin1.selected = true
            }
            if (ywsxArray1!.rangeOfString("bkls") != nil) {
                BaoKanLingShou1.selected = true
            }
            if (ywsxArray1!.rangeOfString("yzcx") != nil) {
                YouZhengChuXu1.selected = true
            }
            if (ywsxArray1!.rangeOfString("ywfw") != nil) {
                MangRenDuWu1.selected = true
            }
            if (ywsxArray1!.rangeOfString("tkzd") != nil) {
                TeKuaiZhuangDi1.selected = true
            }
            if (ywsxArray1!.rangeOfString("bkdy") != nil) {
                BaoKanDingYue1.selected = true
            }
            if (ywsxArray1!.rangeOfString("yzhd") != nil) {
                YouZhengHuiDui1.selected = true
            }
            if (ywsxArray1!.rangeOfString("ywbxh") != nil) {
                YIWuBingXinHan1.selected = true
            }
            if (ywsxArray1!.rangeOfString("lsywbg") != nil) {
                LieShiBaoGuo1.selected = true
            }
            if (ywsxArray1!.rangeOfString("qt") != nil) {
                QiTa1.selected = true
            }
            
            qzqQianZhiYuanYin.text = dict.valueForKey("qzyy_qzq") as? String
            
            //迁址后
            qzhChangSuoDiZhiShi.text = dict.valueForKey("csdz_qzh_s") as? String
            qzhChangSuoDiZhiXian.text = dict.valueForKey("csdz_qzh_xqs") as? String
            qzhChangSuoDiZhiJie.text = dict.valueForKey("csdz_qzh_jx") as? String
            qzhChangSuoDiZhiHao.text = dict.valueForKey("csdz_qzh_h") as? String
            
            qzhYuYuanZhiZhiXianJuLi.text = dict.valueForKey("yyzzxjl_qzh") as? String
            
            if (dict.valueForKey("jyfs_qzh") as? String == "zb")   {
                chooseJIngYingFangShi2.text = "自办"
            }
            if(dict.valueForKey("jyfs_qzh") as? String == "wb") {
                chooseJIngYingFangShi2.text = "委办"
            }
            
            qzhyouZhengBianMa.text = dict.valueForKey("yzbm_qzh") as? String
            
            if(dict.valueForKey("szdy_qzh") as? String == "csdq") {
                chooseSuoZaiDiDian2.text = "城市地区"
            }
            if (dict.valueForKey("szdy_qzh") as? String == "xzdq")   {
                chooseSuoZaiDiDian2.text = "乡镇地区"
            }
            if(dict.valueForKey("szdy_qzh") as? String == "ncdq") {
                chooseSuoZaiDiDian2.text = "农村地区"
            }
            
            qzhKaiYeShiJian.text = dict.valueForKey("kysj_qzh") as? String
            
            if (dict.valueForKey("fwcq_qzh") as? String == "ziy")   {
                chooseFangWuChangQuan2.text = "自有"
            }
            if(dict.valueForKey("fwcq_qzh") as? String == "zuy") {
                chooseFangWuChangQuan2.text = "租用"
            }
            if (dict.valueForKey("fwcq_qzh") as? String == "wucsy")   {
                chooseFangWuChangQuan2.text = "无偿使用"
            }
            if(dict.valueForKey("fwcq_qzh") as? String == "qt") {
                chooseFangWuChangQuan2.text = "其他"
            }
            
            qzhJianZhuMianJi.text = dict.valueForKey("jzmj_qzh") as? String
            
            qzhYingYeShiJianZhouJi.text = dict.valueForKey("zyyr_qzh_ks") as? String
            qzhYingYeShiJianZhiZhouJi.text = dict.valueForKey("zyyr_qzh_js") as? String
            qzhYingYeShiJianJiDian.text = dict.valueForKey("ryysj_qzh_ks") as? String
            qzhYingYeShiJianZhiJiDian.text = dict.valueForKey("ryysj_qzh_js") as? String
            
            qzhKaiXiangPinCi.text = dict.valueForKey("kxpc_qzh") as? String
            qzhZhouTouDiPinCi.text = dict.valueForKey("rtdpc_qzh") as? String
            qzhRiTouDiPinCi.text = dict.valueForKey("ztdpc_qzh") as? String
            
            let ywsxArray2 = dict.valueForKey("ywfw_qzh") as? String
            if (ywsxArray2!.rangeOfString("xj") != nil) {
                XinJian2.selected = true
            }
            if (ywsxArray2!.rangeOfString("wl") != nil) {
                WuLiu2.selected = true
            }
            if (ywsxArray2!.rangeOfString("jy") != nil) {
                JiYou2.selected = true
            }
            if (ywsxArray2!.rangeOfString("bgs") != nil) {
                BaoGuo2.selected = true
            }
            if (ywsxArray2!.rangeOfString("ysp") != nil) {
                YinShuaPin2.selected = true
            }
            if (ywsxArray2!.rangeOfString("bkls") != nil) {
                BaoKanLingShou2.selected = true
            }
            if (ywsxArray2!.rangeOfString("yzcx") != nil) {
                YouZhengChuXu2.selected = true
            }
            if (ywsxArray2!.rangeOfString("ywfw") != nil) {
                MangRenDuWu2.selected = true
            }
            if (ywsxArray2!.rangeOfString("tkzd") != nil) {
                TeKuaiZhuangDi2.selected = true
            }
            if (ywsxArray2!.rangeOfString("bkdy") != nil) {
                BaoKanDingYue2.selected = true
            }
            if (ywsxArray2!.rangeOfString("yzhd") != nil) {
                YouZhengHuiDui2.selected = true
            }
            if (ywsxArray2!.rangeOfString("ywbxh") != nil) {
                YIWuBingXinHan2.selected = true
            }
            if (ywsxArray2!.rangeOfString("lsywbg") != nil) {
                LieShiBaoGuo2.selected = true
            }
            if (ywsxArray2!.rangeOfString("qt") != nil) {
                QiTa2.selected = true
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
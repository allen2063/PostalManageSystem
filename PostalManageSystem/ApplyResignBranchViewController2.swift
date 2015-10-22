//
//  ApplyResignBranchTableViewController2.swift
//  POST
//
//  Created by QiaoLibo on 15/9/1.
//  Copyright (c) 2015年 Qiaolibo. All rights reserved.
//

import UIKit

class ApplyResignBranchViewController2: UIViewController, UIActionSheetDelegate, UITextFieldDelegate, UIScrollViewDelegate {
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("dragging.................................................................................................")
    }
    
    //当键盘出现或改变时调用
    var positionChangeY: CGFloat = 0
    
    func keyboardWillShow(aNotification: NSNotification)
    {
        print("func keyboardWillShow")
        
        let userInfo: NSDictionary = aNotification.userInfo!
        let aValue: NSValue = (userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey) as? NSValue)!
        let keyboardRect: CGRect = aValue.CGRectValue()
        let keyboardHeight: CGFloat = keyboardRect.size.height
        
        let rootView = self.view as! UIScrollView
        
        let realContentOffsetY = rootView.contentOffset.y
        
        print("\(UIScreen.mainScreen().bounds.height)___\(keyboardHeight)___\(textFieldHeight!)___\(realContentOffsetY)")
        
        self.positionChangeY = rootView.contentOffset.y

        if (UIScreen.mainScreen().bounds.height < keyboardHeight + textFieldHeight! - realContentOffsetY)
        {
            if SegmentedControl.selectedSegmentIndex == 0 {
//                rootView.contentSize = CGSize(width: 320, height: 2290)
            } else {
                rootView.contentSize = CGSize(width: 320, height: 840)
            }
            
            UIView.animateWithDuration(0.3, animations: {
                
                rootView.contentOffset.y = (keyboardHeight + self.textFieldHeight! ) - (UIScreen.mainScreen().bounds.height)
                
            })
        }
    }
    
    func keyboardWillHide(aNotification: NSNotification)
    {
        print("func keyboardWillHide")
        
        let rootView = self.view as! UIScrollView
        
//        if SegmentedControl.selectedSegmentIndex == 0 {
////            rootView.contentSize = CGSize(width: 320, height: 2190)
//        } else {
//            rootView.contentSize = CGSize(width: 320, height: 840)
//        }

        UIView.animateWithDuration(0.3, animations: {
            rootView.contentOffset.y = self.positionChangeY
        })
    }
    
    var textFieldHeight: CGFloat?
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("func textFieldShouldBeginEditing")
        
        textFieldHeight = textField.frame.size.height + textField.frame.origin.y + 42
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.textColor = UIColor.blackColor()
    }
    
    var app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var applyResignBranchView: UIView!
    @IBOutlet weak var resignPostSheetView: UIView!
    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    
    @IBAction func resignPostSheetViewSegmentedControlValueChanged(sender: AnyObject) {
        if let segmentedControl = sender as? UISegmentedControl {
            let index = segmentedControl.selectedSegmentIndex
            print("Index: \(index)")
            switch index {
            case 0:
                resignPostSheetView.hidden = true
                applyResignBranchView.hidden = false
                if let rootView = self.view as? UIScrollView {
                    rootView.contentSize = CGSize(width: 320, height: 2190)
                }
            case 1:
                resignPostSheetView.hidden = false
                applyResignBranchView.hidden = true
                if let rootView = self.view as? UIScrollView {
                    rootView.contentSize = CGSize(width: 320, height: 840)
                }
            default:
                break;
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
    
    var SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    var SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    
    @IBOutlet weak var chooseJIngYingFangShi: UILabel!
    @IBOutlet weak var chooseSuoZaiDiDian: UILabel!
    @IBOutlet weak var chooseFangWuChangQuan: UILabel!
    
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
            
            if sender.view == chooseFangWuChangQuan {
                let actionSheet = UIActionSheet(title: "选择房屋产权", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "自有","租用","无偿使用","其他")
                actionSheet.showInView(self.view)
                tapedLabel = 3
            }
            
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if actionSheet.buttonTitleAtIndex(buttonIndex) != "取消"{
            if  tapedLabel == 1 {
                chooseJIngYingFangShi.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseJIngYingFangShi.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 2 {
                chooseSuoZaiDiDian.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseSuoZaiDiDian.textColor = UIColor.blackColor()
            }
            
            if tapedLabel == 3 {
                chooseFangWuChangQuan.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseFangWuChangQuan.textColor = UIColor.blackColor()
            }
            
            if  tapedLabel1 == 1 {
                chooseJIngYingFangShi1.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseJIngYingFangShi1.textColor = UIColor.blackColor()
            }
            
            if tapedLabel1 == 2 {
                chooseSuoZaiDiDian1.text = actionSheet.buttonTitleAtIndex(buttonIndex)
                chooseSuoZaiDiDian1.textColor = UIColor.blackColor()
            }

        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var chooseJIngYingFangShi1: UILabel!
    @IBOutlet weak var chooseSuoZaiDiDian1: UILabel!
    
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
        }
    }

    //撤销营业场所申请TextField
    @IBOutlet weak var shenQingDanWeiMingCheng: UITextField!
    @IBOutlet weak var niCheXiaoYouZhengChangSuoMingCheng: UITextField!
    @IBOutlet weak var beiShenQingDanWeiMingCheng: UITextField!
    @IBOutlet weak var cheXiaoZHuYaoYuanYin: UITextField!
    @IBOutlet weak var cheXiaoShiJianNian: UITextField!
    @IBOutlet weak var cheXiaoShiJianYue: UITextField!
    @IBOutlet weak var cheXiaoDiZhiShi: UITextField!
    @IBOutlet weak var cheXiaoDiZhiXian: UITextField!
    @IBOutlet weak var cheXiaoDiZhiJie: UITextField!
    @IBOutlet weak var niCheXiaoYouZhengYingYeChangSuoMingCheng: UITextField!
    @IBOutlet weak var niCaiQuTiDaiXingCuoShi: UITextField!
    @IBOutlet weak var caiQuCuoShiHouFuWuShuiPing: UITextField!

    //拟撤销营业场所基本情况表TextField
    @IBOutlet weak var youZhengChangSuoMingCheng: UITextField!
    @IBOutlet weak var JingYingFangShi: UILabel!
    @IBOutlet weak var changSuoDiZhiShi: UITextField!
    @IBOutlet weak var changSuoDiZhiXian: UITextField!
    @IBOutlet weak var changSuoDiZhiJie: UITextField!
    @IBOutlet weak var changSuoDiZhiHao: UITextField!
    @IBOutlet weak var changSuoDiZhiJingDu: UITextField!
    @IBOutlet weak var changSuoDiZhiWeiDu: UITextField!
    @IBOutlet weak var youZhengBianMa: UITextField!
    @IBOutlet weak var shangJiDanWei: UITextField!
    @IBOutlet weak var yingYeChangSuoFuZeRen: UITextField!
    @IBOutlet weak var YingYeChangSuoLianXiDianHua: UITextField!
    @IBOutlet weak var fuWuBanJing: UITextField!
    @IBOutlet weak var fuWuRenKou: UITextField!
    @IBOutlet weak var suoZaiDiDian: UILabel!
    @IBOutlet weak var kaiYeShiJian: UITextField!
    @IBOutlet weak var fangWuChanQuan: UILabel!
    @IBOutlet weak var jianZhuMianJi: UITextField!
    @IBOutlet weak var fuWuQuYu: UITextField!
    
    @IBOutlet weak var zhougYIngYeRiZhouJi: UITextField!
    @IBOutlet weak var zhougYIngYeRiZhiZhouJi: UITextField!
    @IBOutlet weak var riYingYeRiJiDian: UITextField!
    @IBOutlet weak var riYingYeRiZhiJiDian: UITextField!
    
    @IBOutlet weak var kaiXIangPinCi: UITextField!
    @IBOutlet weak var riTouDiPinCi: UITextField!
    @IBOutlet weak var zhouTouDiPinCi: UITextField!
    
    
    @IBOutlet weak var shouRu: UITextField!
    @IBOutlet weak var zongShouRu: UITextField!
    @IBOutlet weak var shouRuHanJian: UITextField!
    @IBOutlet weak var shuRuBaoGuo: UITextField!
    @IBOutlet weak var shouRuYinShuaPin: UITextField!
    @IBOutlet weak var shouRuHuiDui: UITextField!
    @IBOutlet weak var shouRuBaoKan: UITextField!
    @IBOutlet weak var shouRuQiTa: UITextField!
    @IBOutlet weak var shouRuDaiLiYeWu: UITextField!
    
    @IBOutlet weak var yeWuLiangHanJian: UITextField!
    @IBOutlet weak var yeWuLiangBaoGuo: UITextField!
    @IBOutlet weak var yeWuLiangYinShuaPin: UITextField!
    @IBOutlet weak var yeWuLiangHuiDui: UITextField!
    @IBOutlet weak var yeWuLiangBaoKan: UITextField!
    @IBOutlet weak var yeWuLiangDaiLiYeWu: UITextField!
    
    //邮政企业撤销邮政营业场所登记表
    @IBOutlet weak var yingYeChangSuoMingCheng1: UITextField!
    @IBOutlet weak var changSuoDiZhiShi1: UITextField!
    @IBOutlet weak var changSuoDiZhiXian1: UITextField!
    @IBOutlet weak var changSuoDiZhiJie1: UITextField!
    @IBOutlet weak var changSuoDiZhiHao1: UITextField!
    @IBOutlet weak var changSuoDiZhiJingDu1: UITextField!
    @IBOutlet weak var changSuoDiZhiWeiDu1: UITextField!
    
    @IBOutlet weak var fuZeRen1: UITextField!
    @IBOutlet weak var lianXiDianHua1: UITextField!
    @IBOutlet weak var youZhengBianMa1: UITextField!
    @IBOutlet weak var shangJiDanWei1: UITextField!
    @IBOutlet weak var fuWuQuYu1: UITextField!
    @IBOutlet weak var qiTaShiXiang1: UITextField!
    @IBOutlet weak var cheXiaoYuanYin1: UITextField!
    @IBOutlet weak var niCheXiaoRiQi1: UITextField!
    
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
            if sender == JiYou {
                if JiYou.selected == false {
                    JiYou.selected = true
                } else {
                    JiYou.selected = false
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
        var COMMIT_OK = 0
        
        let infoOfCxyzpbfwyycssq = InfoOfCxyzpbfwyycssq()
        
        if shenQingDanWeiMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.zgyzjtfgsmc = shenQingDanWeiMingCheng.text
        } else if (shenQingDanWeiMingCheng.text == "")
        {
            
            shenQingDanWeiMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if niCheXiaoYouZhengChangSuoMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.btyzpbfwyycsmc = niCheXiaoYouZhengChangSuoMingCheng.text
        } else if (niCheXiaoYouZhengChangSuoMingCheng.text == "")
        {
            
            niCheXiaoYouZhengChangSuoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if beiShenQingDanWeiMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.syzgljmc = beiShenQingDanWeiMingCheng.text
        } else if (beiShenQingDanWeiMingCheng.text == "")
        {
            beiShenQingDanWeiMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if cheXiaoZHuYaoYuanYin.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.sqcxdzyyy = cheXiaoZHuYaoYuanYin.text
        } else if (cheXiaoZHuYaoYuanYin.text == "")
        {
            cheXiaoZHuYaoYuanYin.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        
        if cheXiaoShiJianNian.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.cxsj_n = cheXiaoShiJianNian.text
        } else if (cheXiaoShiJianNian.text == "")
        {
            cheXiaoShiJianNian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if cheXiaoShiJianYue.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.cxsj_y = cheXiaoShiJianYue.text
        } else if (cheXiaoShiJianYue.text == "")
        {
            cheXiaoShiJianYue.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if cheXiaoDiZhiShi.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.cxdz_s = cheXiaoDiZhiShi.text
        } else if (cheXiaoDiZhiShi.text == "")
        {
            cheXiaoDiZhiShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        
        if cheXiaoDiZhiXian.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.cxdz_xqs = cheXiaoDiZhiXian.text
        } else if (cheXiaoDiZhiXian.text == "")
        {
            cheXiaoDiZhiXian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if cheXiaoDiZhiJie.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.cxdz_jx = cheXiaoDiZhiJie.text
        } else if (cheXiaoDiZhiJie.text == "")
        {
            cheXiaoDiZhiJie.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if niCheXiaoYouZhengYingYeChangSuoMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.yzpbfwyycsmc = niCheXiaoYouZhengYingYeChangSuoMingCheng.text
        } else if (niCheXiaoYouZhengYingYeChangSuoMingCheng.text == "")
        {
            niCheXiaoYouZhengYingYeChangSuoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if niCaiQuTiDaiXingCuoShi.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.ncqdtdxcs = niCaiQuTiDaiXingCuoShi.text
        } else if (niCaiQuTiDaiXingCuoShi.text == "")
        {
            niCaiQuTiDaiXingCuoShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        
        if caiQuCuoShiHouFuWuShuiPing.text != "" {
            COMMIT_OK += 1
            infoOfCxyzpbfwyycssq.yzpbyycsszhyzpbfwztsp = caiQuCuoShiHouFuWuShuiPing.text
        } else if (caiQuCuoShiHouFuWuShuiPing.text == "")
        {
            caiQuCuoShiHouFuWuShuiPing.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        //上传图片字段
        if uploadBtn1PicVC != nil {
            infoOfCxyzpbfwyycssq.gsyyzzfyj = (uploadBtn1PicVC?.picUrl)!
        }
        print(uploadBtn1PicVC?.picUrl)
        if infoOfCxyzpbfwyycssq.gsyyzzfyj == "" {
            UIAlertView(title: "请上传图片", message: "上传拟撤销邮政普遍服务营业场所的工商营业执照复印件", delegate: nil, cancelButtonTitle: "返回上传").show()
        } else {
            COMMIT_OK += 1
        }
        
        if uploadBtn2PicVC != nil {
            infoOfCxyzpbfwyycssq.zmwj = (uploadBtn2PicVC?.picUrl)!
        }
        print(uploadBtn2PicVC?.picUrl)
        if infoOfCxyzpbfwyycssq.zmwj == "" {
            UIAlertView(title: "请上传图片", message: "上传拟撤销邮政普遍服务营业场所原因的证明文件", delegate: nil, cancelButtonTitle: "返回上传").show()
        } else {
            COMMIT_OK += 1
        }

        
        
        
        let infoOfNcxyzpbfwyycsjbqkb = InfoOfNcxyzpbfwyycsjbqkb()
        
        if youZhengChangSuoMingCheng.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yzcsmc = youZhengChangSuoMingCheng.text
        } else if (youZhengChangSuoMingCheng.text == "")
        {
            youZhengChangSuoMingCheng.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        //infoOfNcxyzpbfwyycsjbqkb.jyfs = chooseJIngYingFangShi.text
        if  chooseJIngYingFangShi.text == "未选择" {
            chooseJIngYingFangShi.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseJIngYingFangShi.text == "自办")  {
                infoOfNcxyzpbfwyycsjbqkb.jyfs = "zb"
            }
            if(chooseJIngYingFangShi.text == "委办") {
                infoOfNcxyzpbfwyycsjbqkb.jyfs = "wb"
            }
        }
        
        
        if changSuoDiZhiShi.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.csdz_s = changSuoDiZhiShi.text
        } else if (changSuoDiZhiShi.text == "")
        {
            changSuoDiZhiShi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if changSuoDiZhiXian.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.csdz_xqs = changSuoDiZhiXian.text
        } else if (changSuoDiZhiXian.text == "")
        {
            changSuoDiZhiXian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if changSuoDiZhiJie.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.csdz_jx = changSuoDiZhiJie.text
        } else if (changSuoDiZhiJie.text == "")
        {
            changSuoDiZhiJie.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if changSuoDiZhiHao.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.csdz_h = changSuoDiZhiHao.text
        } else if (changSuoDiZhiHao.text == "")
        {
            changSuoDiZhiHao.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        let isMatchJingDu = rxJingWeiDu.isMatch(changSuoDiZhiJingDu.text)
        if isMatchJingDu {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.csdz_jd = changSuoDiZhiJingDu.text
        } else {
            let alertView = UIAlertView(title: "经度不符合要求", message:  "经度最大值:27.366667 最小值:26.183333", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
            //            let label = UILabel(frame: CGRect(x: jingDu.frame.origin.x, y: jingDu.frame.origin.y + 40, width: 100, height: 100))
            //            label.backgroundColor = UIColor.blueColor()
            
            print("经度不符合要求")
            changSuoDiZhiJingDu.attributedPlaceholder = NSAttributedString(string: "不符要求"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchWeiDu = rxJingWeiDu.isMatch(changSuoDiZhiWeiDu.text)
        if isMatchWeiDu {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.csdz_wd = changSuoDiZhiWeiDu.text
        } else {
            
            let alertView = UIAlertView(title: "纬度不符合要求", message:  "纬度最大值:107.283333 最小值:106.116667", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
            
            print("纬度不符合要求")
            changSuoDiZhiWeiDu.attributedPlaceholder = NSAttributedString(string: "不符要求"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchYouBian = rxYouBian.isMatch(youZhengBianMa.text)
        if isMatchYouBian {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yzbm = youZhengBianMa.text
        } else {
            
            print("邮政编码不符合要求")
            //            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            youZhengBianMa.text = "不符要求"
            youZhengBianMa.textColor = UIColor.redColor()
        }

        
        if shangJiDanWei.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.sjdw = shangJiDanWei.text
        } else if (shangJiDanWei.text == "")
        {
            shangJiDanWei.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }


        if yingYeChangSuoFuZeRen.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsf = yingYeChangSuoFuZeRen.text
        } else if (yingYeChangSuoFuZeRen.text == "")
        {
            yingYeChangSuoFuZeRen.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
////////////
        let isMatchLianXiDianHua = rxLianXiDianHua.isMatch(YingYeChangSuoLianXiDianHua.text)
        if isMatchLianXiDianHua {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycslxdh = YingYeChangSuoLianXiDianHua.text
        } else {
            
            print("联系电话不符合要求")
            //            lianXiDianHua.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            YingYeChangSuoLianXiDianHua.text = "不符要求"
            YingYeChangSuoLianXiDianHua.textColor = UIColor.redColor()
        }

        
        let isMatchFuWuBanJing = rxFuWuBanJing.isMatch(fuWuBanJing.text)
        if isMatchFuWuBanJing {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.fwbj = fuWuBanJing.text
        } else {
            
            print("服务半径不符合要求")
            //            fuWuBanJing.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            fuWuBanJing.text = "不符要求"
            fuWuBanJing.textColor = UIColor.redColor()
        }
        
        //infoOfNcxyzpbfwyycsjbqkb.szdd = chooseSuoZaiDiDian.text
        if  chooseSuoZaiDiDian.text == "未选择" {
            chooseSuoZaiDiDian.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseSuoZaiDiDian.text == "城市地区")  {
                infoOfNcxyzpbfwyycsjbqkb.szdd = "csdq"
            }
            if(chooseSuoZaiDiDian.text == "乡镇地区") {
                infoOfNcxyzpbfwyycsjbqkb.szdd = "xzdq"
            }
            if(chooseSuoZaiDiDian.text == "农村地区") {
                infoOfNcxyzpbfwyycsjbqkb.szdd = "ncdq"
            }
        }
        
        let isMatchFuWuRenKou = rxFuWuRenKou.isMatch(fuWuRenKou.text)
        if isMatchFuWuRenKou {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.fwrk = fuWuRenKou.text
        } else {
            
            print("服务人口不符合要求")
            //            fuWuRenKou.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            fuWuRenKou.text = "不符要求"
            fuWuRenKou.textColor = UIColor.redColor()
        }
        
        if kaiYeShiJian.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.kysj = kaiYeShiJian.text
        } else if (kaiYeShiJian.text == "")
        {
            kaiYeShiJian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        
        //infoOfNcxyzpbfwyycsjbqkb.fwcq = chooseFangWuChangQuan.text
        if  chooseFangWuChangQuan.text == "未选择" {
            chooseFangWuChangQuan.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            if (chooseFangWuChangQuan.text == "自有")  {
                infoOfNcxyzpbfwyycsjbqkb.fwcq = "ziy"
            }
            if(chooseFangWuChangQuan.text == "租用") {
                infoOfNcxyzpbfwyycsjbqkb.fwcq = "zuy"
            }
            if (chooseFangWuChangQuan.text == "无偿使用")  {
                infoOfNcxyzpbfwyycsjbqkb.fwcq = "wucsy"
            }
            if(chooseFangWuChangQuan.text == "其他") {
                infoOfNcxyzpbfwyycsjbqkb.fwcq = "qt"
            }
        }
        
        let isMatchJianZhuMianJi = rxJianZhuMianJi.isMatch(jianZhuMianJi.text)
        if isMatchJianZhuMianJi {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.jzmj = jianZhuMianJi.text
        } else {
            
            print("建筑面积不符合要求")
            //            jianZhuMianJi.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            jianZhuMianJi.text = "不符要求"
            jianZhuMianJi.textColor = UIColor.redColor()
        }
        
        if fuWuQuYu.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.fwqy = fuWuQuYu.text
        } else if (fuWuQuYu.text == "")
        {
            fuWuQuYu.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if zhougYIngYeRiZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.zyyr_ks = zhougYIngYeRiZhouJi.text
        } else if (zhougYIngYeRiZhouJi.text == "")
        {
            zhougYIngYeRiZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if zhougYIngYeRiZhiZhouJi.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.zyyr_js = zhougYIngYeRiZhiZhouJi.text
        } else if (zhougYIngYeRiZhiZhouJi.text == "")
        {
            zhougYIngYeRiZhiZhouJi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if riYingYeRiJiDian.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.ryysj_ks = riYingYeRiJiDian.text
        } else if (riYingYeRiJiDian.text == "")
        {
            riYingYeRiJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if riYingYeRiZhiJiDian.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.ryysj_js = riYingYeRiZhiJiDian.text
        } else if (riYingYeRiZhiJiDian.text == "")
        {
            riYingYeRiZhiJiDian.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if kaiXIangPinCi.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.kxpc = kaiXIangPinCi.text
        } else if (kaiXIangPinCi.text == "")
        {
            kaiXIangPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        if riTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.rtdpc = riTouDiPinCi.text
        } else if (riTouDiPinCi.text == "")
        {
            riTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if zhouTouDiPinCi.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.ztdpc = zhouTouDiPinCi.text
        } else if (zhouTouDiPinCi.text == "")
        {
            zhouTouDiPinCi.attributedPlaceholder = NSAttributedString(string: "不为空"
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
                infoOfNcxyzpbfwyycsjbqkb.ywfw += "xj"
                stringForEdit += "xj"
            }
            if WuLiu.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",wl"
                stringForEdit += ",wl"
            }
            if JiYou.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",jy"
                stringForEdit += ",jy"
            }
            if BaoGuo.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",bgs"
                stringForEdit += ",bgs"
            }
            if YinShuaPin.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",ysp"
                stringForEdit += ",ysp"
            }
            if BaoKanLingShou.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",bkls"
                stringForEdit += ",bkls"
            }
            if YouZhengChuXu.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",yzcx"
                stringForEdit += ",yzcx"
            }
            if MangRenDuWu.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",mrdw"
                stringForEdit += ",mrdw"
            }
            if TeKuaiZhuangDi.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",tkzd"
                stringForEdit += ",tkzd"
            }
            if BaoKanDingYue.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",bkdy"
                stringForEdit += ",bkdy"
            }
            if YouZhengHuiDui.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",yzhd"
                stringForEdit += ",yzhd"
            }
            if YIWuBingXinHan.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",ywbxh"
                stringForEdit += ",ywbxh"
            }
            if LieShiBaoGuo.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",lsywbg"
                stringForEdit += ",lsywbg"
            }
            if QiTa.selected {
                infoOfNcxyzpbfwyycsjbqkb.ywfw += ",qt"
                stringForEdit += ",qt"
            }
        }
        
        if zongShouRu.text != "" {
            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.ncxyzpbfwyycszsr = zongShouRu.text
        } else if (zongShouRu.text == "")
        {
            zongShouRu.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

//        if shouRuHanJian.text != "" {
//            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrhj = shouRuHanJian.text
//        } else if (shouRuHanJian.text == "")
//        {
//            shouRuHanJian.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        if shuRuBaoGuo.text != "" {
//            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrbg = shuRuBaoGuo.text
//        } else if (shuRuBaoGuo.text == "")
//        {
//            shuRuBaoGuo.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        if shouRuYinShuaPin.text != "" {
//            COMMIT_OK += 1
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrysp = shouRuYinShuaPin.text
//        } else if (shouRuYinShuaPin.text == "")
//        {
//            shouRuYinShuaPin.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        

//        if shouRuHuiDui.text != "" {
//            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrhd = shouRuHuiDui.text
//        } else if (shouRuHuiDui.text == "")
//        {
//            shouRuHuiDui.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        if shouRuBaoKan.text != "" {
//            COMMIT_OK += 1
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrbk = shouRuBaoKan.text
//        } else if (shouRuBaoKan.text == "")
//        {
//            shouRuBaoKan.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        
//        if shouRuDaiLiYeWu.text != "" {
//            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrdlyw = shouRuDaiLiYeWu.text
//        } else if (shouRuDaiLiYeWu.text == "")
//        {
//            shouRuDaiLiYeWu.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        if shouRuQiTa.text != "" {
//            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrqt = shouRuQiTa.text
//        } else if (shouRuQiTa.text == "")
//        {
//            shouRuQiTa.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        if yeWuLiangHanJian.text != "" {
//            COMMIT_OK += 1
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlhj = yeWuLiangHanJian.text
//        } else if (yeWuLiangHanJian.text == "")
//        {
//            yeWuLiangHanJian.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        if yeWuLiangBaoGuo.text != "" {
//            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlbg = yeWuLiangBaoGuo.text
//        } else if (yeWuLiangBaoGuo.text == "")
//        {
//            yeWuLiangBaoGuo.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        if yeWuLiangYinShuaPin.text != "" {
//            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlysp = yeWuLiangYinShuaPin.text
//        } else if (yeWuLiangYinShuaPin.text == "")
//        {
//            yeWuLiangYinShuaPin.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
//
//        if yeWuLiangHuiDui.text != "" {
//            COMMIT_OK += 1
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlhd = yeWuLiangHuiDui.text
//        } else if (yeWuLiangHuiDui.text == "")
//        {
//            yeWuLiangHuiDui.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
//        
//        if yeWuLiangBaoKan.text != "" {
//            COMMIT_OK += 1
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlbk = yeWuLiangBaoKan.text
//        } else if (yeWuLiangBaoKan.text == "")
//        {
//            yeWuLiangBaoKan.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }

//        if yeWuLiangDaiLiYeWu.text != "" {
//            COMMIT_OK += 1
            infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywldlyw = yeWuLiangDaiLiYeWu.text
//        } else if (yeWuLiangDaiLiYeWu.text == "")
//        {
//            yeWuLiangDaiLiYeWu.attributedPlaceholder = NSAttributedString(string: "不为空"
//                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
//        }
        
        
        print("\(COMMIT_OK)", terminator: "\n")
        
        if (COMMIT_OK == 42) {
            if app.ServerData == 0 {
//                  app.network.editWithInterface("bsdtApi/add", andInfo: ClassToJSON.getObjectData(infoOfCxyzpbfwyycssq) , andExtraInfo: ClassToJSON.getObjectData(infoOfNcxyzpbfwyycsjbqkb))
                app.network.addWithInterface("Cxpbfww", andUser: app.userData, andInfo:  ClassToJSON.getObjectData(infoOfCxyzpbfwyycssq), andExtraInfo: ClassToJSON.getObjectData(infoOfNcxyzpbfwyycsjbqkb))
            }
            
            if app.ServerData == 2 {
                let info1 = app.applyResignDic.valueForKey("info1")
                info1!.setValue(shenQingDanWeiMingCheng.text, forKey: "zgyzjtfgsmc")
                info1!.setValue(niCheXiaoYouZhengChangSuoMingCheng.text, forKey: "btyzpbfwyycsmc")
                info1!.setValue(beiShenQingDanWeiMingCheng.text, forKey: "syzgljmc")
                info1!.setValue(cheXiaoZHuYaoYuanYin.text, forKey: "sqcxdzyyy")
                info1!.setValue(cheXiaoShiJianNian.text, forKey: "cxsj_n")
                info1!.setValue(cheXiaoShiJianYue.text, forKey: "cxsj_y")
                info1!.setValue(cheXiaoDiZhiShi.text, forKey: "cxdz_s")
                info1!.setValue(cheXiaoDiZhiXian.text, forKey: "cxdz_xqs")
                info1!.setValue(cheXiaoDiZhiJie.text, forKey: "cxdz_jx")
                info1!.setValue(niCheXiaoYouZhengYingYeChangSuoMingCheng.text, forKey: "yzpbfwyycsmc")
                info1!.setValue(niCaiQuTiDaiXingCuoShi.text, forKey: "ncqdtdxcs")
                info1!.setValue(caiQuCuoShiHouFuWuShuiPing.text, forKey: "yzpbyycsszhyzpbfwztsp")
            
                let info2 = app.applyResignDic.valueForKey("info2")
                info2!.setValue(youZhengChangSuoMingCheng.text, forKey: "yzcsmc")
                info2!.setValue(chooseJIngYingFangShi.text, forKey: "jyfs")
                info2!.setValue(changSuoDiZhiShi.text, forKey: "csdz_s")
                info2!.setValue(changSuoDiZhiXian.text, forKey: "csdz_xqs")
                info2!.setValue(changSuoDiZhiJie.text, forKey: "csdz_jx")
                info2!.setValue(changSuoDiZhiHao.text, forKey: "csdz_h")
                info2!.setValue(changSuoDiZhiJingDu.text, forKey: "csdz_jd")
                info2!.setValue(changSuoDiZhiWeiDu.text, forKey: "csdz_wd")
                info2!.setValue(youZhengBianMa.text, forKey: "yzbm")
                info2!.setValue(shangJiDanWei.text, forKey: "sjdw")
                info2!.setValue(yingYeChangSuoFuZeRen.text, forKey: "yycsf")
                info2!.setValue(YingYeChangSuoLianXiDianHua.text, forKey: "yycslxdh")
                info2!.setValue(fuWuBanJing.text, forKey: "fwbj")
                info2!.setValue(chooseSuoZaiDiDian.text, forKey: "szdd")
                info2!.setValue(fuWuRenKou.text, forKey: "fwrk")
                info2!.setValue(kaiYeShiJian.text, forKey: "kysj")
                info2!.setValue(chooseFangWuChangQuan.text, forKey: "fwcq")
                info2!.setValue(jianZhuMianJi.text, forKey: "jzmj")
                info2!.setValue(fuWuQuYu.text, forKey: "fwqy")
                info2!.setValue(zhougYIngYeRiZhouJi.text, forKey: "zyyr_ks")
                info2!.setValue(zhougYIngYeRiZhiZhouJi.text, forKey: "zyyr_js")
                info2!.setValue(riYingYeRiJiDian.text, forKey: "ryysj_ks")
                info2!.setValue(riYingYeRiZhiJiDian.text, forKey: "ryysj_js")
                info2!.setValue(kaiXIangPinCi.text, forKey: "kxpc")
                info2!.setValue(riTouDiPinCi.text, forKey: "rtdpc")
                info2!.setValue(zhouTouDiPinCi.text, forKey: "ztdpc")
                info2!.setValue(stringForEdit, forKey: "ywfw")
                info2!.setValue(zongShouRu.text, forKey: "ncxyzpbfwyycszsr")
                info2!.setValue(shouRuHanJian.text, forKey: "yycsjyndywsrhj")
                info2!.setValue(shuRuBaoGuo.text, forKey: "yycsjyndywsrbg")
                info2!.setValue(shouRuYinShuaPin.text, forKey: "yycsjyndywsrysp")
                info2!.setValue(shouRuHuiDui.text, forKey: "yycsjyndywsrhd")
                info2!.setValue(shouRuBaoKan.text, forKey: "yycsjyndywsrbk")
                info2!.setValue(shouRuDaiLiYeWu.text, forKey: "yycsjyndywsrdlyw")
                info2!.setValue(shouRuQiTa.text, forKey: "yycsjyndywsrqt")
                info2!.setValue(yeWuLiangHanJian.text, forKey: "yycsjynzyywlhj")
                info2!.setValue(yeWuLiangBaoGuo.text, forKey: "yycsjynzyywlbg")
                info2!.setValue(yeWuLiangYinShuaPin.text, forKey: "yycsjynzyywlysp")
                info2!.setValue(yeWuLiangHuiDui.text, forKey: "yycsjynzyywlhd")
                info2!.setValue(yeWuLiangBaoKan.text, forKey: "yycsjynzyywlbk")
                info2!.setValue(yeWuLiangDaiLiYeWu.text, forKey: "yycsjynzyywldlyw")
                
                app.network.editWithInterface("Cxpbfwwd", andInfo: info1 as! [NSObject : AnyObject] , andExtraInfo:info2 as! [NSObject : AnyObject])
                
                
//                  app.network.editWithInterface("Cxpbfww", andInfo: ClassToJSON.getObjectData(infoOfCxyzpbfwyycssq) , andExtraInfo: ClassToJSON.getObjectData(infoOfNcxyzpbfwyycsjbqkb))
            }
        }
//        println("\(ClassToJSON.getObjectData(infoOfCxyzpbfwyycssq))")
//        println("\(ClassToJSON.getObjectData(infoOfNcxyzpbfwyycsjbqkb))")
        
    }

    @IBAction func commit2(sender: AnyObject) {
        var COMMIT_OK = 0
        
        let infoOfyzqycxyzyycsdjb = InfoOfyzqycxyzyycsdjb()
        
        if yingYeChangSuoMingCheng1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.yzyycsmc = yingYeChangSuoMingCheng1.text
        } else if (yingYeChangSuoMingCheng1.text == "")
        {
            yingYeChangSuoMingCheng1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if changSuoDiZhiShi1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.csdz_s = changSuoDiZhiShi1.text
        } else if (changSuoDiZhiShi1.text == "")
        {
            changSuoDiZhiShi1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if changSuoDiZhiXian1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.csdz_xqs = changSuoDiZhiXian1.text
        } else if (changSuoDiZhiXian1.text == "")
        {
            changSuoDiZhiXian1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if changSuoDiZhiJie1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.csdz_jx = changSuoDiZhiJie1.text
        } else if (changSuoDiZhiJie1.text == "")
        {
            changSuoDiZhiJie1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if changSuoDiZhiHao1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.csdz_h = changSuoDiZhiHao1.text
        } else if (changSuoDiZhiHao1.text == "")
        {
            changSuoDiZhiHao1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchJingDu = rxJingWeiDu.isMatch(changSuoDiZhiJingDu1.text)
        if isMatchJingDu {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.csdz_jd = changSuoDiZhiJingDu1.text
        } else {
            
            let alertView = UIAlertView(title: "经度不符合要求", message:  "经度最大值:27.366667 最小值:26.183333", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
            //            let label = UILabel(frame: CGRect(x: jingDu.frame.origin.x, y: jingDu.frame.origin.y + 40, width: 100, height: 100))
            //            label.backgroundColor = UIColor.blueColor()
            
            print("经度不符合要求")
            changSuoDiZhiJingDu1.attributedPlaceholder = NSAttributedString(string: "不符要求"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        
        let isMatchWeiDu = rxJingWeiDu.isMatch(changSuoDiZhiWeiDu1.text)
        if isMatchWeiDu {
            COMMIT_OK += 1
        infoOfyzqycxyzyycsdjb.csdz_wd = changSuoDiZhiWeiDu1.text
        } else {
            
            let alertView = UIAlertView(title: "纬度不符合要求", message:  "纬度最大值:107.283333 最小值:106.116667", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
            
            print("纬度不符合要求")
            changSuoDiZhiWeiDu1.attributedPlaceholder = NSAttributedString(string: "不符要求"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        
        if fuZeRen1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.fzr = fuZeRen1.text
        } else if (fuZeRen1.text == "")
        {
            fuZeRen1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        let isMatchLianXiDianHua = rxLianXiDianHua.isMatch(lianXiDianHua1.text)
        if isMatchLianXiDianHua {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.lxdh = lianXiDianHua1.text
        } else {
            
            print("联系电话不符合要求")
            //            lianXiDianHua.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            lianXiDianHua1.text = "不符要求"
            lianXiDianHua1.textColor = UIColor.redColor()
        }
        
        let isMatchYouBian = rxYouBian.isMatch(youZhengBianMa1.text)
        if isMatchYouBian {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.yzbm = youZhengBianMa1.text
        } else {
            
            print("邮政编码不符合要求")
            //            youBian.attributedPlaceholder = NSAttributedString(string: "不符要求"
            //                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            youZhengBianMa1.text = "不符要求"
            youZhengBianMa1.textColor = UIColor.redColor()
        }
        
        if shangJiDanWei1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.sjdw = shangJiDanWei1.text
        } else if (shangJiDanWei1.text == "")
        {
            shangJiDanWei1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if fuWuQuYu1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.fwqy = fuWuQuYu1.text
        } else if (fuWuQuYu1.text == "")
        {
            fuWuQuYu1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if  chooseSuoZaiDiDian1.text == "未选择" {
            chooseSuoZaiDiDian1.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            //infoOfyzqycxyzyycsdjb.szdd = chooseSuoZaiDiDian1.text
            if (chooseSuoZaiDiDian1.text == "城市地区")  {
                infoOfyzqycxyzyycsdjb.szdd = "csdq"
            }
            if(chooseSuoZaiDiDian1.text == "乡镇地区") {
                infoOfyzqycxyzyycsdjb.szdd = "xzdq"
            }
            if(chooseSuoZaiDiDian1.text == "农村地区") {
                infoOfyzqycxyzyycsdjb.szdd = "ncdq"
            }
        }
        
        
        if  chooseJIngYingFangShi1.text == "未选择" {
            chooseJIngYingFangShi1.textColor = UIColor.redColor()
        } else {
            
            COMMIT_OK += 1
            //infoOfyzqycxyzyycsdjb.jyfs = chooseJIngYingFangShi1.text
            if (chooseJIngYingFangShi1.text == "自办")  {
                infoOfyzqycxyzyycsdjb.jyfs = "zb"
            }
            if(chooseJIngYingFangShi1.text == "委办") {
                infoOfyzqycxyzyycsdjb.jyfs = "wb"
            }
        }
        
        var stringForEdit = ""
        if ((XinJian1.selected || WuLiu1.selected || JiYou1.selected || BaoGuo1.selected || YinShuaPin1.selected || BaoKanLingShou1.selected || YouZhengChuXu1.selected || MangRenDuWu1.selected || TeKuaiZhuangDi1.selected || BaoKanDingYue1.selected || YouZhengHuiDui1.selected || YIWuBingXinHan1.selected || LieShiBaoGuo1.selected || QiTa1.selected) == false)
        {
            
            let alertView = UIAlertView(title: "须选择业务范围", message:  "业务范围不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            if XinJian1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += "xj"
                stringForEdit += "xj"
            }
            if WuLiu1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",wl"
                stringForEdit += ",wl"
            }
            if JiYou1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",jy"
                stringForEdit += ",jy"
            }
            if BaoGuo1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",bgs"
                stringForEdit += ",bgs"
            }
            if YinShuaPin1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",ysp"
                stringForEdit += ",ysp"
            }
            if BaoKanLingShou1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",bkls"
                stringForEdit += ",bkls"
            }
            if YouZhengChuXu1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",yzcx"
                stringForEdit += ",yzcx"
            }
            if MangRenDuWu1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",mrdw"
                stringForEdit += ",mrdw"
            }
            if TeKuaiZhuangDi1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",tkzd"
                stringForEdit += ",tkzd"
            }
            if BaoKanDingYue1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",bkdy"
                stringForEdit += ",bkdy"
            }
            if YouZhengHuiDui1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",yzhd"
                stringForEdit += ",yzhd"
            }
            if YIWuBingXinHan1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",ywbxh"
                stringForEdit += ",ywbxh"
            }
            if LieShiBaoGuo1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",lsywbg"
                stringForEdit += ",lsywbg"
            }
            if QiTa1.selected {
                infoOfyzqycxyzyycsdjb.ywfw += ",qt"
                stringForEdit += ",qt"
            }
        }
        
        if qiTaShiXiang1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.qtsx = qiTaShiXiang1.text
        } else if (qiTaShiXiang1.text == "")
        {
            qiTaShiXiang1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }

        if cheXiaoYuanYin1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.cxyy = cheXiaoYuanYin1.text
        } else if (cheXiaoYuanYin1.text == "")
        {
            cheXiaoYuanYin1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        if niCheXiaoRiQi1.text != "" {
            COMMIT_OK += 1
            infoOfyzqycxyzyycsdjb.ncxrq = niCheXiaoRiQi1.text
        } else if (niCheXiaoRiQi1.text == "")
        {
            niCheXiaoRiQi1.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        }
        
        
        print("\(COMMIT_OK)", terminator: "\n")
        
        if (COMMIT_OK == 18) {
            if app.ServerData == 0 {
//                app.network.editWithInterface("Cxfpbfwwd", andInfo: ClassToJSON.getObjectData(infoOfyzqycxyzyycsdjb) , andExtraInfo:nil)
                app.network.addWithInterface("Cxfpbfwwd", andUser: app.userData, andInfo:  ClassToJSON.getObjectData(infoOfyzqycxyzyycsdjb), andExtraInfo: nil)
            }
            
            if app.ServerData == 2 {
                app.applyResignDic.setValue(yingYeChangSuoMingCheng1.text, forKey: "yzyycsmc")
                app.applyResignDic.setValue(changSuoDiZhiShi1.text, forKey: "csdz_s")
                app.applyResignDic.setValue(changSuoDiZhiXian1.text, forKey: "csdz_xqs")
                app.applyResignDic.setValue(changSuoDiZhiJie1.text, forKey: "csdz_jx")
                app.applyResignDic.setValue(changSuoDiZhiHao1.text, forKey: "csdz_h")
                app.applyResignDic.setValue(changSuoDiZhiJingDu1.text, forKey: "csdz_jd")
                app.applyResignDic.setValue(changSuoDiZhiWeiDu1.text, forKey: "csdz_wd")
                app.applyResignDic.setValue(fuZeRen1.text, forKey: "fzr")
                app.applyResignDic.setValue(lianXiDianHua1.text, forKey: "lxdh")
                app.applyResignDic.setValue(youZhengBianMa1.text, forKey: "yzbm")
                app.applyResignDic.setValue(shangJiDanWei1.text, forKey: "sjdw")
                app.applyResignDic.setValue(fuWuQuYu1.text, forKey: "fwqy")
                app.applyResignDic.setValue(chooseSuoZaiDiDian1.text, forKey: "szdd")
                app.applyResignDic.setValue(chooseJIngYingFangShi1.text, forKey: "jyfs")
                app.applyResignDic.setValue(stringForEdit, forKey: "ywfw")
                app.applyResignDic.setValue(qiTaShiXiang1.text, forKey: "qtsx")
                app.applyResignDic.setValue(cheXiaoYuanYin1.text, forKey: "cxyy")
                app.applyResignDic.setValue(niCheXiaoRiQi1.text, forKey: "ncxrq")
                
                app.network.editWithInterface("Cxfpbfwwd", andInfo: app.applyResignDic as [NSObject : AnyObject] , andExtraInfo:nil)
            }
        }
    
//        ClassToJSON.getObjectData(infoOfyzqycxyzyycsdjb)
        
//        println("\(ClassToJSON.getObjectData(infoOfyzqycxyzyycsdjb))")
    }
    
    override func viewDidDisappear(animated: Bool) {
        app.ServerData = 0
    }
    
    @IBOutlet var tap1: UITapGestureRecognizer!
    @IBOutlet var tap2: UITapGestureRecognizer!
    @IBOutlet var tap3: UITapGestureRecognizer!
    @IBOutlet var tap4: UITapGestureRecognizer!
    @IBOutlet var tap5: UITapGestureRecognizer!
    
    
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
            
            if SegmentedControl.selectedSegmentIndex == 0 {
                textViewOnBkView.text = app.applyResignDic.valueForKey("info1")!.valueForKey("sppl") as? String
            }
            else if SegmentedControl.selectedSegmentIndex == 1 {
                textViewOnBkView.text = app.applyResignDic.valueForKey("sppl") as? String
            }
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
    
    

//    @IBOutlet weak var view1: UIView!
//    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var rootView: UIView!
    
    @IBOutlet weak var commitBtn1: UIButton!
    @IBOutlet weak var commitBtn2: UIButton!
    
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
        labelNav.text = "申请撤销网点"
        self.navigationItem.titleView = labelNav
        
        resignPostSheetView.hidden = true
        SegmentedControl.frame.size.height = 40
        
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


        
        
        
        //------------------------------ServerData 0--------------------------------
        
        if app.ServerData == 0 {
            SegmentedControl.enabled = true
            
            shenQingDanWeiMingCheng.enabled = true
            niCheXiaoYouZhengChangSuoMingCheng.enabled = true
            beiShenQingDanWeiMingCheng.enabled = true
            cheXiaoZHuYaoYuanYin.enabled = true
            
            cheXiaoShiJianNian.enabled = true
            cheXiaoShiJianYue.enabled = true
            
            cheXiaoDiZhiShi.enabled = true
            cheXiaoDiZhiXian.enabled = true
            cheXiaoDiZhiJie.enabled = true
            
            niCheXiaoYouZhengYingYeChangSuoMingCheng.enabled = true
            niCaiQuTiDaiXingCuoShi.enabled = true
            caiQuCuoShiHouFuWuShuiPing.enabled = true
            
            
            youZhengChangSuoMingCheng.enabled = true
            
            tap1.enabled = true
            tap2.enabled = true
            tap3.enabled = true
            tap4.enabled = true
            tap5.enabled = true
            
            changSuoDiZhiShi.enabled = true
            changSuoDiZhiXian.enabled = true
            changSuoDiZhiJie.enabled = true
            changSuoDiZhiHao.enabled = true
            changSuoDiZhiJingDu.enabled = true
            changSuoDiZhiWeiDu.enabled = true
            
            youZhengBianMa.enabled = true
            shangJiDanWei.enabled = true
            
            yingYeChangSuoFuZeRen.enabled = true
            YingYeChangSuoLianXiDianHua.enabled = true
            
            fuWuBanJing.enabled = true
            
            
            fuWuRenKou.enabled = true
            kaiYeShiJian.enabled = true
            
            
            jianZhuMianJi.enabled = true
            fuWuQuYu.enabled = true
            
            zhougYIngYeRiZhouJi.enabled = true
            zhougYIngYeRiZhiZhouJi.enabled = true
            riYingYeRiJiDian.enabled = true
            riYingYeRiZhiJiDian.enabled = true
            
            kaiXIangPinCi.enabled = true
            riTouDiPinCi.enabled = true
            zhouTouDiPinCi.enabled = true
            
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
            
            
            zongShouRu.enabled = true
            shouRuHanJian.enabled = true
            shuRuBaoGuo.enabled = true
            shouRuYinShuaPin.enabled = true
            shouRuHuiDui.enabled = true
            shouRuBaoKan.enabled = true
            shouRuDaiLiYeWu.enabled = true
            shouRuQiTa.enabled = true
            
            yeWuLiangHanJian.enabled = true
            yeWuLiangBaoGuo.enabled = true
            yeWuLiangYinShuaPin.enabled = true
            yeWuLiangHuiDui.enabled = true
            yeWuLiangBaoKan.enabled = true
            yeWuLiangDaiLiYeWu.enabled = true
            
            
            yingYeChangSuoMingCheng1.enabled = true
            changSuoDiZhiShi1.enabled = true
            changSuoDiZhiXian1.enabled = true
            changSuoDiZhiJie.enabled = true
            changSuoDiZhiHao1.enabled = true
            changSuoDiZhiJingDu.enabled = true
            changSuoDiZhiWeiDu.enabled = true
            
            fuZeRen1.enabled = true
            lianXiDianHua1.enabled = true
            youZhengBianMa1.enabled = true
            shangJiDanWei1.enabled = true
            fuWuQuYu1.enabled = true
            
            tap1.enabled = true
            tap2.enabled = true
            tap3.enabled = true
            tap4.enabled = true
            tap5.enabled = true
            
            
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
            
            qiTaShiXiang1.enabled = true
            
            cheXiaoYuanYin1.enabled = true
            niCheXiaoRiQi1.enabled = true

            commitBtn1.hidden = false
            commitBtn2.hidden = false
        }
        
        
        
        //------------------------------ServerData 1--------------------------------
        
        if app.ServerData == 1 {
            SegmentedControl.enabled = false
            
            if app.applyResignDic.count == 2 {
                //                println("\(app.applyResignDic.description)")
                commitBtn1.hidden = true
//                commitBtn2.hidden = true
                
                shenQingDanWeiMingCheng.enabled = false
                niCheXiaoYouZhengChangSuoMingCheng.enabled = false
                beiShenQingDanWeiMingCheng.enabled = false
                cheXiaoZHuYaoYuanYin.enabled = false
                
                cheXiaoShiJianNian.enabled = false
                cheXiaoShiJianYue.enabled = false
                
                cheXiaoDiZhiShi.enabled = false
                cheXiaoDiZhiXian.enabled = false
                cheXiaoDiZhiJie.enabled = false
                
                niCheXiaoYouZhengYingYeChangSuoMingCheng.enabled = false
                niCaiQuTiDaiXingCuoShi.enabled = false
                caiQuCuoShiHouFuWuShuiPing.enabled = false
                
                
                youZhengChangSuoMingCheng.enabled = false
                
                tap1.enabled = false
                tap2.enabled = false
                tap3.enabled = false
                tap4.enabled = false
                tap5.enabled = false
                
                changSuoDiZhiShi.enabled = false
                changSuoDiZhiXian.enabled = false
                changSuoDiZhiJie.enabled = false
                changSuoDiZhiHao.enabled = false
                changSuoDiZhiJingDu.enabled = false
                changSuoDiZhiWeiDu.enabled = false
                
                youZhengBianMa.enabled = false
                shangJiDanWei.enabled = false
                
                yingYeChangSuoFuZeRen.enabled = false
                YingYeChangSuoLianXiDianHua.enabled = false
                
                fuWuBanJing.enabled = false
                
                
                fuWuRenKou.enabled = false
                kaiYeShiJian.enabled = false
                
                
                jianZhuMianJi.enabled = false
                fuWuQuYu.enabled = false
                
                zhougYIngYeRiZhouJi.enabled = false
                zhougYIngYeRiZhiZhouJi.enabled = false
                riYingYeRiJiDian.enabled = false
                riYingYeRiZhiJiDian.enabled = false
                
                kaiXIangPinCi.enabled = false
                riTouDiPinCi.enabled = false
                zhouTouDiPinCi.enabled = false
                
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
                
                
                zongShouRu.enabled = false
                shouRuHanJian.enabled = false
                shuRuBaoGuo.enabled = false
                shouRuYinShuaPin.enabled = false
                shouRuHuiDui.enabled = false
                shouRuBaoKan.enabled = false
                shouRuDaiLiYeWu.enabled = false
                shouRuQiTa.enabled = false
                
                yeWuLiangHanJian.enabled = false
                yeWuLiangBaoGuo.enabled = false
                yeWuLiangYinShuaPin.enabled = false
                yeWuLiangHuiDui.enabled = false
                yeWuLiangBaoKan.enabled = false
                yeWuLiangDaiLiYeWu.enabled = false
                
                uploadBtn1.setTitle("查看拟撤销邮政普遍服务营业场所的工商营业执照复印件", forState: .Normal)
                uploadBtn2.setTitle("查看申请拟撤销邮政普遍服务营业场所原因的证明文件", forState: .Normal)
                
                initCheXiao(app.applyResignDic, segmentedControlIndex: 0)
                
                
                
                //                if (app.applyResignDic.valueForKey("info2") != nil) {
                //                    initCheXiao(app.applyResignDic, segmentedControlIndex: 0)
                //                }
            } else {
//                commitBtn1.hidden = true
                commitBtn2.hidden = true
                
                yingYeChangSuoMingCheng1.enabled = false
                changSuoDiZhiShi1.enabled = false
                changSuoDiZhiXian1.enabled = false
                changSuoDiZhiJie1.enabled = false
                changSuoDiZhiHao1.enabled = false
                changSuoDiZhiJingDu1.enabled = false
                changSuoDiZhiWeiDu1.enabled = false
                
                fuZeRen1.enabled = false
                lianXiDianHua1.enabled = false
                youZhengBianMa1.enabled = false
                shangJiDanWei1.enabled = false
                fuWuQuYu1.enabled = false
                
                tap1.enabled = false
                tap2.enabled = false
                tap3.enabled = false
                tap4.enabled = false
                tap5.enabled = false
                
                
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
                
                qiTaShiXiang1.enabled = false
                
                cheXiaoYuanYin1.enabled = false
                niCheXiaoRiQi1.enabled = false

                
                initCheXiao(app.applyResignDic, segmentedControlIndex: 1)
                //                initCheXiao(app.applyResignDic, segmentedControlIndex: 1)
                
               
            }
        }
        
        
        //------------------------------ServerData 2--------------------------------
        if app.ServerData == 2 {
            SegmentedControl.enabled = false
            
            if app.applyResignDic.count == 2 {
//                println("\(app.applyResignDic.description)")
                
                commitBtn1.hidden = false
//                commitBtn2.hidden = true
                
                shenQingDanWeiMingCheng.enabled = true
                niCheXiaoYouZhengChangSuoMingCheng.enabled = true
                beiShenQingDanWeiMingCheng.enabled = true
                cheXiaoZHuYaoYuanYin.enabled = true
                
                cheXiaoShiJianNian.enabled = true
                cheXiaoShiJianYue.enabled = true
                
                cheXiaoDiZhiShi.enabled = true
                cheXiaoDiZhiXian.enabled = true
                cheXiaoDiZhiJie.enabled = true
                
                niCheXiaoYouZhengYingYeChangSuoMingCheng.enabled = true
                niCaiQuTiDaiXingCuoShi.enabled = true
                caiQuCuoShiHouFuWuShuiPing.enabled = true
                
                
                youZhengChangSuoMingCheng.enabled = true
                
                tap1.enabled = true
                tap2.enabled = true
                tap3.enabled = true
                tap4.enabled = true
                tap5.enabled = true
                
                changSuoDiZhiShi.enabled = true
                changSuoDiZhiXian.enabled = true
                changSuoDiZhiJie.enabled = true
                changSuoDiZhiHao.enabled = true
                changSuoDiZhiJingDu.enabled = true
                changSuoDiZhiWeiDu.enabled = true
                
                youZhengBianMa.enabled = true
                shangJiDanWei.enabled = true
                
                yingYeChangSuoFuZeRen.enabled = true
                YingYeChangSuoLianXiDianHua.enabled = true
                
                fuWuBanJing.enabled = true
                
             
                fuWuRenKou.enabled = true
                kaiYeShiJian.enabled = true
                
                
                jianZhuMianJi.enabled = true
                fuWuQuYu.enabled = true
                
                zhougYIngYeRiZhouJi.enabled = true
                zhougYIngYeRiZhiZhouJi.enabled = true
                riYingYeRiJiDian.enabled = true
                riYingYeRiZhiJiDian.enabled = true
                
                kaiXIangPinCi.enabled = true
                riTouDiPinCi.enabled = true
                zhouTouDiPinCi.enabled = true
                
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
                
                
                zongShouRu.enabled = true
                shouRuHanJian.enabled = true
                shuRuBaoGuo.enabled = true
                shouRuYinShuaPin.enabled = true
                shouRuHuiDui.enabled = true
                shouRuBaoKan.enabled = true
                shouRuDaiLiYeWu.enabled = true
                shouRuQiTa.enabled = true
                
                yeWuLiangHanJian.enabled = true
                yeWuLiangBaoGuo.enabled = true
                yeWuLiangYinShuaPin.enabled = true
                yeWuLiangHuiDui.enabled = true
                yeWuLiangBaoKan.enabled = true
                yeWuLiangDaiLiYeWu.enabled = true
                
                
                initCheXiao(app.applyResignDic, segmentedControlIndex: 0)
                
                
//                let stateValueFromServer = app.applyAddDic.valueForKey("state") as! Int
//                print(stateValueFromServer)
//                if stateValueFromServer == 1 || stateValueFromServer == 2 || stateValueFromServer == 3 {
//                    //                bkView.backgroundColor = UIColor.redColor()
//                    //                let btmOnBkView = UIButton(frame: CGRect(x: 10, y: 30, width: 150, height: 30))
//                    btmOnBkView.backgroundColor = UIColor.redColor()
//                    btmOnBkView.setTitle("查看审核状态", forState: .Normal)
//                    btmOnBkView.addTarget(self, action:Selector("shenHeYiJianBtnAction") , forControlEvents: .TouchUpInside)
//                    self.view.addSubview(bkView)
//                    bkView.addSubview(btmOnBkView)
//                }

                
                //                if (app.applyResignDic.valueForKey("info2") != nil) {
                //                    initCheXiao(app.applyResignDic, segmentedControlIndex: 0)
                //                }
            } else {
                
//                commitBtn1.hidden = true
                commitBtn2.hidden = false
                
                yingYeChangSuoMingCheng1.enabled = true
                changSuoDiZhiShi1.enabled = true
                changSuoDiZhiXian1.enabled = true
                changSuoDiZhiJie.enabled = true
                changSuoDiZhiHao1.enabled = true
                changSuoDiZhiJingDu.enabled = true
                changSuoDiZhiWeiDu.enabled = true
                
                fuZeRen1.enabled = true
                lianXiDianHua1.enabled = true
                youZhengBianMa1.enabled = true
                shangJiDanWei1.enabled = true
                fuWuQuYu1.enabled = true
                
                tap1.enabled = true
                tap2.enabled = true
                tap3.enabled = true
                tap4.enabled = true
                tap5.enabled = true
                
           
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
                
                qiTaShiXiang1.enabled = true
                
                cheXiaoYuanYin1.enabled = true
                niCheXiaoRiQi1.enabled = true
                
                
                initCheXiao(app.applyResignDic, segmentedControlIndex: 1)
                
//                let stateValueFromServer = app.applyAddDic.valueForKey("state") as! Int
//                print(stateValueFromServer)
//                if stateValueFromServer == 1 || stateValueFromServer == 2 || stateValueFromServer == 3 {
//                    //                bkView.backgroundColor = UIColor.redColor()
//                    //                let btmOnBkView = UIButton(frame: CGRect(x: 10, y: 30, width: 150, height: 30))
//                    btmOnBkView.backgroundColor = UIColor.redColor()
//                    btmOnBkView.setTitle("查看审核状态", forState: .Normal)
//                    btmOnBkView.addTarget(self, action:Selector("shenHeYiJianBtnAction") , forControlEvents: .TouchUpInside)
//                    self.view.addSubview(bkView)
//                    bkView.addSubview(btmOnBkView)
//                }

//                initCheXiao(app.applyResignDic, segmentedControlIndex: 1)
            }
        }
        
    }

    
    func initCheXiao(dict: NSDictionary, segmentedControlIndex index:Int)
    {
        if index == 0 {
            let dict1 = dict.valueForKey("info1") as! NSDictionary
//            println("dsasdasdasdasdasdasdasdasd\(dict1.description)")
            initCheXiaoPuBianFuWuChangSuoShenQing(dict1)
            let dict2 = dict.valueForKey("info2") as! NSDictionary
            initCheXiaoPuBianFuWuChangSuo(dict2)
        }
        if index == 1 {
//            println("\(dict)")
            initCheXiaoYouZhengYingYeChangSuo(dict as NSDictionary)
        }
    }
    
    func initCheXiaoPuBianFuWuChangSuoShenQing(dict: NSDictionary){
        //segmentedControl预选定
        SegmentedControl.selectedSegmentIndex = 0
        resignPostSheetView.hidden = true
        applyResignBranchView.hidden = false
        if let rootView = self.view as? UIScrollView {
            rootView.contentSize = CGSize(width: 320, height: 2190)
        }
        
        let stateValueFromServer = app.applyResignDic.valueForKey("info1")?.valueForKey("state") as? Int
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
        shenQingDanWeiMingCheng.text = dict.valueForKey("zgyzjtfgsmc") as? String
        niCheXiaoYouZhengChangSuoMingCheng.text = dict.valueForKey("btyzpbfwyycsmc") as? String
        beiShenQingDanWeiMingCheng.text = dict.valueForKey("syzgljmc") as? String
        cheXiaoZHuYaoYuanYin.text = dict.valueForKey("sqcxdzyyy") as? String
        
        cheXiaoShiJianNian.text = dict.valueForKey("cxsj_n") as? String
        cheXiaoShiJianYue.text = dict.valueForKey("cxsj_y") as? String
        
        cheXiaoDiZhiShi.text = dict.valueForKey("cxdz_s") as? String
        cheXiaoDiZhiXian.text = dict.valueForKey("cxdz_xqs") as? String
        cheXiaoDiZhiJie.text = dict.valueForKey("cxdz_jx") as? String
        
        niCheXiaoYouZhengYingYeChangSuoMingCheng.text = dict.valueForKey("yzpbfwyycsmc") as? String
        niCaiQuTiDaiXingCuoShi.text = dict.valueForKey("ncqdtdxcs") as? String
        caiQuCuoShiHouFuWuShuiPing.text = dict.valueForKey("yzpbyycsszhyzpbfwztsp") as? String
    }
    
    func initCheXiaoPuBianFuWuChangSuo(dict: NSDictionary){
        youZhengChangSuoMingCheng.text? = (dict.valueForKey("yzcsmc") as? String)!
        
        if (dict.valueForKey("jyfs") as! String == "zb")   {
            chooseJIngYingFangShi.text? = "自办"
        }
        if(dict.valueForKey("jyfs") as! String == "wb") {
            chooseJIngYingFangShi.text? = "委办"
        }
        
        changSuoDiZhiShi.text? = dict.valueForKey("csdz_s") as! String
        changSuoDiZhiXian.text? = dict.valueForKey("csdz_xqs") as! String
        changSuoDiZhiJie.text? = dict.valueForKey("csdz_jx") as! String
        changSuoDiZhiHao.text? = dict.valueForKey("csdz_h") as! String
        changSuoDiZhiJingDu.text? = dict.valueForKey("csdz_jd") as! String
        changSuoDiZhiWeiDu.text? = dict.valueForKey("csdz_wd") as! String
        
        youZhengBianMa.text? = dict.valueForKey("yzbm") as! String
        shangJiDanWei.text? = dict.valueForKey("sjdw") as! String
        
        yingYeChangSuoFuZeRen.text? = dict.valueForKey("yycsf") as! String
        YingYeChangSuoLianXiDianHua.text? = dict.valueForKey("yycslxdh") as! String
        
        fuWuBanJing.text? = dict.valueForKey("fwbj") as! String
        
        if(dict.valueForKey("szdd") as! String == "csdq") {
            chooseSuoZaiDiDian.text? = "城市地区"
        }
        if (dict.valueForKey("szdd") as! String == "xzdq")   {
            chooseSuoZaiDiDian.text? = "乡镇地区"
        }
        if(dict.valueForKey("szdd") as! String == "ncdq") {
            chooseSuoZaiDiDian.text? = "农村地区"
        }
        
        fuWuRenKou.text? = dict.valueForKey("fwrk") as! String
        kaiYeShiJian.text? = dict.valueForKey("kysj") as! String
        
        if (dict.valueForKey("fwcq") as! String == "ziy")   {
            chooseFangWuChangQuan.text? = "自有"
        }
        if(dict.valueForKey("fwcq") as! String == "zuy") {
            chooseFangWuChangQuan.text? = "租用"
        }
        if (dict.valueForKey("fwcq") as! String == "wucsy")   {
            chooseFangWuChangQuan.text? = "无偿使用"
        }
        if(dict.valueForKey("fwcq") as! String == "qt") {
            chooseFangWuChangQuan.text? = "其他"
        }
    
        jianZhuMianJi.text = dict.valueForKey("jzmj") as? String
        fuWuQuYu.text? = dict.valueForKey("fwqy") as! String
        
        zhougYIngYeRiZhouJi.text? = dict.valueForKey("zyyr_ks") as! String
        zhougYIngYeRiZhiZhouJi.text? = dict.valueForKey("zyyr_js") as! String
        riYingYeRiJiDian.text? = dict.valueForKey("ryysj_ks") as! String
        riYingYeRiZhiJiDian.text? = dict.valueForKey("ryysj_js") as! String
        
        kaiXIangPinCi.text? = dict.valueForKey("kxpc") as! String
        riTouDiPinCi.text? = dict.valueForKey("rtdpc") as! String
        zhouTouDiPinCi.text? = dict.valueForKey("ztdpc") as! String
        
        let ywsxArray = dict.valueForKey("ywfw") as! String
        if (ywsxArray.rangeOfString("xj") != nil) {
            XinJian.selected = true
        }
        if (ywsxArray.rangeOfString("wl") != nil) {
            WuLiu.selected = true
        }
        if (ywsxArray.rangeOfString("jy") != nil) {
            JiYou.selected = true
        }
        if (ywsxArray.rangeOfString("bgs") != nil) {
            BaoGuo.selected = true
        }
        if (ywsxArray.rangeOfString("ysp") != nil) {
            YinShuaPin.selected = true
        }
        if (ywsxArray.rangeOfString("bkls") != nil) {
            BaoKanLingShou.selected = true
        }
        if (ywsxArray.rangeOfString("yzcx") != nil) {
            YouZhengChuXu.selected = true
        }
        if (ywsxArray.rangeOfString("ywfw") != nil) {
            MangRenDuWu.selected = true
        }
        if (ywsxArray.rangeOfString("tkzd") != nil) {
            TeKuaiZhuangDi.selected = true
        }
        if (ywsxArray.rangeOfString("bkdy") != nil) {
            BaoKanDingYue.selected = true
        }
        if (ywsxArray.rangeOfString("yzhd") != nil) {
            YouZhengHuiDui.selected = true
        }
        if (ywsxArray.rangeOfString("ywbxh") != nil) {
            YIWuBingXinHan.selected = true
        }
        if (ywsxArray.rangeOfString("lsywbg") != nil) {
            LieShiBaoGuo.selected = true
        }
        if (ywsxArray.rangeOfString("qt") != nil) {
            QiTa.selected = true
        }
        
        zongShouRu.text? = dict.valueForKey("ncxyzpbfwyycszsr") as! String
        shouRuHanJian.text? = dict.valueForKey("yycsjyndywsrhj") as! String
        shuRuBaoGuo.text? = dict.valueForKey("yycsjyndywsrbg") as! String
        shouRuYinShuaPin.text? = dict.valueForKey("yycsjyndywsrysp") as! String
        shouRuHuiDui.text? = dict.valueForKey("yycsjyndywsrhd") as! String
        shouRuBaoKan.text? = dict.valueForKey("yycsjyndywsrbk") as! String
        shouRuDaiLiYeWu.text? = dict.valueForKey("yycsjyndywsrdlyw") as! String
        shouRuQiTa.text? = dict.valueForKey("yycsjyndywsrqt") as! String
        
        yeWuLiangHanJian.text? = dict.valueForKey("yycsjynzyywlhj") as! String
        yeWuLiangBaoGuo.text? = dict.valueForKey("yycsjynzyywlbg") as! String
        yeWuLiangYinShuaPin.text? = dict.valueForKey("yycsjynzyywlysp") as! String
        yeWuLiangHuiDui.text? = dict.valueForKey("yycsjynzyywlhd") as! String
        yeWuLiangBaoKan.text? = dict.valueForKey("yycsjynzyywlbk") as! String
        yeWuLiangDaiLiYeWu.text? = dict.valueForKey("yycsjynzyywldlyw") as! String

    }
    
    func initCheXiaoYouZhengYingYeChangSuo(dict: NSDictionary){
        //segmentedControl预选定
        SegmentedControl.selectedSegmentIndex = 1
        resignPostSheetView.hidden = false
        applyResignBranchView.hidden = true
        if let rootView = self.view as? UIScrollView {
            rootView.contentSize = CGSize(width: 320, height: 910)
        }
        
        let stateValueFromServer = app.applyResignDic.valueForKey("state") as? Int
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
        yingYeChangSuoMingCheng1.text = dict.valueForKey("yzyycsmc") as? String
        changSuoDiZhiShi1.text = dict.valueForKey("csdz_s") as? String
        changSuoDiZhiXian1.text = dict.valueForKey("csdz_xqs") as? String
        changSuoDiZhiJie1.text = dict.valueForKey("csdz_jx") as? String
        changSuoDiZhiHao1.text = dict.valueForKey("csdz_h") as? String
        changSuoDiZhiJingDu1.text = dict.valueForKey("csdz_jd") as? String
        changSuoDiZhiWeiDu1.text = dict.valueForKey("csdz_wd") as? String
        
        fuZeRen1.text = dict.valueForKey("fzr") as? String
        lianXiDianHua1.text = dict.valueForKey("lxdh") as? String
        youZhengBianMa1.text = dict.valueForKey("yzbm") as? String
        shangJiDanWei1.text = dict.valueForKey("sjdw") as? String
        fuWuQuYu1.text = dict.valueForKey("fwqy") as? String
        
        if(dict.valueForKey("szdd") as! String == "csdq") {
            chooseSuoZaiDiDian1.text = "城市地区"
        }
        if (dict.valueForKey("szdd") as! String == "xzdq")   {
            chooseSuoZaiDiDian1.text = "乡镇地区"
        }
        if(dict.valueForKey("szdd") as! String == "ncdq") {
            chooseSuoZaiDiDian1.text = "农村地区"
        }

        if (dict.valueForKey("jyfs") as! String == "zb")   {
            chooseJIngYingFangShi1.text = "自办"
        }
        if(dict.valueForKey("jyfs") as! String == "wb") {
            chooseJIngYingFangShi1.text = "委办"
        }
        
        let ywsxArray1 = dict.valueForKey("ywfw") as! String
        if (ywsxArray1.rangeOfString("xj") != nil) {
            XinJian1.selected = true
        }
        if (ywsxArray1.rangeOfString("wl") != nil) {
            WuLiu1.selected = true
        }
        if (ywsxArray1.rangeOfString("jy") != nil) {
            JiYou1.selected = true
        }
        if (ywsxArray1.rangeOfString("bgs") != nil) {
            BaoGuo1.selected = true
        }
        if (ywsxArray1.rangeOfString("ysp") != nil) {
            YinShuaPin1.selected = true
        }
        if (ywsxArray1.rangeOfString("bkls") != nil) {
            BaoKanLingShou1.selected = true
        }
        if (ywsxArray1.rangeOfString("yzcx") != nil) {
            YouZhengChuXu1.selected = true
        }
        if (ywsxArray1.rangeOfString("ywfw") != nil) {
            MangRenDuWu1.selected = true
        }
        if (ywsxArray1.rangeOfString("tkzd") != nil) {
            TeKuaiZhuangDi1.selected = true
        }
        if (ywsxArray1.rangeOfString("bkdy") != nil) {
            BaoKanDingYue1.selected = true
        }
        if (ywsxArray1.rangeOfString("yzhd") != nil) {
            YouZhengHuiDui1.selected = true
        }
        if (ywsxArray1.rangeOfString("ywbxh") != nil) {
            YIWuBingXinHan1.selected = true
        }
        if (ywsxArray1.rangeOfString("lsywbg") != nil) {
            LieShiBaoGuo1.selected = true
        }
        if (ywsxArray1.rangeOfString("qt") != nil) {
            QiTa1.selected = true
        }
        
        qiTaShiXiang1.text = dict.valueForKey("qtsx") as? String
        
        cheXiaoYuanYin1.text = dict.valueForKey("cxyy") as? String
        niCheXiaoRiQi1.text = dict.valueForKey("ncxrq") as? String

    }

    //上传图片功能
    //上传照片类对应的实例对象 全局
    var uploadBtn1PicVC: UploadPicViewController?
    
    @IBAction func uploadYIngYeZhiZhaoFuYinJian(sender: AnyObject) {
        
        if app.ServerData == 0 {
            uploadBtn1PicVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "拟撤销场所的工商营业执照复印件", andUploadKind: 1)
           
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
            let picValueFromDict = (app.applyResignDic.valueForKey("info1"))?.valueForKey("gsyyzzfyj")
            
            let uploadVC = UploadPicViewController(uploadState: false, andUrl: picValueFromDict as! String, andCountOfPic: 1, andFormName: "拟撤销场所的工商营业执照复印件", andUploadKind: 1)
            
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
            let picValueFromDict = (app.applyResignDic.valueForKey("info1"))?.valueForKey("gsyyzzfyj")
            
            let uploadVC = UploadPicViewController(uploadState: true, andUrl: picValueFromDict as! String, andCountOfPic: 1, andFormName: "拟撤销场所的工商营业执照复印件", andUploadKind: 1)
            
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
    @IBAction func uploadZhengMingWenJian(sender: AnyObject) {
        
        if app.ServerData == 0 {
            uploadBtn2PicVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "申请拟撤销场所原因的证明文件", andUploadKind: 1)
            
            if ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) {
                uploadBtn2PicVC!.providesPresentationContextTransitionStyle = true
                uploadBtn2PicVC!.definesPresentationContext = true
                if #available(iOS 8.0, *) {
                    uploadBtn2PicVC!.modalPresentationStyle = .OverCurrentContext
                } else {
                    // Fallback on earlier versions
                }
                self.presentViewController(uploadBtn2PicVC! ,animated: true, completion: nil)
            } else {
                self.view.window?.rootViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(uploadBtn2PicVC! ,animated: false, completion: nil)
                self.view.window?.rootViewController?.modalPresentationStyle = .FullScreen
            }
        }
        
        if app.ServerData == 1 {
            let picValueFromDict = (app.applyResignDic.valueForKey("info1"))?.valueForKey("zmwj")
            
            let uploadVC = UploadPicViewController(uploadState: false, andUrl: picValueFromDict as! String, andCountOfPic: 1, andFormName: "申请拟撤销场所原因的证明文件", andUploadKind: 1)
            
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
            let picValueFromDict = (app.applyResignDic.valueForKey("info1"))?.valueForKey("zmwj")
            
            let uploadVC = UploadPicViewController(uploadState: true, andUrl: picValueFromDict as! String, andCountOfPic: 1, andFormName: "申请拟撤销场所原因的证明文件", andUploadKind: 1)
            
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

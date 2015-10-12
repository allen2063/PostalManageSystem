//
//  ApplyResignBranchTableViewController2.swift
//  POST
//
//  Created by QiaoLibo on 15/9/1.
//  Copyright (c) 2015年 Qiaolibo. All rights reserved.
//

import UIKit

class ApplyResignBranchViewController2: UIViewController, UIActionSheetDelegate, UITextFieldDelegate, UIScrollViewDelegate {
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

    @IBAction func commit(sender: AnyObject) {
        let infoOfCxyzpbfwyycssq = InfoOfCxyzpbfwyycssq()
        infoOfCxyzpbfwyycssq.zgyzjtfgsmc = shenQingDanWeiMingCheng.text
        infoOfCxyzpbfwyycssq.btyzpbfwyycsmc = niCheXiaoYouZhengChangSuoMingCheng.text
        infoOfCxyzpbfwyycssq.syzgljmc = beiShenQingDanWeiMingCheng.text
        infoOfCxyzpbfwyycssq.sqcxdzyyy = cheXiaoZHuYaoYuanYin.text
        
        infoOfCxyzpbfwyycssq.cxsj_n = cheXiaoShiJianNian.text
        infoOfCxyzpbfwyycssq.cxsj_y = cheXiaoShiJianYue.text
        
        infoOfCxyzpbfwyycssq.cxdz_s = cheXiaoDiZhiShi.text
        infoOfCxyzpbfwyycssq.cxdz_xqs = cheXiaoDiZhiXian.text
        infoOfCxyzpbfwyycssq.cxdz_jx = cheXiaoDiZhiJie.text
        
        infoOfCxyzpbfwyycssq.yzpbfwyycsmc = niCheXiaoYouZhengYingYeChangSuoMingCheng.text
        infoOfCxyzpbfwyycssq.ncqdtdxcs = niCaiQuTiDaiXingCuoShi.text
        infoOfCxyzpbfwyycssq.yzpbyycsszhyzpbfwztsp = caiQuCuoShiHouFuWuShuiPing.text
        
        
        
        let infoOfNcxyzpbfwyycsjbqkb = InfoOfNcxyzpbfwyycsjbqkb()
        infoOfNcxyzpbfwyycsjbqkb.yzcsmc = youZhengChangSuoMingCheng.text
        
        //infoOfNcxyzpbfwyycsjbqkb.jyfs = chooseJIngYingFangShi.text
        if (chooseJIngYingFangShi.text == "自办")  {
            infoOfNcxyzpbfwyycsjbqkb.jyfs = "zb"
        }
        if(chooseJIngYingFangShi.text == "委办") {
            infoOfNcxyzpbfwyycsjbqkb.jyfs = "wb"
        }
        
        infoOfNcxyzpbfwyycsjbqkb.csdz_s = changSuoDiZhiShi.text
        infoOfNcxyzpbfwyycsjbqkb.csdz_xqs = changSuoDiZhiXian.text
        infoOfNcxyzpbfwyycsjbqkb.csdz_jx = changSuoDiZhiJie.text
        infoOfNcxyzpbfwyycsjbqkb.csdz_h = changSuoDiZhiHao.text
        infoOfNcxyzpbfwyycsjbqkb.csdz_jd = changSuoDiZhiJingDu.text
        infoOfNcxyzpbfwyycsjbqkb.csdz_wd = changSuoDiZhiWeiDu.text
        
        infoOfNcxyzpbfwyycsjbqkb.yzbm = youZhengBianMa.text
        infoOfNcxyzpbfwyycsjbqkb.sjdw = shangJiDanWei.text

        infoOfNcxyzpbfwyycsjbqkb.yycsf = yingYeChangSuoFuZeRen.text
        infoOfNcxyzpbfwyycsjbqkb.yycslxdh = YingYeChangSuoLianXiDianHua.text
        
        infoOfNcxyzpbfwyycsjbqkb.fwbj = fuWuBanJing.text
        
        //infoOfNcxyzpbfwyycsjbqkb.szdd = chooseSuoZaiDiDian.text
        if (chooseSuoZaiDiDian.text == "城市地区")  {
            infoOfNcxyzpbfwyycsjbqkb.szdd = "csdq"
        }
        if(chooseSuoZaiDiDian.text == "乡镇地区") {
            infoOfNcxyzpbfwyycsjbqkb.szdd = "xzdq"
        }
        if(chooseSuoZaiDiDian.text == "农村地区") {
            infoOfNcxyzpbfwyycsjbqkb.szdd = "ncdq"
        }
        
        infoOfNcxyzpbfwyycsjbqkb.fwrk = fuWuRenKou.text
        infoOfNcxyzpbfwyycsjbqkb.kysj = kaiYeShiJian.text
        
        //infoOfNcxyzpbfwyycsjbqkb.fwcq = chooseFangWuChangQuan.text
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
        
        infoOfNcxyzpbfwyycsjbqkb.jzmj = jianZhuMianJi.text
        infoOfNcxyzpbfwyycsjbqkb.fwqy = fuWuQuYu.text
        
        infoOfNcxyzpbfwyycsjbqkb.zyyr_ks = zhougYIngYeRiZhouJi.text
        infoOfNcxyzpbfwyycsjbqkb.zyyr_js = zhougYIngYeRiZhiZhouJi.text
        infoOfNcxyzpbfwyycsjbqkb.ryysj_ks = riYingYeRiJiDian.text
        infoOfNcxyzpbfwyycsjbqkb.ryysj_js = riYingYeRiZhiJiDian.text
        
        infoOfNcxyzpbfwyycsjbqkb.kxpc = kaiXIangPinCi.text
        infoOfNcxyzpbfwyycsjbqkb.rtdpc = riTouDiPinCi.text
        infoOfNcxyzpbfwyycsjbqkb.ztdpc = zhouTouDiPinCi.text
        
        if XinJian.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += "xj"
        }
        if WuLiu.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",wl"
        }
        if JiYou.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",jy"
        }
        if BaoGuo.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",bgs"
        }
        if YinShuaPin.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",ysp"
        }
        if BaoKanLingShou.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",bkls"
        }
        if YouZhengChuXu.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",yzcx"
        }
        if MangRenDuWu.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",mrdw"
        }
        if TeKuaiZhuangDi.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",tkzd"
        }
        if BaoKanDingYue.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",bkdy"
        }
        if YouZhengHuiDui.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",yzhd"
        }
        if YIWuBingXinHan.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",ywbxh"
        }
        if LieShiBaoGuo.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",lsywbg"
        }
        if QiTa.selected {
            infoOfNcxyzpbfwyycsjbqkb.ywfw += ",qt"
        }
        
        infoOfNcxyzpbfwyycsjbqkb.ncxyzpbfwyycszsr = zongShouRu.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrhj = shouRuHanJian.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrbg = shuRuBaoGuo.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrysp = shouRuYinShuaPin.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrhd = shouRuHuiDui.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrbk = shouRuBaoKan.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrdlyw = shouRuDaiLiYeWu.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjyndywsrqt = shouRuQiTa.text
        
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlhj = yeWuLiangHanJian.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlbg = yeWuLiangBaoGuo.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlysp = yeWuLiangYinShuaPin.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlhd = yeWuLiangHuiDui.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywlbk = yeWuLiangBaoKan.text
        infoOfNcxyzpbfwyycsjbqkb.yycsjynzyywldlyw = yeWuLiangDaiLiYeWu.text
        
        ClassToJSON.getObjectData(infoOfCxyzpbfwyycssq)
        ClassToJSON.getObjectData(infoOfNcxyzpbfwyycsjbqkb)
        
//        println("\(ClassToJSON.getObjectData(infoOfCxyzpbfwyycssq))")
//        println("\(ClassToJSON.getObjectData(infoOfNcxyzpbfwyycsjbqkb))")
        
    }

    @IBAction func commit2(sender: AnyObject) {
        let infoOfyzqycxyzyycsdjb = InfoOfyzqycxyzyycsdjb()
        infoOfyzqycxyzyycsdjb.yzyycsmc = yingYeChangSuoMingCheng1.text
        infoOfyzqycxyzyycsdjb.csdz_s = changSuoDiZhiShi1.text
        infoOfyzqycxyzyycsdjb.csdz_xqs = changSuoDiZhiXian1.text
        infoOfyzqycxyzyycsdjb.csdz_jx = changSuoDiZhiJie.text
        infoOfyzqycxyzyycsdjb.csdz_h = changSuoDiZhiHao1.text
        infoOfyzqycxyzyycsdjb.csdz_jd = changSuoDiZhiJingDu.text
        infoOfyzqycxyzyycsdjb.csdz_wd = changSuoDiZhiWeiDu.text
        
        infoOfyzqycxyzyycsdjb.fzr = fuZeRen1.text
        infoOfyzqycxyzyycsdjb.lxdh = lianXiDianHua1.text
        infoOfyzqycxyzyycsdjb.yzbm = youZhengBianMa1.text
        infoOfyzqycxyzyycsdjb.sjdw = shangJiDanWei1.text
        infoOfyzqycxyzyycsdjb.fwqy = fuWuQuYu1.text
        
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

        
        //infoOfyzqycxyzyycsdjb.jyfs = chooseJIngYingFangShi1.text
        if (chooseJIngYingFangShi1.text == "自办")  {
            infoOfyzqycxyzyycsdjb.jyfs = "zb"
        }
        if(chooseJIngYingFangShi1.text == "委办") {
            infoOfyzqycxyzyycsdjb.jyfs = "wb"
        }
        
        if XinJian1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += "xj"
        }
        if WuLiu1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",wl"
        }
        if JiYou1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",jy"
        }
        if BaoGuo1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",bgs"
        }
        if YinShuaPin1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",ysp"
        }
        if BaoKanLingShou1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",bkls"
        }
        if YouZhengChuXu1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",yzcx"
        }
        if MangRenDuWu1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",mrdw"
        }
        if TeKuaiZhuangDi1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",tkzd"
        }
        if BaoKanDingYue1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",bkdy"
        }
        if YouZhengHuiDui1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",yzhd"
        }
        if YIWuBingXinHan1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",ywbxh"
        }
        if LieShiBaoGuo1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",lsywbg"
        }
        if QiTa1.selected {
            infoOfyzqycxyzyycsdjb.ywfw += ",qt"
        }
        
        
        infoOfyzqycxyzyycsdjb.qtsx = qiTaShiXiang1.text
        
        infoOfyzqycxyzyycsdjb.cxyy = cheXiaoYuanYin1.text
        infoOfyzqycxyzyycsdjb.ncxrq = niCheXiaoRiQi1.text
        
        ClassToJSON.getObjectData(infoOfyzqycxyzyycsdjb)
        
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
    
    
    let bkView = UIView(frame: CGRect(x: 0, y: UIScreen.mainScreen().bounds.size.height - 95, width: UIScreen.mainScreen().bounds.size.width, height: 70))
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 30))
    let btmOnBkView = UIButton(frame: CGRect(x: 0, y: 30, width: UIScreen.mainScreen().bounds.size.width, height: 40))
    
    var flag = 0
    func shenHeYiJianBtnAction() {
        label.textColor = UIColor.greenColor()
        label.backgroundColor = UIColor.blueColor()
        
        //        label.hidden = true
        
        if flag == 0 {
            btmOnBkView.setTitle("隐藏审核状态", forState: .Normal)
            flag = 1
            print("\(flag)")
            label.text = app.applyResignDic.valueForKey("sppl") as? String
            label.textAlignment = .Center
            //            viewForShenHeYiJian.addSubview(label)
            //            label.hidden = false
            bkView.addSubview(label)
            //            print("\(flag)\(label)")
        } else if flag == 1
        {
            btmOnBkView.setTitle("查看审核状态", forState: .Normal)
            flag = 0
            //            label.hidden = true
            //            print("\(flag)\(label.superview)")
            label.removeFromSuperview()
            
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //        print("QQQQQQQQQQQQQQQQQQQQQQQQ\(++i)")
        //        bkView.backgroundColor = UIColor.redColor()
        bkView.frame.origin.y = (self.view as! UIScrollView).contentOffset.y + 500
        //        print("\(bkView.bounds.origin.y)")
    }

    
    @IBOutlet weak var commitBtn1: UIButton!
    @IBOutlet weak var commitBtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resignPostSheetView.hidden = true
        SegmentedControl.frame.size.height = 40
        
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
            btmOnBkView.setTitle("查看审核状态", forState: .Normal)
            btmOnBkView.addTarget(self, action:Selector("shenHeYiJianBtnAction") , forControlEvents: .TouchUpInside)
            self.view.addSubview(bkView)
            bkView.addSubview(btmOnBkView)
        }


        //属性预置
        shenQingDanWeiMingCheng.text = dict.valueForKey("zgyzjtfgsmc") as! String
        niCheXiaoYouZhengChangSuoMingCheng.text = dict.valueForKey("btyzpbfwyycsmc") as! String
        beiShenQingDanWeiMingCheng.text = dict.valueForKey("syzgljmc") as! String
        cheXiaoZHuYaoYuanYin.text = dict.valueForKey("sqcxdzyyy") as! String
        
        cheXiaoShiJianNian.text = dict.valueForKey("cxsj_n") as! String
        cheXiaoShiJianYue.text = dict.valueForKey("cxsj_y") as! String
        
        cheXiaoDiZhiShi.text = dict.valueForKey("cxdz_s") as! String
        cheXiaoDiZhiXian.text = dict.valueForKey("cxdz_xqs") as! String
        cheXiaoDiZhiJie.text = dict.valueForKey("cxdz_jx") as! String
        
        niCheXiaoYouZhengYingYeChangSuoMingCheng.text = dict.valueForKey("yzpbfwyycsmc") as! String
        niCaiQuTiDaiXingCuoShi.text = dict.valueForKey("ncqdtdxcs") as! String
        caiQuCuoShiHouFuWuShuiPing.text = dict.valueForKey("yzpbyycsszhyzpbfwztsp") as! String
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
    
        jianZhuMianJi.text = dict.valueForKey("jzmj") as! String
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
            btmOnBkView.setTitle("查看审核状态", forState: .Normal)
            btmOnBkView.addTarget(self, action:Selector("shenHeYiJianBtnAction") , forControlEvents: .TouchUpInside)
            self.view.addSubview(bkView)
            bkView.addSubview(btmOnBkView)
        }

        
        //属性预置
        yingYeChangSuoMingCheng1.text = dict.valueForKey("yzyycsmc") as! String
        changSuoDiZhiShi1.text = dict.valueForKey("csdz_s") as! String
        changSuoDiZhiXian1.text = dict.valueForKey("csdz_xqs") as! String
        changSuoDiZhiJie.text = dict.valueForKey("csdz_jx") as! String
        changSuoDiZhiHao1.text = dict.valueForKey("csdz_h") as! String
        changSuoDiZhiJingDu.text = dict.valueForKey("csdz_jd") as! String
        changSuoDiZhiWeiDu.text = dict.valueForKey("csdz_wd") as! String
        
        fuZeRen1.text = dict.valueForKey("fzr") as! String
        lianXiDianHua1.text = dict.valueForKey("lxdh") as! String
        youZhengBianMa1.text = dict.valueForKey("yzbm") as! String
        shangJiDanWei1.text = dict.valueForKey("sjdw") as! String
        fuWuQuYu1.text = dict.valueForKey("fwqy") as! String
        
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
        
        qiTaShiXiang1.text = dict.valueForKey("qtsx") as! String
        
        cheXiaoYuanYin1.text = dict.valueForKey("cxyy") as! String
        niCheXiaoRiQi1.text = dict.valueForKey("ncxrq") as! String

    }

    //上传图片功能
    @IBAction func uploadYIngYeZhiZhaoFuYinJian(sender: AnyObject) {
        
        if app.ServerData == 0 {
            let uploadVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "拟撤销场所的工商营业执照复印件", andUploadKind: 1)
            
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
    
    
    @IBAction func uploadZhengMingWenJian(sender: AnyObject) {
        
        if app.ServerData == 0 {
            let uploadVC = UploadPicViewController(uploadState: true, andUrl: nil, andCountOfPic: 1, andFormName: "申请拟撤销场所原因的证明文件", andUploadKind: 1)
            
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

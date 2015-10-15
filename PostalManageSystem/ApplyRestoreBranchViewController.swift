//
//  ApplyRestoreBranchViewController.swift
//  PostalManageSystem
//
//  Created by QiaoLibo on 15/9/10.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

import UIKit

class ApplyRestoreBranchViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelNav = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        //        labelNav.backgroundColor = UIColor.clearColor
        labelNav.font = UIFont.boldSystemFontOfSize(20)
        labelNav.textColor = UIColor.whiteColor()
        labelNav.textAlignment = .Center
        labelNav.text = "申请恢复办理业务"
        self.navigationItem.titleView = labelNav
        
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

            
            app.ServerData = 0

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
            app.ServerData = 0
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

        if ((XinJian.selected || YouZhengHuiDui.selected || MangRenDuWu.selected || YinShuaPin.selected || BaoGuo.selected || LieShiBaoGuo.selected || GuoJiaGuiDingBaoKanDeFaXing.selected || YiWuBingXinHan.selected) == false) {
            let alertView = UIAlertView(title: "须选择业务范围", message:  "业务范围不能为空", delegate: self, cancelButtonTitle: "返回编辑")
            alertView.show()
        } else {
            COMMIT_OK += 1
            if XinJian.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += "xj"
            }
            if YouZhengHuiDui.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",yzhd"
            }
            if MangRenDuWu.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",mrdw"
            }
            if YinShuaPin.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",ysp"
            }
            if BaoGuo.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",bgs"
            }
            if LieShiBaoGuo.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",gmlsyw"
            }
            if GuoJiaGuiDingBaoKanDeFaXing.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",gjgdbkdfx"
            }
            if YiWuBingXinHan.selected {
                infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx += ",ywbpcxh"
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
        
        
        app.network.addWithInterface("Hfyw", andUser: app.userData, andInfo: ClassToJSON.getObjectData(infoOfHfblyzpbhtsfwywbgb), andExtraInfo: nil)
        
        print("\(COMMIT_OK)", terminator: "\n")
        
        
        if (COMMIT_OK == 9) {
            let alertView = UIAlertView(title: "提交成功", message:  "", delegate: self, cancelButtonTitle: "完成")
            alertView.show()
            print("\(ClassToJSON.getObjectData(infoOfHfblyzpbhtsfwywbgb))")
        } else if (COMMIT_OK != 9) {
            print("提交失败!!!!!!!!!!!!!!!!!!!!!!!!")
        }
        
    }
    
    func initHuiFu(dict: NSDictionary) {
        qiYeMingCheng.text = dict.valueForKey("yzyycsmc") as! String
        
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
        
        yingYeChangSUoMingCheng.text = dict.valueForKey("tzhzyzblywqyhyycsmc") as! String
        diZhi.text = dict.valueForKey("dz") as! String
        youBian.text = dict.valueForKey("yzbm") as! String
        lianXIRenXIngMing.text = dict.valueForKey("lxrxm") as! String
        lianXiDianHua.text = dict.valueForKey("lxdh") as! String
        huiFuBanLiShiJian.text = dict.valueForKey("hfbldsj") as! String
        qiTaShuoMingShiXiang.text = dict.valueForKey("qtxysmdsx") as! String
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//
//  ApplyRestoreBranchViewController.swift
//  PostalManageSystem
//
//  Created by QiaoLibo on 15/9/10.
//  Copyright (c) 2015年 IOS-developer. All rights reserved.
//

import UIKit

class ApplyRestoreBranchViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    
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
            label.text = app.applyAddDic.valueForKey("sppl") as? String
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
    
    //    var i = 0
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //        print("QQQQQQQQQQQQQQQQQQQQQQQQ\(++i)")
        //        bkView.backgroundColor = UIColor.redColor()
        bkView.frame.origin.y = (self.view as! UIScrollView).contentOffset.y + 500
        //        print("\(bkView.bounds.origin.y)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            
            commitBtn.enabled = true
        }
        
        if app.ServerData == 1 {
            
            let stateValueFromServer = app.applyRestoreDic.valueForKey("state") as! Int
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
            
            commitBtn.enabled = false
            commitBtn.setTitle("只可查看", forState: .Disabled)
            
            initHuiFu(app.applyRestoreDic)
        }
        
        if app.ServerData == 2 {
            
            let stateValueFromServer = app.applyRestoreDic.valueForKey("state") as! Int
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
            
            commitBtn.enabled = true
        }
      
    }

    @IBOutlet weak var commitBtn: UIButton!
    @IBAction func commit(sender: AnyObject) {
        print("-------------------提交--------------------------")
        let infoOfHfblyzpbhtsfwywbgb = InfoOfHfblyzpbhtsfwywbgb()
        infoOfHfblyzpbhtsfwywbgb.yzyycsmc = qiYeMingCheng.text
        
        
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
        
        infoOfHfblyzpbhtsfwywbgb.tzhzyzblywqyhyycsmc = yingYeChangSUoMingCheng.text
        infoOfHfblyzpbhtsfwywbgb.dz = diZhi.text
        infoOfHfblyzpbhtsfwywbgb.yzbm = youBian.text
        infoOfHfblyzpbhtsfwywbgb.lxrxm = lianXIRenXIngMing.text
        infoOfHfblyzpbhtsfwywbgb.lxdh = lianXiDianHua.text
        infoOfHfblyzpbhtsfwywbgb.hfbldsj = huiFuBanLiShiJian.text
        infoOfHfblyzpbhtsfwywbgb.qtxysmdsx = qiTaShuoMingShiXiang.text
        
        
        app.network .sendFormToServerWithInterface("Hfyw", andUser: app.userData, andInfo: ClassToJSON.getObjectData(infoOfHfblyzpbhtsfwywbgb), andExtraInfo: nil)
        
        print("\(infoOfHfblyzpbhtsfwywbgb.tzhxzblywsx)")
        print("\(ClassToJSON.getObjectData(infoOfHfblyzpbhtsfwywbgb))")
        
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

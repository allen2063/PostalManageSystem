//
//  ChangeUserInfoViewController.swift
//  POST
//
//  Created by QiaoLibo on 15/9/6.
//  Copyright (c) 2015年 Qiaolibo. All rights reserved.
//

import UIKit

class ChangeUserInfoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var zhangHao: UITextField!
    @IBOutlet weak var miMa: UITextField!
    @IBOutlet weak var xingMing: UITextField!
    @IBOutlet weak var diZhi: UITextField!
    @IBOutlet weak var lianXiDianHua: UITextField!
    @IBOutlet weak var dianZiYouXiang: UITextField!
    
    @IBOutlet weak var jiuMiMa: UITextField!
    @IBOutlet weak var xinMiMa: UITextField!
    @IBOutlet weak var chongXinShuRuMiMa: UITextField!
    
    

    @IBOutlet weak var changeUserInfoView: UIView!
    @IBOutlet weak var changePasswordView: UIView!
    @IBAction func changeUserInfoSegmentedControlValueChanged(sender: AnyObject) {
        if let segmentedControl = sender as? UISegmentedControl {
            let index = segmentedControl.selectedSegmentIndex
            print("Index: \(index)")
            switch index {
            case 0:
                changeUserInfoView.hidden = false
                changePasswordView.hidden = true
                if let rootView = self.view as? UIScrollView {
                    rootView.contentSize = CGSize(width: 320, height: 1490)
                }
            case 1:
                changeUserInfoView.hidden = true
                changePasswordView.hidden = false
                if let rootView = self.view as? UIScrollView {
                    rootView.contentSize = CGSize(width: 320, height: 1779)
                }
            default:
                break;
            }
        }

    }
    
    @IBAction func commitInChangeUserPassword(sender: AnyObject) {
        //该方法在修改密码segment中，点击提交时触发
        //jiuMiMa.text，xinMiMa.text，chongXinShuRuMiMa.text分别对应界面三个文本框输入的内容
        let oldPassFromServer = app.userData.valueForKey("userPass") as? String
        if (ConnectionAPI.md5(jiuMiMa.text) == oldPassFromServer) {
            let alert = UIAlertView(title: "请重新输入新密码", message: "新旧密码不能一样", delegate: nil, cancelButtonTitle: "返回重新编辑")
            alert.show()
        } else if (jiuMiMa.text == "") || (xinMiMa.text == "") || (chongXinShuRuMiMa.text == ""){
            jiuMiMa.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            xinMiMa.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
            chongXinShuRuMiMa.attributedPlaceholder = NSAttributedString(string: "不为空"
                , attributes: [NSForegroundColorAttributeName: UIColor.redColor()])
        } else {
            let alert = UIAlertView(title: "设置新密码成功", message: "", delegate: nil, cancelButtonTitle: "完成")
            alert.show()
            userInfo.userPass = xinMiMa.text
            print(ClassToJSON.getObjectData(userInfo))
        }
    }
    
    let userInfo: BaseUser = BaseUser()
    
    @IBAction func commitInChangeUserInfo(sender: AnyObject) {
        //该方法在修改用户信息segment中，点击提交时触发
        
//        userInfo1.userName = zhangHao.text
//        userInfo1.userPass = miMa.text
        userInfo.realName = xingMing.text
        userInfo.address = diZhi.text
        userInfo.teleNumber = lianXiDianHua.text
        userInfo.mailBox = dianZiYouXiang.text

        print("\(ClassToJSON.getObjectData(userInfo))")
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    var app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let labelNav = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
//        labelNav.backgroundColor = UIColor.clearColor
        labelNav.font = UIFont.boldSystemFontOfSize(20)
        labelNav.textColor = UIColor.whiteColor()
        labelNav.textAlignment = .Center
        labelNav.text = "用户信息修改"
        
        self.navigationItem.titleView = labelNav
        
        segmentedControl.frame.size.height = 40
        
        zhangHao.text = app.userData.valueForKey("userName") as? String
        zhangHao.enabled = false
        miMa.text = app.userData.valueForKey("userPass") as? String
        miMa.enabled = false
        xingMing.text = app.userData.valueForKey("realName") as? String
        diZhi.text = app.userData.valueForKey("address") as? String
        lianXiDianHua.text = app.userData.valueForKey("teleNumber") as? String
        dianZiYouXiang.text = app.userData.valueForKey("mailBox") as? String
        
    }
}

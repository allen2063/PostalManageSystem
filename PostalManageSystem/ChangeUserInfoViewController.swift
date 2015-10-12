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
    }
    
    @IBAction func commitInChangeUserInfo(sender: AnyObject) {
        //该方法在修改用户信息segment中，点击提交时触发
        let userInfo1: BaseUser = BaseUser()
        userInfo1.userName = zhangHao.text
        userInfo1.userPass = miMa.text
        userInfo1.realName = xingMing.text
        userInfo1.address = diZhi.text
        userInfo1.teleNumber = lianXiDianHua.text
        userInfo1.mailBox = dianZiYouXiang.text

        print("\(ClassToJSON.getObjectData(userInfo1))")
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segmentedControl.frame.size.height = 40
    }
}

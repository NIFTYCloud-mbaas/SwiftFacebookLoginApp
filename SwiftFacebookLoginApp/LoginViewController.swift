//
//  LoginViewController.swift
//  SwiftFacebookLoginApp
//
//  Created by Natsumo Ikeda on 2016/06/03.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

import UIKit
import NCMB

class LoginViewController: UIViewController {
    // label
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Loginボタン押下時の処理
    @IBAction func FacebookLoginBtn(sender: AnyObject) {
        // labelを空にする
        self.label.text = ""
        
        NCMBFacebookUtils.logInWithReadPermission(["email"]) {(user, error) -> Void in
            if (error != nil){
                if (error.code == NCMBErrorFacebookLoginCancelled){
                    // Facebookのログインがキャンセルされた場合
                    print("Facebookのログインがキャンセルされました")
                    self.label.text = "Facebookのログインがキャンセルされました"
                        
                }else{
                    // その他のエラーが発生した場合
                    print("エラーが発生しました：\(error.code)")
                    self.label.text = "エラーが発生しました：\(error.code)"
                        
                }
            }else{
                // 会員登録とログイン後の処理
                print("Facebookの会員登録とログインに成功しました：\(user.objectId)")
                self.performSegueWithIdentifier("login", sender: self)
                    
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


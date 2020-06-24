//
//  LoginViewController.swift
//  SwiftFacebookLoginApp
//
//  Created by cancc on 6/23/20.
//  Copyright © 2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

import UIKit
import NCMB
import FBSDKLoginKit

class LoginViewController: UIViewController {
    // label
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            self.performSegue(withIdentifier: "login", sender: self)
        }
    }

    
    
    // Loginボタン押下時の処理
    @IBAction func FacebookLoginBtn(sender: AnyObject) {
        // labelを空にする
        self.label.text = ""
        if (AccessToken.current != nil) {
            self.performSegue(withIdentifier: "login", sender: self)
        } else {
            let fbManager = LoginManager()
            let permission = ["email", "public_profile"]
            
            fbManager.logIn(permissions: permission, from: self, handler: { (result, error) in
                if (error != nil){
                    if(result!.isCancelled){
                        // Facebookのログインがキャンセルされた場合
                        print("Facebookのログインがキャンセルされました")
                        self.label.text = "Facebookのログインがキャンセルされました"
                    } else {
                        // その他のエラーが発生した場合
                        print("エラーが発生しました：\(String(describing: error))")
                        self.label.text = "エラーが発生しました：\(String(describing: error))"
                    }
                } else {
                    // 会員登録とログイン後の処理
                    if(result!.token?.userID != nil){
                        let facebookInfo:NSDictionary = [
                            "id":result!.token?.userID as Any,
                            "access_token":result!.token!.tokenString,
                            "expiration_date":result!.token!.expirationDate
                        ]
                        let user = NCMBUser()
                        user.signUp(withFacebookToken: facebookInfo as [NSObject : AnyObject], with: { (error) in
                            if(error != nil){
                                //会員登録に失敗した場合の処理
                                print("Facebookの会員登録とログインに成功しました：\(String(describing: user.objectId))");
                            } else {
                                //会員登録に成功した場合の処理
                                print("Facebookの会員登録とログインに成功しました：\(String(describing: user.objectId))");
                                self.performSegue(withIdentifier: "login", sender: self)
                            }
                        })
                    } else {
                        print("エラーが発生しました：\(String(describing: error))")
                        self.label.text = "エラーが発生しました：\(String(describing: error))"
                    }
                }
                
            })
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


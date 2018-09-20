//
//  LoginViewController.swift
//  SwiftFacebookLoginApp
//
//  Created by Natsumo Ikeda on 2016/06/03.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

import UIKit
import NCMB
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    // label
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            self.performSegueWithIdentifier("login", sender: self)
        }
    }
    
    // Loginボタン押下時の処理
    @IBAction func FacebookLoginBtn(sender: AnyObject) {
        // labelを空にする
        self.label.text = ""
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            self.performSegueWithIdentifier("login", sender: self)
        } else {
            let fbManager = FBSDKLoginManager()
            let permission = ["email", "public_profile"]
            
            fbManager.logInWithReadPermissions(permission, fromViewController: self, handler: { (result, error) in
                if (error != nil){
                    if(result.isCancelled){
                        // Facebookのログインがキャンセルされた場合
                        print("Facebookのログインがキャンセルされました")
                        self.label.text = "Facebookのログインがキャンセルされました"
                    } else {
                        // その他のエラーが発生した場合
                        print("エラーが発生しました：\(error.code)")
                        self.label.text = "エラーが発生しました：\(error.code)"
                    }
                } else {
                    // 会員登録とログイン後の処理
                    if(result.token.userID != nil){
                        let facebookInfo:NSDictionary = [
                            "id":result.token.userID,
                            "access_token":result.token.tokenString,
                            "expiration_date":result.token.expirationDate
                        ]
                        let user = NCMBUser()
                        user.signUpWithFacebookToken(facebookInfo as [NSObject : AnyObject], withBlock: { (error) in
                            if(error != nil){
                                //会員登録に失敗した場合の処理
                                print("Facebookの会員登録とログインに成功しました：\(user.objectId)");
                            } else {
                                //会員登録に成功した場合の処理
                                print("Facebookの会員登録とログインに成功しました：\(user.objectId)");
                                self.performSegueWithIdentifier("login", sender: self)
                            }
                        })
                    } else {
                        print("エラーが発生しました：\(error.code)")
                        self.label.text = "エラーが発生しました：\(error.code)"
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


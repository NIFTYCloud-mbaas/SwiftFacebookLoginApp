//
//  LogoutViewController.swift
//  SwiftFacebookLoginApp
//
//  Created by Natsumo Ikeda on 2016/06/03.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

import UIKit
import NCMB
import FBSDKLoginKit

class LogoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Logoutボタン押下時の処理
    @IBAction func logoutBtn(sender: AnyObject) {
        print("ログアウトしました")
        let fbManager = FBSDKLoginManager()
        // 非同期でログアウト
        NCMBUser.logOutInBackgroundWithBlock { (error) in
            if (error != nil) {
                //エラー処理
                print("Logout error /(error)")
            } else {
                fbManager.logOut()
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

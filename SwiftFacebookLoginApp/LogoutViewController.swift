//
//  LogoutViewController.swift
//  SwiftFacebookLoginApp
//
//  Created by cancc on 6/23/20.
//  Copyright © 2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
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
        let fbManager = LoginManager()
        // 非同期でログアウト
        NCMBUser.logOutInBackground { (error) in
            if (error != nil) {
                //エラー処理
                print("Logout error \(String(describing: error))")
            } else {
                fbManager.logOut()
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


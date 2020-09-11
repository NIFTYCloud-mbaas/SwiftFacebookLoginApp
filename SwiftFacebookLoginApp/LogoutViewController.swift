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
        NCMBUser.logOutInBackground(callback: { result in
        switch result {
            case .success:
                // ログアウトに成功した場合の処理
                print("ログアウトに成功しました")
                fbManager.logOut()
                DispatchQueue.main.async {
                  self.dismiss(animated: true, completion: nil)
                }
            
            case let .failure(error):
                // ログアウトに失敗した場合の処理
                print("ログアウトに失敗しました: \(error)")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


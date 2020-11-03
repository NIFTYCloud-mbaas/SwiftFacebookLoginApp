# 【iOS Swift】アプリにFacebookログイン機能をつけよう！
![画像1](/readme-img/001.png)

## 概要
* [ニフクラ mobile backend](https://mbaas.nifcloud.com/)の『SNS連携（Facebook連携）』を利用して、Facebookのログイン機能を実装したサンプルプロジェクトです
* Facebook連携で取得した会員データは[ニフクラ mobile backend](https://mbaas.nifcloud.com/)の『会員管理機能』として扱うことができます
 * [【iOS Swift】アプリにログイン機能をつけよう！](https://github.com/natsumo/SwiftLoginApp)も用意していますので、ぜひ活用してください☆
* このコンテンツは簡単な操作ですぐに [ニフクラ mobile backend](https://mbaas.nifcloud.com/)の機能を体験いただけます★☆

## ニフクラ mobile backendって何？？
スマートフォンアプリのバックエンド機能（プッシュ通知・データストア・会員管理・ファイルストア・SNS連携・位置情報検索・スクリプト）が**開発不要**、しかも基本**無料**(注1)で使えるクラウドサービス！

注1：詳しくは[こちら](https://mbaas.nifcloud.com/price.htm)をご覧ください

![画像2](/readme-img/002.png)

## 動作環境
* Mac OS 10.15(Catalina)
* Xcode ver. 12.0
* Simulator ver.12.0
* iPhone11 (iOS14.0)

※上記内容で動作確認をしています。
※古いバージョンだと動作しないい可能性があります。
※Simulatorでは動作しない可能性があります。実機ビルドが必要な場合は[こちら](http://qiita.com/natsumo/items/3f1dd0e7f5471bd4b7d9)をご覧ください。

## 手順
### 1. [ニフクラ mobile backend](https://mbaas.nifcloud.com/)の会員登録とログイン→アプリ作成

* 上記リンクから会員登録（無料）をします。登録ができたらログインをすると下図のように「アプリの新規作成」画面が出るのでアプリを作成します

![画像3](/readme-img/003.png)

* アプリ作成されると下図のような画面になります
* この２種類のAPIキー（アプリケーションキーとクライアントキー）はXcodeで作成するiOSアプリに[ニフクラ mobile backend](https://mbaas.nifcloud.com/)を紐付けるために使用します

![画像4](/readme-img/004.png)

* 動作確認後に会員情報（アクセストークン）が保存される場所も確認しておきましょう

![画像5](/readme-img/005.png)

### 2. [GitHub](https://github.com/natsumo/SwiftFileApp.git)からサンプルプロジェクトのダウンロード

* この画面([GitHub](https://github.com/natsumo/SwiftFileApp.git))の![画像10](/readme-img/010.png)ボタンをクリックし、さらに![画像11](/readme-img/011.png)ボタンをクリックしてサンプルプロジェクトをMacにダウンロードします

### 3. Xcodeでアプリを起動

* ダウンロードしたフォルダを開き、![画像09](/readme-img/009.png)をダブルクリックしてXcode開きます　![画像08](/readme-img/008.png)

![画像6](/readme-img/006.png)

### 4. APIキーの設定

* `AppDelegate.swift`を編集します
* 先程[ニフクラ mobile backend](https://mbaas.nifcloud.com/)のダッシュボード上で確認したAPIキーを貼り付けます

![画像07](/readme-img/007.png)

* それぞれ`YOUR_NCMB_APPLICATION_KEY`と`YOUR_NCMB_CLIENT_KEY`の部分を書き換えます
 * このとき、ダブルクォーテーション（`"`）を消さないように注意してください！
* 書き換え終わったら`command + s`キーで保存をします

### 5. FacebookSDKを使用するための準備と設定

* [facebook for developers](https://developers.facebook.com/)にログイン（Facebookアカウントがない場合はアカウントを作成して）して、右上の「マイアプリ」からの「新しいアプリを追加」を選択します

![画像12](/readme-img/012.png)

* iOSを選択し、アプリ名（任意）を入力し、「新しいFacebookアプリIDを作成」をクリックします
* 「連絡先メールアドレス」と「カテゴリ」を入力して「アプリIDを作成」をクリックしてFacebookアプリを作成します
* 「Quick Start for iOS」の画面が出ます
* 二番の「バンドルIDを追加する」を「Bundle Identifier」を入力します。XcodeプロジェクトのBundle IDをコピペしてください
* 「Save」ボタンをクリックします

<img src="readme-img/014.png" alt="画像14" width="800px"> 

* ダッシュボードに戻ります。

![画像15](/readme-img/015.png)

* 「アプリ名」と「アプリID」をXcodeプロジェクトの`Info.plist`にコピペします

![画像16](/readme-img/016.png)

* またこの「アプリID」は[ニフクラ mobile backend](https://mbaas.nifcloud.com/)にも設定します
* 「アプリ設定」＞「SNS連携」を開いてFacebook連携の「Facebook連携の許可」にある「許可する」を選択し、「保存する」をクリックします

![画像23](/readme-img/023.png)

* 最後に上の「開発中」を「ライブモード」に変更します。「ライブモードに切り替えますか？」を「モード切り替え」にしておきます

![画像18](/readme-img/018.png)

### 6. 動作確認

* Xcode画面で左上の実行ボタン（さんかくの再生マーク）をクリックします

* __ビルド時にエラーが発生した場合の対処方法__
 * Xcodeのバージョンが古い場合`import NCMB`にエラーが発生し、上手くSDKが読み込めないことがあります
 * その場合は[【Swift】SDKの読み込みにuse framework!が使えない場合の対処方法](http://goo.gl/Z1D0K3)をご覧いただき、別の読み込み方法をお試しください

* シミュレーターが起動したら、Login画面が表示されます
* __Login__ ボタンをクリックします

![画像19](/readme-img/019.png)

* Facebookログインのブラウザが画面が表示されるのでしたがってログインを行います
* ログインに失敗した場合は画面にエラー内容が表示されます（Facebookログインのブラウザ画面でキャンセルした場合は表示されません）
 * 万が一エラーが発生した場合は、[こちら](https://mbaas.nifcloud.com/doc/current/rest/common/error.html)よりエラー内容を確認いただけます
* ログインに成功したらログアウトします

![画像21](/readme-img/021.png)
![画像20](/readme-img/020.png)

-----

* 保存に成功したら、[ニフクラ mobile backend](https://mbaas.nifcloud.com/)のダッシュボードから「会員管理」を確認してみましょう！
* `authData`にはアクセストークンが保存されます

![画像1](/readme-img/001.png)

操作はここまでです

## 解説
サンプルプロジェクトに実装済みの内容のご紹介

#### SDKのインポートと初期設定
* ニフクラ mobile backend の[ドキュメント（クイックスタート）](https://mbaas.nifcloud.com/doc/current/introduction/quickstart_ios.html)をSwift版に書き換えたドキュメントをご用意していますので、ご活用ください
 * [SwiftでmBaaSを始めよう！(＜CocoaPods＞でuse_framewoks!を有効にした方法)](http://qiita.com/natsumo/items/57d3a4d9be16b0490965)
 * [＜CocoaPods＞SwiftでmBaaSを始めよう！](http://qiita.com/natsumo/items/b2d18d87d57300c8d81c)
* このサンプルは上記のuse_framewoks!を有効にした方法で行っていますが、Facebook連携でこの方法を使用する場合はエラーが発生します。そのため、[【続】SwiftでFacebook連携しよう！（＜CocoaPods＞でuse_frameworks!を有効にした場合）](http://qiita.com/natsumo/items/74453049d58d67363c29)の記事をベースに作業を行っています。
 * [SwiftでFacebook連携しよう！](http://qiita.com/natsumo/items/f5c4d41edae17a4a75ce)と合わせてご活用ください。

#### ロジック
* FacebookSDKを使用するための処理を`Appdelegate.swift`に記述しています

```swift
import UIKit
import NCMB
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //********** APIキーの設定 **********
    let applicationkey = "YOUR_NCMB_APPLICATIONKEY"
    let clientkey      = "YOUR_NCMB_CLIENTKEY"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //********** SDKの初期化 **********
        NCMB.setApplicationKey(applicationkey, clientKey: clientkey)

        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
        
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?,annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

}
```

* `Main.storyboard`でデザインを作成し、`LoginViewController.swift`と`LogoutViewController.swift`にロジックを書いています
 * Facebook連携はブラウザのFacebookページに遷移し、行われます。Facebookログインボタン押下時の処理は以下のように記述されます

```swift
//
//  LoginViewController.swift
//  SwiftFacebookLoginApp
//
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
                            print("Facebookの会員登録とログインに失敗しました：\(String(describing: user.objectId))");
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
```

```swift
//
//  LogoutViewController.swift
//  SwiftFacebookLoginApp
//

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

```

## 参考
### FacebookSDKを使ってFacebook会員認証するのとニフクラ mobile backendSDKを使ってFacebook会員認証するのは何が違うのか？

![画像22](/readme-img/022.png)

* もちろん直接FacebookSDKを呼ぶことも可能ですが、ニフクラ mobile backendSDKを呼べば裏でFacebookSDKを呼んで処理するNCMBUserメソッドが備わっているので、１つ呼べば、Facebookへのログインとニフクラ mobile backendへ会員情報保存が同時に行えるので一石二鳥というわけです
* また一度会員登録してしまえば、あとはニフクラ mobile backendの会員管理機能で処理が行えるので自前で会員管理システムを構築する必要がなくより楽に開発を行えます

### もっと深く知りたい方へ
* ニフクラ mobile backend の[ドキュメント（SNS連携：Facebook連携）](https://mbaas.nifcloud.com/doc/current/sns/facebook_ios.html)をSwift版に書き換えたドキュメントをご用意していますので、ご活用ください
 * [SwiftでFacebook連携しよう！](http://qiita.com/natsumo/items/74453049d58d67363c29)
 * [【続】SwiftでFacebook連携しよう！（＜CocoaPods＞でuse_frameworks!を有効にした場合）](http://qiita.com/natsumo/items/74453049d58d67363c29)
* 同じ内容の【Objective-C】版もご用意しています
 * https://github.com/natsumo/ObjcFacebookLoginApp

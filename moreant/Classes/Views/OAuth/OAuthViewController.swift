//
//  OAuthViewController.swift
//  moreant
//
//  Created by admin on 2020/6/5.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {
    
    public lazy var webview = UIWebView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.webview.loadRequest(URLRequest(url:NetworkTools.sharedTools.OAuthURL as URL))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc public func close()
    {
        dismiss(animated: true, completion: nil)
    }
    
    // 账号密码换成自己的
    @objc public func autoFill()
    {
        var js = "document.getElementById('userId').value='你的账号';"
        js += "document.getElementById('passwd').value='你的密码';"
        webview.stringByEvaluatingJavaScript(from: js)
    }

}

extension OAuthViewController:UIWebViewDelegate
{
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        guard let url = request.url , url.host == "www.baidu.com" else
        {
            return true
        }
        guard let query = url.query,query.hasPrefix("code") else
        {
            print("取消授权")
            return false
        }
        let code = String(query["code=".endIndex...])
        print(code)
        /*NetworkTools.sharedTools.loadAccessToken(code: code){
            (result,error)->() in
            if error != nil
            {
                print("错误")
                print(error as Any)
                return
            }
            let account = UserAccount(dict:result as! [String:AnyObject])
            print(account)
            self.loadUserInfo(account: account)
        }*/
        UserAccountViewModel.shareUserAccount.loadAccessToken(code: code){
            (isSuccessed)->() in
            if isSuccessed == true
            {
                print("ok")
                print(UserAccountViewModel.shareUserAccount.account as Any)
            }else{
                print("失败")
            }
        }
        return false
    }
    
    override func loadView() {
        view = webview
        webview.delegate = self
        title = "登陆新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(OAuthViewController.close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: .plain, target: self, action: #selector(OAuthViewController.autoFill))
    }
    
    /*func loadUserInfo(account:UserAccount)
    {
        NetworkTools.sharedTools.loadUserInfo(uid: account.uid!, accessToken: account.access_token!){
            (result,error)->Void in
            if error != nil
            {
                print("loadUserInfo: ")
                print(error as Any)
                return
            }
            guard let dict = result as? [String:AnyObject] else
            {
                print("格式错误")
                return
            }
            print(dict["screen_name"] as Any)
            print(dict["avatar_large"] as Any)
            
            account.screen_name = dict["screen_name"] as! String?
            account.avatar_large = dict["avatar_large"] as! String?
            
            print(account)
        }
    }*/

}






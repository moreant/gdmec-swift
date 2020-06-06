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
    
    @objc public func autoFill()
    {
        var js = "document.getElementById('userId').value='17688740114';"
        js += "document.getElementById('passwd').value='b$7L0FVF76Yh';"
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
        NetworkTools.sharedTools.loadAccessToken(code: code){
            (result,error)->() in
            if error != nil
            {
                print("错误")
                print(error as Any)
                return
            }
            let account = UserAccount(dict:result as! [String:AnyObject])
            print(account)
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

}






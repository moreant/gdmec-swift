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
        // super.viewDidLoad()

        // Do any additional setup after loading the view.
        view = webview
        title = "登陆新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(OAuthViewController.close))
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

}

//
//  WelcomeViewController.swift
//  moreant
//
//  Created by admin on 2020/6/27.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    public lazy var backImageVIew:UIImageView = UIImageView(imageName:"ad_background")
    public lazy var iconView:UIImageView = {
        let iv = UIImageView(imageName:"avatar_default_big")
        iv.layer.cornerRadius = 45
        iv.layer.masksToBounds = true
        return iv
    }()
    
    public lazy var welcomelabel:UILabel = UILabel(title:"欢迎归来")

    override func loadView() {
        view = backImageVIew
        
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}

extension WelcomeViewController
{
    public func setupUI()
    {
        view.addSubview(iconView)
        view.addSubview(welcomelabel)
        
        iconView.snp.makeConstraints{
            (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-200)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        
        welcomelabel.snp.makeConstraints{
            (make) in
            make.centerX.equalTo(iconView.snp.centerX)
            make.top.equalTo(iconView.snp.bottom).offset(14)
        }
    }
}

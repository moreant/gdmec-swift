//
//  WelcomeViewController.swift
//  moreant
//
//  Created by admin on 2020/6/27.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SDWebImage

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
        iconView.sd_setImage(with: UserAccountViewModel.shareUserAccount.avatarURL as URL, placeholderImage: UIImage(named:"avatar_default_big"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        iconView.snp.makeConstraints{
            (make) in
            make.bottom.equalTo(view.snp.bottom).offset(-view.bounds.height+200)
        }
        welcomelabel.alpha = 0
        UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: [], animations: {()-> () in self.view.layoutIfNeeded()}){
            (_) in
            UIView.animate(withDuration: 0.8, animations: {self.welcomelabel.alpha = 1}){
                (_) in
            }
        }
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

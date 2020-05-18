//
//  VistorView.swift
//  moreant
//
//  Created by admin on 2020/5/18.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class VistorView: UIView {
    
    public lazy var iconView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_smallicon"))
    
    public lazy var homeIconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_house"))
    
    public lazy var maskIconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_mask_smallicon"))
    
    public lazy var messageLable:UILabel = {
        let lable = UILabel()
        lable.text="关注一些人，回这里看看有什么惊喜"
        lable.textColor=UIColor.darkGray
        lable.font=UIFont.systemFont(ofSize: 14)
        lable.numberOfLines=0
        lable.textAlignment=NSTextAlignment.center
        return lable
    }()
    
    public lazy var registerButton:UIButton={
       let button=UIButton()
        button.setTitle("注册", for: UIControlState.normal)
        button.setTitleColor(UIColor.orange, for: UIControlState.normal)
        button.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState.normal)
        return button
    }()
    
    public lazy var loginButton:UIButton={
        let button=UIButton()
        button.setTitle("登录", for: UIControlState.normal)
        button.setTitleColor(UIColor.orange, for: UIControlState.normal)
        button.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControlState.normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupUI()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension VistorView
{
    public func setupUI()
    {
        addSubview(iconView)
        addSubview(homeIconView)
        addSubview(messageLable)
        addSubview(registerButton)
        addSubview(loginButton)
        addSubview(maskIconView)
        
        for v in subviews
        {
            v.translatesAutoresizingMaskIntoConstraints=false
            
        }
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .left, relatedBy: .equal, toItem: messageLable, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy: .equal, toItem: messageLable, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .right, relatedBy: .equal, toItem: messageLable, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: messageLable, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mask]-0-|", options: [], metrics: nil, views: ["mask":maskIconView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mask]-(btnHeight)-[regButton]", options: [], metrics: ["btnHeight":-36], views: ["mask":maskIconView,"regButton":registerButton]))
        
        backgroundColor=UIColor(white:237.0/255.0,alpha:1.0)
    }
}

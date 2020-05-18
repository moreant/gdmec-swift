//
//  VistorView.swift
//  moreant
//
//  Created by admin on 2020/5/18.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class VistorView: UIView {
    
    public lazy var iconImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_smallicon"))
    
    public lazy var homeIconView:UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_house"))
    
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
        addSubview(iconImageView)
        addSubview(homeIconView)
        for v in subviews
        {
            v.translatesAutoresizingMaskIntoConstraints=false
            
        }
    }
}

//
//  UILabel+Extension.swift
//  moreant
//
//  Created by admin on 2020/6/27.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UILabel
{
    convenience init(title:String,fontSzie:CGFloat = 14,color:UIColor = UIColor.darkGray)
    {
        self.init()
        text = title
        textColor = color
        font = UIFont.systemFont(ofSize: fontSzie)
        numberOfLines = 0
        textAlignment = NSTextAlignment.center
    }
}

//
//  UIBut+Extention.swift
//  moreant
//
//  Created by admin on 2020/5/18.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UIButton
{
    convenience init(imageName:String,backImageName:String)
    {
        self.init()
        setImage(UIImage(named:imageName), for: .normal)
        setImage(UIImage(named:imageName+"_highlighted"), for: .highlighted)
        
        setBackgroundImage(UIImage(named:backImageName), for: .normal)
        setBackgroundImage(UIImage(named:backImageName+"_highlighted"), for: .highlighted)
        
        sizeToFit()
    }
}

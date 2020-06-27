//
//  UIImageView+Extension.swift
//  moreant
//
//  Created by admin on 2020/6/27.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UIImageView
{
    convenience init(imageName:String)
    {
        self.init(image:UIImage(named:imageName))
    }
}

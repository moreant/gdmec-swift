//
//  UserAccount.swift
//  moreant
//
//  Created by admin on 2020/6/6.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    
    @objc var access_token:String?
    @objc var expiresDate:NSDate?
    @objc var expires_in:TimeInterval = 0
        {
        didSet {
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    @objc var uid:String?
    
    init(dict:[String:AnyObject])
    {
        super.init()
        self.setValuesForKeys(dict)
    }
    /*override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }*/
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String
        {
        let keys = ["access_token","expires_in","expiresDate","uid",]
        return dictionaryWithValues(forKeys: keys).description
    }
    
}

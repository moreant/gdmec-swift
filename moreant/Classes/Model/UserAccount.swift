//
//  UserAccount.swift
//  moreant
//
//  Created by admin on 2020/6/6.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class UserAccount: NSObject,NSCoding {
    
    @objc var access_token:String?
    @objc var uid:String?
    @objc var expiresDate:NSDate?
    @objc var screen_name:String?
    @objc var avatar_large:String?
    @objc var expires_in:TimeInterval = 0
        {
        didSet {
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
       }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token,forKey:"access_token")
        aCoder.encode(expiresDate,forKey:"expiresDate")
        aCoder.encode(uid,forKey:"uid")
        aCoder.encode(screen_name,forKey:"screen_name")
        aCoder.encode(avatar_large,forKey:"avatar_large")
    }
    
    required init?(coder aDecoder: NSCoder) {
        access_token=aDecoder.decodeObject(forKey: "access_token") as! String?
        expiresDate=aDecoder.decodeObject(forKey: "expiresDate") as! NSDate?
        uid=aDecoder.decodeObject(forKey: "uid") as! String?
        screen_name=aDecoder.decodeObject(forKey: "screen_name") as! String?
        avatar_large=aDecoder.decodeObject(forKey: "avatar_large") as! String?
    }
    
    
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
        let keys = ["access_token","expires_in","expiresDate","uid","screen_name","avatar_large"]
        return dictionaryWithValues(forKeys: keys).description
    }
    
    func saveUserAccount()
    {
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        path=(path as NSString).strings(byAppendingPaths: ["account.plist"]).last!
        print(path)
        NSKeyedArchiver.archiveRootObject(self, toFile: path)
    }
    
}

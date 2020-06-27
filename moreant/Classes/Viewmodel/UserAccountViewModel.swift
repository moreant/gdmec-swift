//
//  UserAccountViewModel.swift
//  moreant
//
//  Created by admin on 2020/6/15.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class UserAccountViewModel
{
    var account:UserAccount?
    var avatarURL:NSURL{
        return NSURL(string:account?.avatar_large ?? "")!
    }
    public var accountPath:String
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        return (path as NSString).strings(byAppendingPaths: ["account.plist"]).last!
    }
    
    var accessToken:String?{
        if !isExpired
        {
            return account?.access_token
        }
        return nil
    }
    
    init() {
        account=NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
        print(account ?? "默认值")
        if isExpired
        {
            print("已过期")
            account=nil
        }
    }
    
    public var isExpired:Bool
    {
        if account?.expiresDate?.compare(NSDate() as Date) == ComparisonResult.orderedDescending
        {
            return false
        }
        return true
    }
    var userLogin:Bool
    {
        return account?.access_token != nil && !isExpired
    }
    static let shareUserAccount=UserAccountViewModel()
}

extension UserAccountViewModel
{
    func loadAccessToken(code:String,finished:@escaping (_ isSuccessed:Bool)->())
    {
        NetworkTools.sharedTools.loadAccessToken(code: code){
            (result,error)->() in
            if error != nil
            {
                print("UAVM出错了")
                finished(false)
                return
            }
            self.account = UserAccount(dict:result as! [String:AnyObject])
            self.loadUserInfo(account:self.account!,finished:finished)
        }
    }
    
    func loadUserInfo(account:UserAccount,finished:@escaping (_ isSuccessed:Bool)->())
    {
        NetworkTools.sharedTools.loadUserInfo(uid: account.uid!){
            (result,error)->() in
            if error != nil
            {
                print("加载用户出错了")
                finished(false)
                return
            }
            guard let dict = result as?[String:AnyObject] else
            {
                print("格式错误")
                finished(false)
                return
            }
            
            print(dict["screen_name"] as Any)
            print(dict["avatar_large"] as Any)
            
            account.screen_name = dict["screen_name"] as! String?
            account.avatar_large = dict["avatar_large"] as! String?
            
            NSKeyedArchiver.archiveRootObject(account, toFile: self.accountPath)
            
            print(account)
            
            finished(true)
            
        }
    }
}

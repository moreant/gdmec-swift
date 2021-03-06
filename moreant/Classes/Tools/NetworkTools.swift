//
//  NetworkTools.swift
//  moreant
//
//  Created by admin on 2020/5/22.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTools: AFHTTPSessionManager {
    
    // 换成自己的
    public let appKey = "你的key"
    public let appSecret = "你的secret"
    public let redirectUrl = "http://www.baidu.com"
    
    typealias HMRequestCallBack = (AnyObject?,Error?)->Void
    
    public var tokenDict:[String:AnyObject]?{
        if let token = UserAccountViewModel.shareUserAccount.account?.access_token
        {
            return ["access_token":token as AnyObject]
        }
        return nil
    }
    
    var OAuthURL:NSURL{
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redirectUrl)&response_type=code"
        return NSURL(string:urlString)!
    }

    static let sharedTools:NetworkTools={
        let tools = NetworkTools(baseURL: nil)
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }()
    
}

extension NetworkTools
{
    /*
    func request(URLString:String,parameters:[String:AnyObject]?)
    {
        self.get(URLString, parameters: parameters, progress: nil, success: {(_,result) in
            print(result!)}) { (_, error) in
            print(error)
        }
    }
    */
    func request(method:HMRequestMethod,URLString:String,parameters:[String:AnyObject]?,finished:@escaping HMRequestCallBack)
    {
        
        let success = {(task:URLSessionDataTask?,result:Any?)->Void in
            finished(result as AnyObject,nil)
        }
        let failure = {(task:URLSessionDataTask?,error:Error)->Void in
            finished(nil,error)
        }
        
        if method == .GET
        {
        self.get(URLString, parameters: parameters, progress: nil,
                 success: success,failure:failure)
        }
        
        if method == .POST
        {
            self.post(URLString, parameters: parameters, progress: nil,
                 success: success,failure:failure)
        }
    }
    
    func loadAccessToken(code:String,finished:@escaping HMRequestCallBack)
    {
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let params = [
            "client_id" : appKey ,
            "client_secret" : appSecret ,
            "grant_type": "authorization_code" ,
            "code" : code ,
            "redirect_uri" : redirectUrl
        ] 
        request(method: .POST, URLString: urlString, parameters: params as [String : AnyObject], finished: finished)
    }
    
    func loadUserInfo(uid:String,finished:@escaping HMRequestCallBack)
    {
        guard var params = tokenDict else {
            finished(nil,NSError(domain:"cn.itcast.error",code:-1001,userInfo:["message":"token为空"]))
            return
        }
        
        let urlString = "https://api.weibo.com/2/users/show.json"
        params["uid"] = uid as AnyObject?
        request(method: .GET, URLString: urlString, parameters: params as [String : AnyObject], finished: finished)
        
    }
    
    /*func loadUserInfo(uid:String,accessToken:String,finished:@escaping HMRequestCallBack)
    {
        let urlString = "https://api.weibo.com/2/users/show.json"
        let params = [
            "uid":uid,
            "access_token":accessToken
        ]
        request(method: .GET, URLString: urlString, parameters: params as [String : AnyObject], finished: finished)
        
    }*/
    
}

enum HMRequestMethod:String
{
    case GET="GET"
    case POST="POST"
}

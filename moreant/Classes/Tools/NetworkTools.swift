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
    
    public let appKey = "1489607318"
    public let appSecret = "f23b7abec4619895d362f6d44f3388ae"
    public let redirectUrl = "http://www.baidu.com"
    
    var OAuthURL:NSURL{
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redirectUrl)&response_type=code"
        return NSURL(string:urlString)!
    }

    static let sharedTools:NetworkTools={
        let tools = NetworkTools(baseURL: nil)
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
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
    func request(method:HMRequestMethod,URLString:String,parameters:[String:AnyObject]?,finish:@escaping (_ result:AnyObject?,_ error:Error?)->())
    {
        if method == .GET
        {
        self.get(URLString, parameters: parameters, progress: nil,
                 success: {(_,result) in
                    print(result!)
        }) { (_, error) in
            finish(nil,error)
        }
        }
        
        if method == .POST
        {
            self.post(URLString, parameters: parameters, progress: nil,
                      success: {(_,result) in
                        print(result!)
            }) { (_, error) in
                finish(nil,error)
            }
        }
    }
}

enum HMRequestMethod:String
{
    case GET="GET"
    case POST="POST"
}

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

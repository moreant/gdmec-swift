//
//  MainViewController.swift
//  moreant
//
//  Created by admin on 2020/4/19.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController
{
    public func addChildViewControllers() {
        tabBar.tintColor=UIColor.orange
        addChildViewController(vc:HomeTableViewController(), title:"首页",imageName:"tabbar_home")
        addChildViewController(vc:MessageTableViewController(), title:"消息",imageName:"tabbar_message_center")
        addChildViewController(vc:DiscoverTableViewController(), title:"发现",imageName:"tabbar_discover")
        addChildViewController(vc:ProfileTableViewController(), title:"我",imageName:"tabbar_profile")
        
    }
    
    private func addChildViewController(vc:UIViewController,title:String,imageName:String){
        vc.title=title
        vc.tabBarItem.image=UIImage(named:imageName)
        let nav = UINavigationController(rootViewController:vc)
        addChildViewController(nav)
    }
}

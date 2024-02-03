
//  TabbarVC.swift
//  Cham
//  Created by osx on 09/03/21.
//  Copyright © 2021 osx. All rights reserved.

import UIKit

class TabbarVC: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.backgroundColor = UIColor.black
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//            let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
//        if selectedIndex == 1 ||  selectedIndex == 2 {
//                guard getToken() != "" else {
//                    topMostVC?.alert("ALERT!", message: "Please login first")
//                    return false
//                }
//                return true
//
//            }
//
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ReloadData"), object: nil)
        return true


        }
}

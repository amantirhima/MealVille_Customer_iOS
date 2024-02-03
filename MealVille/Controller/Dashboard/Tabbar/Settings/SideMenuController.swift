
//SideMenuController.swift
//Cham
//Created by osx on 05/03/21.
//Copyright © 2021 osx. All rights reserved.

import UIKit
import MMDrawerController



@available(iOS 13.0, *)
class SideMenuController: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet var sideMenuTableView: UITableView!


    var sideMenuOptionNames = ["Home","Orders","Profile","Logout"]
 
    var currencySymbol = String()
    //MARK:- Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibFileName()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
    }
    

    
    //MARK:- Class functions
    func registerNibFileName() {
        self.sideMenuTableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableViewCell")
    }
    
    func closeSideMenu(){
        if let  slideMenuController = self.slideMenuController() {
            slideMenuController.closeLeft()
        }
    }
 

}

//MARK:- EXTENSION TABLEVIEW
@available(iOS 13.0, *)
extension SideMenuController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuOptionNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
        //cell.imgView.image = sideMenuOptionImages[indexPath.row]
        cell.lblName.text = sideMenuOptionNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            closeLeft()
        case 1:
            let vc = ENUM_STORYBOARD<OrderHistoryVC>.main.instantiativeVC()
            self.navigationController?.pushViewController(vc, animated: true)
        default: break
        }
        closeLeft()
    }
    
    func setScreen(){
        // DashboardSetup
        let tabBarStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let dashboard = tabBarStoryBoard.instantiateViewController(withIdentifier: "DashboardVC") as? DashboardVC
        
        let sideMenu = tabBarStoryBoard.instantiateViewController(withIdentifier: "SideMenuController") as? SideMenuController
      
            let show = SlideMenuController(mainViewController: dashboard!, leftMenuViewController: sideMenu!)
            let rootNC = UINavigationController(rootViewController: show)
            rootNC.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController  = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
//           UIApplication.shared.windows[0].rootViewController = rootNC
//           UIApplication.shared.windows[0].makeKeyAndVisible()
    }
}

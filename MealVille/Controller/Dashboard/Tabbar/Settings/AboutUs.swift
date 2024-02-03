//
//  SettingsVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 26/06/22.
//

import UIKit

class AboutUs: UIViewController {
    
    @IBOutlet var aboutUsTableView: UITableView!
    var sideMenuOptionNames = ["Privacy & Policies","Term & Conditions"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibFileName()

    }
    //MARK:- Class functions
    func registerNibFileName() {
        self.aboutUsTableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableViewCell")
    }
    
    //MARK:- ACTION BUTTONS
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  

}
@available(iOS 13.0, *)
extension AboutUs: UITableViewDataSource, UITableViewDelegate {
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
//        switch indexPath.row {
//        case 0:
//            closeLeft()
//        case 1:
//            let vc = ENUM_STORYBOARD<OrderHistoryVC>.main.instantiativeVC()
//            self.navigationController?.pushViewController(vc, animated: true)
//        default: break
//        }
//        closeLeft()
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

    }
}

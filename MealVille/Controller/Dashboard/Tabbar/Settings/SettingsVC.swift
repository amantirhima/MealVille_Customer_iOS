//
//  SettingsVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 26/06/22.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet var settingTableView: UITableView!
    var sideMenuOptionNames = ["Profile","About Us","FeedBack","Rate us on Store","Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibFileName()

    }
    //MARK:- Class functions
    func registerNibFileName() {
        self.settingTableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableViewCell")
    }
  

}
@available(iOS 13.0, *)
extension SettingsVC: UITableViewDataSource, UITableViewDelegate {
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
            let vc = ENUM_STORYBOARD<SignupVC>.main.instantiativeVC()
            vc.isEdit = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ENUM_STORYBOARD<AboutUs>.main.instantiativeVC()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ENUM_STORYBOARD<FeedBackVC>.main.instantiativeVC()
            self.navigationController?.pushViewController(vc, animated: true)
        default: break
        }
       // closeLeft()
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

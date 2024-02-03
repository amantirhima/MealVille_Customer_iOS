
//  SignupVC.swift
//  MealVille
//  Created by Amandeep tirhima on 07/05/22.

import UIKit
import  DropDown
import GooglePlaces

class SignupVC: UIViewController,UITextFieldDelegate {
    
    //MARK:- Outlets
    @IBOutlet var txtFirstName: UITextField!
    @IBOutlet var txtBuilding: UITextField!
    @IBOutlet var txtCompany: UITextField!
    @IBOutlet var txtFloor: UITextField!
    @IBOutlet var btnBuilding: UIButton!
    @IBOutlet var btnFloor: UIButton!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblAccountCreation: UILabel!
    @IBOutlet var btnSignup: UIButton!
    @IBOutlet var ViewFixedLunchTime: UIView!
    @IBOutlet var viewNotFixedLunchTime: UIView!
    @IBOutlet var btnFixedLunchTime: UIButton!
    @IBOutlet var btnNotFixedLunchTime: UIButton!
    
    @IBOutlet var ViewTowerA: UIView!
    @IBOutlet var viewTowerB: UIView!
    @IBOutlet var btnTowerA: UIButton!
    @IBOutlet var btnTowerB: UIButton!
    @IBOutlet var viewTowers: UIView!

    
    //MARK:- Properties
    var floorArray = ["Basement","1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th","11th","12th","13th"]

    let buildingDropdown = DropDown()
    let floorDropDown = DropDown()
    var companies = [Companies]()
   // var companiesName = [String]()
    var companiesName =  ["Bestech","Impinge","Rabaab"]
    var phonenumber = ""
    var buildingId = 0
    
    var isEdit = false

    
    //MARK:- Life cycle methods 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
    
    func setView(){
        //Api's
        //self.getCompany()
        self.setData()
        self.configureDropdown(dropDown: buildingDropdown, anchorView: btnBuilding)
        self.configureDropdown(dropDown: floorDropDown, anchorView: btnFloor)
        self.viewTowers.isHidden = true
        
        guard   isEdit == false else {return }
        self.setPlaceHolder()
    }
    
    
    func setData(){
        lblTitle.text = isEdit == true ?  "Edit Profile" : "Sign Up"
        lblAccountCreation.isHidden  = isEdit == true ?  true    : false
        btnSignup.setTitle(isEdit == true ?  "Save"    : "SignUp", for: .normal)
    }
    
    func setPlaceHolder(){
        txtFirstName.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txtBuilding.attributedPlaceholder = NSAttributedString(string: "Building", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txtCompany.attributedPlaceholder = NSAttributedString(string: "Company", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txtFloor.attributedPlaceholder = NSAttributedString(string: "Floor", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    //MARK:- Apis
    func getCompany(){
        
        

//        let params:[String:Any] = [:]
//        GetApiResponse.shared.getCompany(params: params) { [self]  (data: CompaniesModel) in
//            print(data)
//            if data.statusCode == 200 {
//                self.companies = data.data
//                companiesName =  self.companies.compactMap({$0.plotNumber + " ," + $0.name})
//                self.companiesName.reverse()
//                buildingDropdown.dataSource = ["Bestech","Impinge","Rabaab"]// companiesName
//                print(companiesName)
//            }
//        }
    }
    //MARK:- Api's
    func sighUp() {
        let params:[String:Any] = [
            "firstName":txtFirstName.text!,
            "phone":"8383838388",
            "buildingId":buildingId,
            "companyId":"4",
            "email":"fs@gmail.com",
        ]
        print(params)
        GetApiResponse.shared.signUp(params: params) { (data: LoginStruct) in
            print(data)
            guard data.statusCode == 200 || data.statusCode == 401 else {
                Utilities.shared.showAlert(title: "ALERT!", msg: data.message!)
                return
            }
            self.setScreen()
        }
    }
    
    //MARK:- Actions
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func continueAction(_ sender: Any) {
        self.setScreen()

        //sighUp()
    }
    @IBAction func buildings(_ sender: Any) {
        buildingDropdown.show()
    }
    @IBAction func floors(_ sender: Any) {
        floorDropDown.show()
    }
    
    @IBAction func fixed(_ sender: Any) {
        ViewFixedLunchTime.isHidden = false
        viewNotFixedLunchTime.isHidden = true
        btnFixedLunchTime.backgroundColor = UIColor.green
        btnNotFixedLunchTime.backgroundColor = UIColor.black
    }
    
    @IBAction func notfixed(_ sender: Any) {
        ViewFixedLunchTime.isHidden = true
        viewNotFixedLunchTime.isHidden = false
        btnNotFixedLunchTime.backgroundColor = UIColor.green
        btnFixedLunchTime.backgroundColor = UIColor.black
    }
    @IBAction func towerA(_ sender: Any) {
        ViewTowerA.isHidden = false
        //viewTowerB.isHidden = true
        btnTowerA.backgroundColor = UIColor.green
        btnTowerB.backgroundColor = UIColor.black
    }
    
    @IBAction func towerB(_ sender: Any) {
       // ViewTowerA.isHidden = true
        viewTowerB.isHidden = false
        btnTowerB.backgroundColor = UIColor.green
        btnTowerA.backgroundColor = UIColor.black
    }
        
    @IBAction func lunchTime(_ sender: Any) {
        let vc = ENUM_STORYBOARD<LunchTimeSelectionVC>.main.instantiativeVC()
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       let autocompleteController = GMSAutocompleteViewController()
       autocompleteController.delegate = self
       present(autocompleteController, animated: true, completion: nil)
   }

    
    
    private func configureDropdown(dropDown : DropDown, anchorView : AnchorView?) {
        dropDown.direction = .bottom
        dropDown.selectionBackgroundColor = UIColor.clear
        dropDown.backgroundColor = UIColor.white
        dropDown.textColor = UIColor.black
        dropDown.separatorColor = UIColor.black
        dropDown.anchorView = anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        
        dropDown.dataSource = dropDown == buildingDropdown ? companiesName : floorArray

        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            guard  dropDown == buildingDropdown else {
                self.btnFloor.setTitle(item, for: .normal)
                floorDropDown.hide()

                return
            }
            self.btnBuilding.setTitle(item, for: .normal)
            
            self.viewTowers.isHidden = item == "Bestech" ? false : true
            
            ///self.buildingId =   self.companies[index].id
            print("building Id",buildingId)
            buildingDropdown.hide()
        }
    }
    
    func setScreen(){
        // DashboardSetup
        let tabBarStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let dashboard = tabBarStoryBoard.instantiateViewController(withIdentifier: "TabbarVC") as? TabbarVC
        let sideMenu = tabBarStoryBoard.instantiateViewController(withIdentifier: "SideMenuController") as? SideMenuController
            let show = SlideMenuController(mainViewController: dashboard!, leftMenuViewController: sideMenu!)
            let rootNC = UINavigationController(rootViewController: show)
            rootNC.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension SignupVC:GMSAutocompleteViewControllerDelegate {
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print( place.formattedAddress)
        self.txtCompany.text = place.formattedAddress
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
        
     //User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
}

//
//  LoginVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 07/05/22.
//

import UIKit
import GoogleSignIn


class LoginVC: UIViewController {
    
    @IBOutlet var txtPhonenumber: UITextField!
    let signInConfig = GIDConfiguration.init(clientID: "649785242224-rd8oe2togb4iu0pbpola5qs1405kse3v.apps.googleusercontent.com")
    
    //MARK:- Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func googleLogin() {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
                guard error == nil else {
                    print(error as Any)
                    return
                }
            guard let user = user else { return }
//            self.socialLogin(loginType: LoginType.Google.rawValue, email:(user.profile!.email), firstName: (user.profile?.givenName)!, lastName: (user.profile?.familyName)!, imageUrl: "")

            }
    }
    
    //MARK:- Api's
    func sendOtp() {
        let params:[String:Any] = [
            "phone":txtPhonenumber.text!,
        ]
        print(params)
        GetApiResponse.shared.sendOtp(params: params) { (data: LoginStruct) in
            print(data)
            guard data.statusCode == 200 || data.statusCode == 401 else {
                Utilities.shared.showAlert(title: "ALERT!", msg: data.message!)
                return
            }
            let vc = ENUM_STORYBOARD<OtpVerificationVC>.main.instantiativeVC()
            vc.phonenumber = self.txtPhonenumber.text!
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    //MARK:- Actions
    @IBAction func continueAction(_ sender: Any) {
        //self.sendOtp()
        let vc = ENUM_STORYBOARD<OtpVerificationVC>.main.instantiativeVC()
        //vc.phonenumber = txtPhonenumber.text!
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

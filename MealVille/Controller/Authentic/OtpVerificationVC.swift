//
//  OtpVerificationVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 08/05/22.

import UIKit
import OTPFieldView


class OtpVerificationVC: UIViewController {
    
   // @IBOutlet var txtOtp: UITextField!
    @IBOutlet var viewOtpSeen: OTPFieldView!

    var userOtp:String = ""
    var phonenumber:String = ""


    
    //MARK:- Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpOTP()
    }
    
    //MARK:- Actions
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setUpOTP() {
            self.viewOtpSeen.fieldsCount = 4
            self.viewOtpSeen.fieldBorderWidth = 2
            self.viewOtpSeen.defaultBorderColor = UIColor.black
            self.viewOtpSeen.filledBorderColor = UIColor.darkGray
            self.viewOtpSeen.cursorColor = UIColor.darkGray
            self.viewOtpSeen.displayType = .underlinedBottom
            self.viewOtpSeen.fieldSize = 40
            self.viewOtpSeen.separatorSpace = 8
            self.viewOtpSeen.shouldAllowIntermediateEditing = false
            self.viewOtpSeen.delegate = self
            self.viewOtpSeen.initializeUI()
    }
    
    //MARK:- Api's
    func verify() {
        let params:[String:Any] = [
           "phone":phonenumber,
            "otp": self.userOtp
        ]
        print(params)
        GetApiResponse.shared.verify(params: params) { (data: LoginStruct) in
            print(data)
            guard data.statusCode == 200  else {
                Utilities.shared.showAlert(title: "ALERT!", msg: data.message!)
                return
            }
            let vc = ENUM_STORYBOARD<SignupVC>.main.instantiativeVC()
            vc.phonenumber = self.phonenumber
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func continueAction(_ sender: Any) {
       // self.verify()
        let vc = ENUM_STORYBOARD<SignupVC>.main.instantiativeVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
@available(iOS 13.0, *)
extension OtpVerificationVC:OTPFieldViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        true
    }
    
    func enteredOTP(otp: String) {
        print("OTPString: \(otp)")
        self.userOtp =  otp // Int64("\(otp)")!
    }
        
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print("Has entered all OTP? \(hasEnteredAll)")
        return false
    }
}

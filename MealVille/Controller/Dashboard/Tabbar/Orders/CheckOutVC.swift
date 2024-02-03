//
//  CheckOutVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 08/05/22.
//

import UIKit
class CheckOutVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

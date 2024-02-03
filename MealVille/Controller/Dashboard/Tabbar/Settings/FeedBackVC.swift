//
//  FeedBackVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 04/07/22.
//

import UIKit

class FeedBackVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- ACTION BUTTONS
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

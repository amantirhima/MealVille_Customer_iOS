//
//  OrderHistoryVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 11/06/22.
//

import UIKit

class OrderHistoryVC: UIViewController {
    //MARK:-  Outlets
    @IBOutlet var orderstableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFileName()
    }
    //MARK:-  Class methods
    func registerNibFileName() {
        self.orderstableview.register(UINib(nibName: "UserOrderHistoryCell", bundle: nil), forCellReuseIdentifier: "UserOrderHistoryCell")
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension OrderHistoryVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserOrderHistoryCell", for: indexPath) as! UserOrderHistoryCell
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
}

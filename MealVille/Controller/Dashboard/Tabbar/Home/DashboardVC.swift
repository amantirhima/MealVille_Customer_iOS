//
//  DashboardVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 17/04/22.
//

import UIKit
struct Serices {
    var service:String!
    var isSelected:Bool!
    init(service:String,isSelected:Bool) {
        self.service = service
        self.isSelected = isSelected
    }
}

class DashboardVC: UIViewController {
    //MARK:- Properties
    @IBOutlet var servicesCollectiontable: UICollectionView!
    @IBOutlet var servicestableview: UITableView!
    
    var serviceArray = [Serices]()
    var selctedIndex = 0

    //MARK:-Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibFileName()
    }
    
    //MARK:-  Class methods
    func registerNibFileName() {
        self.servicestableview.tableFooterView = UIView()
        serviceArray = [Serices(service: "Lunch", isSelected: true),
                        Serices(service: "BreakFast", isSelected: false)
        ]
        self.servicesCollectiontable.register(UINib(nibName: "ServiceTimeCollection", bundle: nil)
                                                , forCellWithReuseIdentifier: "ServiceTimeCollection")
    }
    
    
    //MARK:- Actions

    @IBAction func menu(sender:UIButton){
    }
    
   
    @IBAction func orderNow(_ sender: Any) {
        let vc = ENUM_STORYBOARD<CheckOutVC>.main.instantiativeVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
@available(iOS 13.413.4, *)
extension DashboardVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  serviceArray.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = servicesCollectiontable.dequeueReusableCell(withReuseIdentifier: "ServiceTimeCollection", for: indexPath) as! ServiceTimeCollection
        cell.lblService.text = serviceArray[indexPath.row].service
        cell.selectedView.isHidden = selctedIndex  == indexPath.row ? true : false

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cell = servicesCollectiontable!.dequeueReusableCell(withReuseIdentifier: "ServiceTimeCollection", for: indexPath ) as! ServiceTimeCollection
        return CGSize(width: 100, height: servicesCollectiontable.frame.size.height)
    }
        
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selctedIndex = indexPath.row
        self.servicesCollectiontable.reloadData()
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      
        return 0
        
    }
}

//
//  MealTypeVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 03/06/22.
//

import UIKit
struct Time {
    var breakTime:String!
   
    init(breakTime:String) {
        self.breakTime = breakTime
    }
}


class LunchTimeSelectionVC: UIViewController {
    @IBOutlet var timeCollectionTable: UICollectionView!
    
    var TimeDetail = [Time]()
    var selectedTime: Int?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibFileName()
       // self.setPaging()
        self.setData()

        // Do any additional setup after loading the view.
    }
    //MARK:-  Class methods
    func registerNibFileName() {
    
        self.timeCollectionTable.register(UINib(nibName: "LunchTimeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "LunchTimeCollectionCell")
    }

    func setData(){
        self.TimeDetail = [ Time(breakTime: "1:00 pm"),
                            Time(breakTime: "1:15 pm"),
                            Time(breakTime: "1:30 pm"),
                            Time(breakTime: "1:45 pm"),
                            Time(breakTime: "2:00 pm"),
                            Time(breakTime: "2:30 pm"),
                            Time(breakTime: "2:15 pm"),
                            Time(breakTime: "2:30 pm"),
                            Time(breakTime: "2:45 pm"),
                            Time(breakTime: "3:00 pm")
        ]
    }
    
    //MARK:- ACTION BUTTONS
    @IBAction func btnSideMenu(_ sender: Any) {
        if let slideMenuController = self.slideMenuController() {
            slideMenuController.openLeft()
        }
        print("Click")
    }
}


extension LunchTimeSelectionVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  TimeDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LunchTimeCollectionCell", for: indexPath) as! LunchTimeCollectionCell
        
        cell.lblTime.text = TimeDetail[indexPath.row].breakTime
        cell.viewTime.backgroundColor = selectedTime == indexPath.row ? UIColor.green : UIColor.black
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedTime = indexPath.row
        self.timeCollectionTable.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (self.timeCollectionTable.frame.width/3.0 - 30) - 5 , height: (50))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }

}

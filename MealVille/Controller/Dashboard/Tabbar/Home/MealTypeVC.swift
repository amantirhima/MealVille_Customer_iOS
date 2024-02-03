//
//  MealTypeVC.swift
//  MealVille
//
//  Created by Amandeep tirhima on 03/06/22.
//

import UIKit
struct MealDetail {
    var Mealcategory:String!
    var MealPrice:String!
   
    init(Mealcategory:String,MealPrice:String) {
        self.Mealcategory = Mealcategory
        self.MealPrice = MealPrice
      
    }
}


class MealTypeVC: UIViewController {
    @IBOutlet var mealtypetableview: UITableView!
    @IBOutlet var introCollectionTable: UICollectionView!
    @IBOutlet weak var pagerView: UIPageControl!
    
    var Detail = [MealDetail]()
    var offerArray  = [UIImage(named: "offer1"),UIImage(named: "offer4"),UIImage(named: "offer3"),UIImage(named: "offer2")]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibFileName()
       // self.setPaging()
        self.setData()

        // Do any additional setup after loading the view.
    }
    //MARK:-  Class methods
    func registerNibFileName() {
        self.mealtypetableview.register(UINib(nibName: "MealTypeCell", bundle: nil), forCellReuseIdentifier: "MealTypeCell")
        self.introCollectionTable.register(UINib(nibName: "IntroImageCell", bundle: nil), forCellWithReuseIdentifier: "IntroImageCell")
    }
    
//    func setPaging() {
//        self.pagerView.numberOfPages = 4
//        self.pagerView.hidesForSinglePage = true
//    }
    
    func setData(){
        self.Detail = [ MealDetail(Mealcategory: "Lunch", MealPrice: "$60"),
                        MealDetail(Mealcategory: "BreakFast", MealPrice: "")
        ]
        
       // self.Detail = [ MealDetail(Mealcategory: "Lunch", MealPrice: "$60")]
    }
    
    //MARK:- ACTION BUTTONS
    @IBAction func btnSideMenu(_ sender: Any) {
        if let slideMenuController = self.slideMenuController() {
            slideMenuController.openLeft()
        }
        print("Click")
    }
}
extension MealTypeVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Detail.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTypeCell", for: indexPath) as! MealTypeCell
        
        cell.lblMealType.text = Detail[indexPath.row].Mealcategory
        cell.lblMealPrice.text =  Detail[indexPath.row].MealPrice
        cell.lblMealCount.isHidden = indexPath.row == 0 ? false : true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ENUM_STORYBOARD<CheckOutVC>.main.instantiativeVC()
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
}

extension MealTypeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroImageCell", for: indexPath) as! IntroImageCell
        cell.imgGallaries.image = offerArray[indexPath.row]
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: introCollectionTable.frame.width, height: introCollectionTable.frame.height + 20)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay c: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //currentIndex = indexPath.item
        //self.pagerView.currentPage = indexPath.item
    }
}

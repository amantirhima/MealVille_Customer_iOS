//
//  BoardingScreensVC.swift
//  Bigg.ly
//
//  Created by Amandeep Tirhima on 21/04/22.

import UIKit
import  SwiftGifOrigin


@available(iOS 13.0, *)
class BoardingScreensVC: UIViewController {
    
    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pagerView: UIPageControl!
    @IBOutlet weak var btnSkip: UIButton!
    
    var currentIndex = 0
  
    var imagesArray = [UIImage.gif(name: "wow"),UIImage(named: "boarding2"),UIImage(named: "boarding1")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibFileName()
        self.setPaging()
    }
    
    //SET PAGING ON BANNERS
    func setPaging() {
        self.pagerView.numberOfPages = 3
        self.pagerView.currentPage = 0
        self.pagerView.hidesForSinglePage = true
    }
    
    func registerNibFileName() {
        self.bannerCollectionView.register(UINib(nibName: "BoardingCollectoinCell", bundle: nil), forCellWithReuseIdentifier: "BoardingCollectoinCell")
    }
    
    @IBAction func skip(_ sender: Any) {
        let vc = ENUM_STORYBOARD<LoginVC>.main.instantiativeVC()
        self.navigationController?.pushViewController(vc, animated: true)
       // moveToDashboard()
    }
    
    
    func moveToDashboard(){
        let tabBarStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let dashboard = tabBarStoryBoard.instantiateViewController(withIdentifier: "UploadViewController") as? LoginVC
        let sideMenu = tabBarStoryBoard.instantiateViewController(withIdentifier: "SideMenuController") as? SideMenuController
        
        let show =  SlideMenuController(mainViewController: dashboard!, rightMenuViewController: sideMenu!)
        let rootNC = UINavigationController(rootViewController: show)
        rootNC.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
  
}

@available(iOS 13.4, *)
extension BoardingScreensVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardingCollectoinCell", for: indexPath) as! BoardingCollectoinCell
        cell.imgView.image = imagesArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: bannerCollectionView.frame.size.width, height: bannerCollectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay c: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       // currentIndex = indexPath.item
      //  print(currentIndex)
        self.pagerView.currentPage = indexPath.item
        btnSkip.setTitle(indexPath.item == 2 ?"GET STARTED" : "SKIP"  , for: .normal)
    }
}

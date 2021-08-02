//
//  businessView.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/10/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class businessView: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    lazy var refresher : UIRefreshControl = {
           let refresher = UIRefreshControl()
        //   self.CollectionBusiness.alwaysBounceVertical = true
        //   self.CollectionBusiness.bounces = true
           refresher.addTarget(self, action: #selector(refreche), for: .valueChanged)
           return refresher
       }()
       @objc private func refreche(){
           self.viewDidLoad()
           self.view.setNeedsLayout()
           CollectionBusiness.reloadData()
           self.refresher.endRefreshing()
       }
    private var ArrayBusiness = [HomeNewsModule]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .black)
        CollectionBusiness.register(UINib(nibName: "CellBusinessView", bundle: nil), forCellWithReuseIdentifier: "BusinessCell")
        getApiBusiness()
        CollectionBusiness.translatesAutoresizingMaskIntoConstraints = false
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if self.ArrayBusiness[section].status == "ok"{
          return self.ArrayBusiness[section].articles!.count}
          else {return 0}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionBusiness.dequeueReusableCell(withReuseIdentifier:"BusinessCell", for: indexPath) as! CellBusinessView
        cell.CellNameBusiness.text = self.ArrayBusiness[indexPath.section].articles![indexPath.row].source!.name
        cell.CellTitleBusiness.text = self.ArrayBusiness[indexPath.section].articles![indexPath.row].title
        cell.CellDescriptionBusiness.text = self.ArrayBusiness[indexPath.section].articles![indexPath.row].description
        HomeNews.image(imge: cell.CellImagBusiness, re: self.ArrayBusiness[indexPath.section].articles![indexPath.row].urlToImage ?? "")
              return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (CollectionBusiness.frame.size.width)
        let hight = (CollectionBusiness.frame.size.height)
        return CGSize(width: width, height: hight)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
             guard let link = self.ArrayBusiness[indexPath.section].articles![indexPath.row].url else { return }
                  if let url = URL(string: link) {
                      UIApplication.shared.open(url, options: [:], completionHandler: { (_) in
                      })
                  }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
               cell.alpha = 0
                UIView.animate(withDuration: 1) {
                cell.alpha = 1.0    }
    }

    @IBOutlet weak var MainView: UIView!
    
    @IBOutlet weak var CollectionBusiness: UICollectionView!
    
    func getApiBusiness(){
        Alamofire.request(URLs.businessUrl).responseJSON { (response) in
             
             do {
                 let user = try JSONDecoder().decode(HomeNewsModule.self, from: response.data!)
                 self.ArrayBusiness = [user]
                self.CollectionBusiness.delegate = self
                self.CollectionBusiness.dataSource = self
                self.CollectionBusiness.reloadData()
             }catch let errore {
                 print("the Errore" , errore)
             }
         }
         
     }
}

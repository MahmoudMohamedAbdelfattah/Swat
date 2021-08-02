//
//  HomeNews.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/9/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
class HomeNews: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var ArrayHomeModule = [HomeNewsModule]()
   
    @IBOutlet weak var tableNewsHome: UITableView!
    @IBOutlet weak var MainView: circle!

    class func image(imge:UIImageView,re:String){
           let url = URL(string: re)
           imge.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil)
           imge.kf.indicatorType = .activity
       }
    
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(refreche), for: .valueChanged)
        return refresher
    }()
    @objc private func refreche(){
        self.viewDidLoad()
        self.view.setNeedsLayout()
        tableNewsHome.reloadData()
        self.refresher.endRefreshing()
    }
    
    func TabBarConfig() {
        guard let tabbar = self.tabBarController?.tabBar else {return}
        tabbar.barTintColor = .black
        tabbar.tintColor = .white
        tabbar.unselectedItemTintColor = .systemGray
        tabbar.layer.cornerRadius = 30
        tabbar.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        tabbar.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let link = "http://www.swat-security.net/?fbclid=IwAR174Sr0yxTGCpOCBE5odKn2OShs7Kk12vScBoE4oF6SirIxoy1gGgA1y7I"
                  if let url = URL(string: link) {
                      UIApplication.shared.open(url, options: [:], completionHandler: { (_) in
                          
                      })
                  }
        MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .black)
        tableNewsHome.register(UINib(nibName: "CellHomepage", bundle: nil), forCellReuseIdentifier: "CellNewsHome")
        tableNewsHome.separatorColor = .clear
        getApiNews()
        TabBarConfig()
        self.navigationController?.navigationBar.isHidden = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         if self.ArrayHomeModule[section].status == "ok"{
                   return self.ArrayHomeModule[section].articles!.count}
               else {return 0}
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableNewsHome.dequeueReusableCell(withIdentifier:"CellNewsHome") as! CellHomepage
        cell.NameNews.text = self.ArrayHomeModule[indexPath.section].articles![indexPath.row].source!.name
        cell.TitleNews.text = self.ArrayHomeModule[indexPath.section].articles![indexPath.row].title
        cell.descriptionNews.text = self.ArrayHomeModule[indexPath.section].articles![indexPath.row].description
        HomeNews.image(imge: cell.ImageNews, re: self.ArrayHomeModule[indexPath.section].articles![indexPath.row].urlToImage ?? "")
           return cell
       }
    
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        return UITableView.automaticDimension
          }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // set initial cell
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        // final initial cell
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let link = self.ArrayHomeModule[indexPath.section].articles![indexPath.row].url else { return }
               if let url = URL(string: link) {
                   UIApplication.shared.open(url, options: [:], completionHandler: { (_) in
                   })
               }
    }
    
    
    // Func Get Api
    func getApiNews(){
        Alamofire.request(URLs.headlineEygpt).responseJSON { (response) in
            print(request)
            do {
                let user = try JSONDecoder().decode(HomeNewsModule.self, from: response.data!)
               self.ArrayHomeModule = [user]
               self.tableNewsHome.delegate = self
               self.tableNewsHome.dataSource = self
                self.tableNewsHome.reloadData()
            }catch let errore {
                print("the Errore" , errore)
            }
        }
    }
    
}

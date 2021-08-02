//
//  EntertainmentView.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/11/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
class EntertainmentView: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var MainView: circle!
    @IBOutlet weak var entertainmentTableView: UITableView!
    private var ArrayEnterainment = [HomeNewsModule]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        entertainmentTableView.register(UINib(nibName: "CellHomepage", bundle: nil), forCellReuseIdentifier: "CellNewsHome")
        MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .black)
        self.navigationController?.navigationBar.isHidden = true

        entertainmentTableView.separatorColor = .clear
        getApiEntertainment()

    }
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
            if self.ArrayEnterainment[section].status == "ok"{
                      return self.ArrayEnterainment[section].articles!.count}
                  else {return 0}
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = entertainmentTableView.dequeueReusableCell(withIdentifier:"CellNewsHome") as! CellHomepage
           cell.NameNews.text = self.ArrayEnterainment[indexPath.section].articles![indexPath.row].source!.name
           cell.TitleNews.text = self.ArrayEnterainment[indexPath.section].articles![indexPath.row].title
           cell.descriptionNews.text = self.ArrayEnterainment[indexPath.section].articles![indexPath.row].description
           HomeNews.image(imge: cell.ImageNews, re: self.ArrayEnterainment[indexPath.section].articles![indexPath.row].urlToImage ?? "")
              return cell
          }
       
          func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         
           return UITableView.automaticDimension
             }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           guard let link = self.ArrayEnterainment[indexPath.section].articles![indexPath.row].url else { return }
                  if let url = URL(string: link) {
                      UIApplication.shared.open(url, options: [:], completionHandler: { (_) in
                      })
                  }
       }
       
       
       // Func Get Api
       func getApiEntertainment(){
           Alamofire.request(URLs.EntertainmentURL).responseJSON { (response) in
               print(request)
               do {
                   let user = try JSONDecoder().decode(HomeNewsModule.self, from: response.data!)
                  self.ArrayEnterainment = [user]
                  self.entertainmentTableView.delegate = self
                  self.entertainmentTableView.dataSource = self
                   self.entertainmentTableView.reloadData()
               }catch let errore {
                   print("the Errore" , errore)
               }
           }
       }
    
}

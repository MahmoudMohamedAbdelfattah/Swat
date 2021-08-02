//
//  helthView.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/11/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
class helthView: UIViewController, UITableViewDelegate ,UITableViewDataSource {

    private var ArrayHelth = [HomeNewsModule]()

    @IBOutlet weak var MainView: circle!
    
    @IBOutlet weak var helthTable: UITableView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           helthTable.register(UINib(nibName: "CellHomepage", bundle: nil), forCellReuseIdentifier: "CellNewsHome")
           MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .black)
           self.navigationController?.navigationBar.isHidden = true

           helthTable.separatorColor = .clear
           getApiEntertainment()

       }
       
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              
               if self.ArrayHelth[section].status == "ok"{
                         return self.ArrayHelth[section].articles!.count}
                     else {return 0}
             }
             
             func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 let cell = helthTable.dequeueReusableCell(withIdentifier:"CellNewsHome") as! CellHomepage
              cell.NameNews.text = self.ArrayHelth[indexPath.section].articles![indexPath.row].source!.name
              cell.TitleNews.text = self.ArrayHelth[indexPath.section].articles![indexPath.row].title
              cell.descriptionNews.text = self.ArrayHelth[indexPath.section].articles![indexPath.row].description
              HomeNews.image(imge: cell.ImageNews, re: self.ArrayHelth[indexPath.section].articles![indexPath.row].urlToImage ?? "")
                 return cell
             }
          
             func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
              return UITableView.automaticDimension
                }
          
          func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              guard let link = self.ArrayHelth[indexPath.section].articles![indexPath.row].url else { return }
                     if let url = URL(string: link) {
                         UIApplication.shared.open(url, options: [:], completionHandler: { (_) in
                         })
                     }
          }
          
          
          // Func Get Api
          func getApiEntertainment(){
            Alamofire.request(URLs.helthURL).responseJSON { (response) in
                  print(request)
                  do {
                      let user = try JSONDecoder().decode(HomeNewsModule.self, from: response.data!)
                     self.ArrayHelth = [user]
                     self.helthTable.delegate = self
                     self.helthTable.dataSource = self
                      self.helthTable.reloadData()
                  }catch let errore {
                      print("the Errore" , errore)
                  }
              }
          }
       
}

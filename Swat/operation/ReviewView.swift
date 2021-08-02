//
//  ReviewView.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 12/2/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Firebase
class ReviewView: UIViewController , UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var saveButt: UIButton!
    @IBOutlet weak var DetailView: UIView!
    @IBOutlet weak var NameSiteLbl: UILabel!
    @IBOutlet weak var NameSite: UITableView!
    @IBOutlet weak var Mainview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Mainview.CornerRadiusBorderNum(Radius: 40, BorderWidth: 2, color: .white)
        NameSite.CornerRadiusBorderNum(Radius: 20, BorderWidth: 1, color: .white)
        DetailView.CornerRadiusBorderNum(Radius: 15, BorderWidth: 1, color: .white)
        saveButt.CornerRadiusBorderNum(Radius: 15, BorderWidth: 2, color: .white)
        
        SetupNameSiteTableView ()
         GetDataNameSite()
    }
    
    private func SetupNameSiteTableView () {
        NameSite.delegate = self
        NameSite.dataSource = self
        NameSite.clipsToBounds = true
        NameSite.allowsMultipleSelection = true
        NameSite.separatorStyle = .none
        NameSite.register(UINib(nibName: "ReviewCell", bundle: nil), forCellReuseIdentifier: "sitename")
        NameSite.reloadData()
        
        
    }
    
    private var AllNameSite : [String] = []
    
    private func GetDataNameSite() {
        
        let reference = Database.database().reference()
          reference.child("SendMessage").observe(.childAdded) { (snapshot) in
            let namesite = [snapshot.key]
            self.AllNameSite.append(contentsOf: namesite)
            print(self.AllNameSite)
            self.NameSite.reloadData()
        }
        
    }
    
    @IBAction func SaveButton(_ sender: UIButton) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AllNameSite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NameSite.dequeueReusableCell(withIdentifier: "sitename", for: indexPath) as! ReviewCell
        cell.NameSites.text! = AllNameSite[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SelectSite = AllNameSite[indexPath.row]
        NameSiteLbl.text! = SelectSite
    }

}

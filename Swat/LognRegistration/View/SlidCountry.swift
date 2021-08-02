//
//  SlidCountry.swift
//  Com2020
//
//  Created by mahmoud abdelfattah on 2/22/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

protocol PasseNameCountry : AnyObject {
    func NameCountry (name:String)
}

class SlidCountry: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tableview: UITableView!
    weak var delegate : PasseNameCountry?
    var CountryName : String?
    
    var NamesGoverment = ["الإسكندرية","الإسماعيلية","أسوان","أسيوط","الأقصر","الغردقة","دمنهور","بورسعيد","الجيزة","المنصورة","الخارجة","المنيا","مرسى مطروح","كفر الشيخ","قنا","بنها","القاهرة","الفيوم","طنطا","العريش","الزقازيق","السويس","سوهاج","دمياط","المنصورة","الجيزة"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        //mainView.layer.cornerRadius = self.mainView.frame.size.height * 0.1
        mainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 0, color: nil)
        mainView.clipsToBounds = true
        tableview.allowsMultipleSelection = true
        tableview.separatorStyle = .none
        tableview.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CellGoverment")
        
    }
  
    
}

    
extension SlidCountry: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NamesGoverment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellGoverment", for: indexPath) as! CountryCell
         cell.CountryName?.text = NamesGoverment[indexPath.row]
        cell.CountryName?.textColor = UIColor.black
        let backgroundview = UIView()
        backgroundview.backgroundColor = UIColor(red: 245/255, green: 159/255, blue: 0/255, alpha: 1)
        cell.selectedBackgroundView = backgroundview
        
        //
        //        if (indexPath.row % 2 == 0 ){
        //            cell.backgroundColor = .gray
        //        }else {
        //            cell.backgroundColor =  .white
        //        }
        
         if (indexPath.row) % 2 == 0  {
                  cell.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
              }
              else {
                  cell.backgroundColor = .white
              }
              return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.CountryName = NamesGoverment[indexPath.row]
        self.delegate?.NameCountry(name: self.CountryName!)
        dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
}


//
//  DepartmentOperation.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 11/26/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Firebase
class DetialAllCutsomer: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
 
    @IBOutlet weak var DetailCollection: UICollectionView!
    @IBOutlet weak var MainView: circle!
    @IBOutlet weak var IMGSwaT: UIImageView!
    
    private var AllInformationForCustomer = [AllDataSendForCustomer]()
    private var AllUser = UserModel()
    override func viewDidLoad() {
        super.viewDidLoad()
         MainView.CornerRadiusBorderNum(Radius: 40, BorderWidth: 2, color: .white)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector ( self.ReverseView))
                   IMGSwaT.addGestureRecognizer(tapGestureRecognizer)
                   // لكي الصوره تعمل
                   IMGSwaT.isUserInteractionEnabled = true
        GetData()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
           DetailCollection.register(UINib(nibName: "customerdatacell", bundle: nil), forCellWithReuseIdentifier: "InfoMessage")
        DetailCollection.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .black)
           self.DetailCollection.dataSource = self
           self.DetailCollection.delegate = self
           self.DetailCollection.bounces = true
        DetailCollection.isPagingEnabled = true
           self.DetailCollection .reloadData()
    }
    
    
    @objc func ReverseView(){
          self.navigationController?.popViewController(animated: true)
         }
    // mahmoud ali
    class func sendtime(date:String)->String{
            let string = date
            let dateFormatter = DateFormatter()
             dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
             dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
             let date = dateFormatter.date(from: string)!
              dateFormatter.dateFormat = "yyyy-MM-dd"
                 
               let dateString = dateFormatter.string(from: date)
                 print("EXACT_DATE : \(dateString)")
                 return dateString
       }
//    func convertDateFormatter(date: String) -> String {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//this your string date format
//        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
//    dateFormatter.locale = Locale(identifier: "your_loc_id")
//    let convertedDate = dateFormatter.date(from: date)
//    guard dateFormatter.date(from: date) != nil else {
//    assert(false, "no date from string")
//    return ""
//    }
//    dateFormatter.dateFormat = "yyyy-MM-dd"///this is what you want to convert format
//        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
//    let timeStamp = dateFormatter.string(from: convertedDate!)
//    print(timeStamp)
//    return timeStamp
//    }
//
    
    // get from Sender Message
    private func GetData() {
        let reference = Database.database().reference()
        reference.child("SendMessage").observe(.childAdded) { (snapshot) in
            if let ddd = snapshot.value as? [String : Any] {
              //  print(ddd)
                let time : Double =  ddd["date"] as! Double
                print(time)
                let Datee  = NSDate(timeIntervalSince1970: time / 1000)
                print(Datee)
                let AllInfo =  AllDataSendForCustomer.init(NameCustomer: ddd["NameCustomer"] as? String, ResponsibleName: ddd["ResponsibleName"] as? String, Adress: ddd["Adress"] as? String, email: ddd["email"] as? String, date : Datee, phoneNumber: ddd["phone"] as? String, kindCustomer: ddd["kindCustomer"] as? String, SenderNamee : ddd["SendEmail"] as? String)
                self.AllInformationForCustomer.append(AllInfo)
              self.DetailCollection.reloadData()
                print(self.AllInformationForCustomer)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return   AllInformationForCustomer.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let DataCustomer = self.AllInformationForCustomer[indexPath.row]
         let cell = DetailCollection.dequeueReusableCell(withReuseIdentifier: "InfoMessage", for: indexPath) as! customerdatacell
        
        cell.AddressTxt.text = DataCustomer.Adress
        cell.NameOrgniztion.text = DataCustomer.NameCustomer
        cell.EmailTxt.text = DataCustomer.email
        cell.NameResponsible.text = DataCustomer.ResponsibleName
        cell.PhonTxt.text = DataCustomer.phoneNumber
        cell.DateTxt.text = DetialAllCutsomer.sendtime(date: "\(DataCustomer.date ?? Date() as NSDate)")
        cell.FieldWork.text = DataCustomer.kindCustomer
        cell.NameSales.text = DataCustomer.SenderNamee
        return cell
     }
}

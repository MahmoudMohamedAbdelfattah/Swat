//
//  SenderMessCustomer.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 11/18/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Firebase
class SenderMessCustomer: UIViewController {

    @IBOutlet weak var KindJobTxt: UITextField!
    @IBOutlet weak var EmailCustomerTxt: UITextField!
    @IBOutlet weak var NameCustomerTxt: UITextField!
    @IBOutlet weak var SaveButt: UIButton!
    @IBOutlet weak var NameResponsible: UITextField!
    @IBOutlet weak var AddressTxt: UITextField!
    @IBOutlet weak var PhoneCustomerTxt: UITextField!
    @IBOutlet weak var stackInfo: UIStackView!
    @IBOutlet weak var MainView: circle!
    @IBOutlet weak var LogoIMG: UIImageView!
    private var AllUser = UserModel()

    @IBOutlet weak var IMGSwat: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MainView.CornerRadiusBorderNum(Radius: 40, BorderWidth: 2, color: .white)
        SaveButt.CornerRadiusBorderNum(Radius: 15, BorderWidth: 1, color: .white)
        
        // back view
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector ( self.ReverseView))
             IMGSwat.addGestureRecognizer(tapGestureRecognizer)
             // لكي الصوره تعمل
             IMGSwat.isUserInteractionEnabled = true
    }
    @objc func ReverseView(){
        self.navigationController?.popViewController(animated: true)
       }
    @IBAction func ButtSave(_ sender: UIButton) {
        guard let Adress = AddressTxt.text?.trimmend, !Adress.isEmpty else {
                Validat_Termining_alert.showAlert(message: "Pleas Enter Your Adress", my: self)
               return
           }
        
        guard let KindJobCustomer = KindJobTxt.text?.trimmend, !KindJobCustomer.isEmpty else {
                      Validat_Termining_alert.showAlert(message: "Pleas Enter Your Adress", my: self)
                     return
                 }
        
        
        guard let Phone = PhoneCustomerTxt.text, !Phone.isEmpty else {
                   Validat_Termining_alert.showAlert(message: "Pleas enter your Phone", my: self)
                   return
           }
        if !Phone.isPhoneNumber{
                 Validat_Termining_alert.showAlert(message: "Pleas enter correcet Phone", my: self)
                 return
             }
        guard let name = NameCustomerTxt.text?.trimmend , !name.isEmpty else {
                   Validat_Termining_alert.showAlert(message: "Pleas Enter Your name", my: self)
                   
                   return
               }
        guard let ResponsibleName = NameResponsible.text?.trimmend , !ResponsibleName.isEmpty else {
                   Validat_Termining_alert.showAlert(message: "Pleas Enter Your name", my: self)
                   return
               }

        guard let Email = EmailCustomerTxt.text?.trimmend , !Email.isEmpty else {
              Validat_Termining_alert.showAlert(message: "Pleas enter your Email", my: self)
               return
           }
           if !Validat_Termining_alert.isValidEmail(TestEmail: Email){
              Validat_Termining_alert.showAlert(message: "the error enter email", my: self)
               return
           }
        // func mahmoud
        
        // Create Time Date from server
         
        let time : Double = 1606247975684
        let date = NSDate(timeIntervalSince1970: time / 1000)
        print(date)
        let timestamp = ServerValue.timestamp()
        // Record User NAme
        let userID = Auth.auth().currentUser?.uid
               let databasRef = Database.database().reference().child("InfoUser/\(userID ?? "")")
                    databasRef.observe(.value) { (snapshot) in
                        if let NameUser = snapshot.value as? [String : Any] {
                            self.AllUser.name = NameUser["UserNAme"] as? String
                                     print( self.AllUser.name!)
                                 }
        let reference = Database.database().reference()
                                  //   let UserID = Auth.auth().currentUser?.uid
        let namefire  = reference.child("SendMessage").child("\(name)")
     let dataArray : [String : Any] = ["Adress" : Adress,"email" : Email , "NameCustomer" : name , "phone" : Phone , "kindCustomer" : KindJobCustomer , "SendEmail" : self.AllUser.name!
                                        ,"date" : timestamp , "ResponsibleName" : ResponsibleName]
                                         namefire.setValue(dataArray)
                             }
        self.navigationController?.popViewController(animated: true)

 
     
    }

}

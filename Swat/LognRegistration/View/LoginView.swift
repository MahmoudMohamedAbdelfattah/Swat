//
//  LoginView.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/14/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Firebase


enum Departments: String {
    case hr = "-MM3R9V0vFh3yTZhnInP"
    case operation = "-MM3RC1MlP_31kq7buQW"
    case account = "-MM3RDjXyWfASpcnt36p"
    case Purchases = "-MMB1pys9CDUBYmcJe_e"
    case Sales = "-MMB015yF2B1WARkOWPK"
    case Store = "-MM8iZwTXK8Tx1JzKipt"
}

class LoginView: UIViewController {

    @IBOutlet weak var IMGSwat: UIImageView!
    @IBOutlet weak var ButtSignIn: UIButton!
    @IBOutlet var textfield: [UITextField]!
    @IBOutlet weak var TextPassword: UITextField!
    @IBOutlet weak var TextEmail: UITextField!
    @IBOutlet weak var IMGPassword: UIImageView!
    @IBOutlet weak var IMGEmail: UIImageView!
    @IBOutlet weak var ViewSignIn: UIView!
    @IBOutlet weak var ViewPassword: UIView!
    @IBOutlet weak var ViewEmail: UIView!
    @IBOutlet weak var viewGradiant: UIView!
    private var AllUser = UserModel()
    var departmenbtType:  Departments?
    @objc func ReverseView(){
     self.navigationController?.popViewController(animated: true)
    }
    
    // func delegate text
    func delegatText() {
        for text in textfield {
            text.delegate = self
        }

    }
    
  
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegatText()
       // Gradiant()
      //  LoadData()
      ViewPassword.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .black )
      ViewEmail.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .black)
      viewGradiant.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)
      ViewSignIn.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .black)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector ( LoginView.ReverseView))
                 IMGSwat.addGestureRecognizer(tapGestureRecognizer)
                 // لكي الصوره تعمل
                 IMGSwat.isUserInteractionEnabled = true
    }
    
    
    @IBAction func SignInButt(_ sender: UIButton) {
        
            // don't empty
             guard let emailAddres = TextEmail.text , let password = TextPassword.text  else {return}
             if(emailAddres.isEmpty == true || password.isEmpty == true )  {
                 Validat_Termining_alert.showAlert(message: "pleas fill empty fiel", my: self)
             }
        else {
             Auth.auth().signIn(withEmail: emailAddres, password: password) { (result, errore) in
                 if (errore == nil ){
                    let userID = Auth.auth().currentUser?.uid
                     print(userID!)
                    let databasRef = Database.database().reference().child("InfoUser/\(userID ?? "")")
                    databasRef.observe(.value) { (snapshot) in
                        if let ddd = snapshot.value as? [String : Any] {
                            self.AllUser.JobID = ddd["JobID"] as? String
                            print( self.AllUser.JobID!)
                        }
                    }
          if self.AllUser.JobID == Departments.hr.rawValue {
           ViewController.trans(name: "hrDepartment", my: self)}
          else if self.AllUser.JobID == Departments.operation.rawValue {
           ViewController.trans(name: "operationDepatment", my: self) }
          else if self.AllUser.JobID == Departments.account.rawValue {
           ViewController.trans(name: "AccountDepartment", my: self) }
          else if self.AllUser.JobID == Departments.Store.rawValue {
           ViewController.trans(name: "StoreDeparment", my: self) }
          else if self.AllUser.JobID == Departments.Sales.rawValue {
           ViewController.trans(name: "SalesDepartment", my: self) }
          else if self.AllUser.JobID == Departments.Purchases.rawValue {
            ViewController.trans(name: "PurchasesDepartment", my: self) }
           }
                 else {
                 Validat_Termining_alert.showAlert(message: "Wrong username OR Paswword", my: self)
                 }
             }
             }
        self.ButtSignIn.backgroundColor = UIColor.blue
    }
 //  private let userID = Auth.auth().currentUser?.uid
  //  private let ref = Database.database().reference().child("InfoUser").child(<#T##pathString: String##String#>)

//    private func LoadData(){
//        ref.observeSingleEvent(of: .value) { (snapshot) in
//            print(snapshot)
//            if let data = snapshot.value as?[String : Any]{
//            //    for (key,value) in data {
//               
//               let firstKey = Array(data.keys)[0]  // or .first
////                    print(firstKey)
////
////                    }
////                    print (data["-MLLTVRRPEcYFFQBnW8L"])
//               
//          //     }
//            //   print(data["-MLLTVRRPEcYFFQBnW8L"])
//        //   let firstKey = Array(data.keys)[1]  // or .first
//           //   let secound = Array(data.keys)[1]
//              // print(secound)
//
//            }
//        
//    }
//    }
    
    @IBAction func ButtShowPass(_ sender: UIButton) {
        self.IMGPassword.image = UIImage(named: "password1")
        self.TextPassword.isSecureTextEntry = !self.TextPassword.isSecureTextEntry
    }
    
   
}

extension LoginView : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0{
            if textField.text!.isEmpty{
                self.IMGEmail.image = UIImage(named: "Subtraction 1")
                ViewEmail.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
            }else{
                self.IMGEmail.image = UIImage(named: "Subtraction 1-1")
                ViewEmail.layer.borderColor = UIColor.blue.cgColor
               
            }
            
        }else{
            if textField.text!.isEmpty {
            ViewPassword.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
            self.IMGPassword.image = UIImage(named: "password")
            
            } else {
                ViewPassword.layer.borderColor = UIColor.blue.cgColor
                self.IMGPassword.image = UIImage(named: "password1")
                
            }
        }
       
        
    }
 
    func textFieldDidBeginEditing(_ textField: UITextField) {
         if textField.tag == 0 {
         ViewEmail.layer.borderColor = UIColor.blue.cgColor
         self.IMGEmail.image = UIImage(named: "Subtraction 1-1")
         
         } else {
             ViewPassword.layer.borderColor = UIColor.blue.cgColor
             self.IMGPassword.image = UIImage(named: "password1")
         }
        
         
    }
}

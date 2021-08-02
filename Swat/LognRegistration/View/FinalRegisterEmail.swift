//
//  FinalRegisterEmail.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/14/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Firebase

class FinalRegisterEmail : UIViewController {
    
    @IBOutlet weak var IMGBack: UIImageView!
    @IBOutlet var AllText: [UITextField]!
    @IBOutlet weak var SaveButt: UIButton!
    @IBOutlet weak var IMGConPass: UIImageView!
    @IBOutlet weak var IMgPass: UIImageView!
    @IBOutlet weak var IMGemail: UIImageView!
    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var MainView: circle!
    
    @IBOutlet weak var ConfPass: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var ConfPassView: UIView!
    @IBOutlet weak var PassView: UIView!
//    private weak var data = RegistrationView()
    
    var infoUserFinalRegister: UserModel?
    var RegisterWithJob : JobModel?
   // var ss = JobModel[ind]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("welcom job id")
        print(RegisterWithJob!.JobID!)
          print("welcom job name")
        print(RegisterWithJob!.JobName!)

        print(infoUserFinalRegister)
        MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)
        EmailView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
         PassView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
         ConfPassView.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .lightGray)
        SaveButt.CornerRadiusBorderNum(Radius: 15, BorderWidth: 2, color: .lightGray)
        // 
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector ( FinalRegisterEmail.ReverseView))
        IMGBack.addGestureRecognizer(tapGestureRecognizer)
        // لكي الصوره تعمل
        IMGBack.isUserInteractionEnabled = true
       
        for text in AllText {
            text.delegate = self
        }
    }

  @objc func ReverseView(){
        self.navigationController?.popViewController(animated: true)
       }

    @IBAction func SaveButt(_ sender: UIButton) {
        guard let Email = EmailTxt.text?.trimmend , !Email.isEmpty else {
           Validat_Termining_alert.showAlert(message: "Pleas enter your Email", my: self)
            return
        }
        if !Validat_Termining_alert.isValidEmail(TestEmail: Email){
           Validat_Termining_alert.showAlert(message: "the error enter email", my: self)
            return
        }
        
        guard let emailAddres = EmailTxt.text , let password = PasswordTxt.text , let ConfirmPass = ConfPass.text else {return}
            if(emailAddres.isEmpty == true || password.isEmpty == true || ConfirmPass.isEmpty == true)  {
                Validat_Termining_alert.showAlert(message: "the error enter email", my: self)
                 Validat_Termining_alert.showAlert(message: "the error enter email", my: self)
            } else if (password != ConfirmPass) {
             Validat_Termining_alert.showAlert(message: "Password and Config Password not as same", my: self)
            }
            
            // to create & send FireBase
            Auth.auth().createUser(withEmail: emailAddres, password: password) { (result, errore) in
                if (errore == nil ){
            guard let userId = result?.user.uid else {return}
            let reference = Database.database().reference()
               if let info = self.infoUserFinalRegister {
            let user  = reference.child("InfoUser").child(userId)
                
//                let UserID  = reference.child("Administrative/\(self.RegisterWithJob!.JobID!)").child(userId)
//                let arry  : [String : Any] = ["UID":userId]
            
                let dataArray : [String : Any] = ["UserNAme" : info.name!,"Age" : info.Age! ,"NumerPhone":info.phoneNumber!,"Goverment":info.Goverment!,"Adress":info.address!,"Social":info.SocialStatus!,"Relgion":info.Relgion!,"Qualfiaction":info.Qualification!,"license":info.License!,"Recuirment":info.Recruitment!,"JobID":info.JobID!]
                    user.setValue(dataArray)
            //    UserID.setValue(arry)
              //  UserID.setValue(userId)
                        
             }
           }
        }
        ViewController.trans(name: "ViewLogin", my: self)
//        let RegistrationInfo = self.storyboard?.instantiateViewController(withIdentifier: "Info") as! LoginView
//       self.navigationController?.pushViewController(RegistrationInfo, animated: true)
    }
}


// Text Change Border
extension FinalRegisterEmail : UITextFieldDelegate {
    
   func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0{
            if textField.text!.isEmpty{
                self.IMGemail.image = UIImage(named: "Subtraction 3")
                EmailView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
            }else{
                self.IMGemail.image = UIImage(named: "Subtraction 3-1")
                EmailView.layer.borderColor = UIColor.black.cgColor
                
            }
            
        }else if textField.tag == 1 {
            if textField.text!.isEmpty {
                PassView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.IMgPass.image = UIImage(named: "password")
            
            } else {
                PassView.layer.borderColor = UIColor.black.cgColor
                self.IMgPass.image = UIImage(named: "password1")
                
            }
        } else if textField.tag == 2 {
            if textField.text!.isEmpty {
                ConfPassView.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.IMGConPass.image = UIImage(named: "password")
                
            } else {
                ConfPassView.layer.borderColor = UIColor.black.cgColor
                self.IMGConPass.image = UIImage(named: "password1")
                }
        }
}
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.tag == 0 {
            EmailView.layer.borderColor = UIColor.red.cgColor
            self.IMGemail.image = UIImage(named: "Subtraction 3-1")
            
        } else if textField.tag == 1 {
            
            PassView.layer.borderColor = UIColor.red.cgColor
            self.IMgPass.image = UIImage(named: "password1")
            
        } else if textField.tag == 2 {
            
            ConfPassView.layer.borderColor = UIColor.red.cgColor
            self.IMGConPass.image = UIImage(named: "password1")
            
        }
}
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            if AllText[0].text!.isEmpty || AllText[1].text!.isEmpty || AllText[2].text!.isEmpty  {
                self.SaveButt.backgroundColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1)
                self.SaveButt.layer.borderColor = UIColor.lightGray.cgColor
                
            }else{
                self.SaveButt.backgroundColor = .orange
                self.SaveButt.layer.borderColor = UIColor.black.cgColor
            }
            return true
    }
}


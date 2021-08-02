//
//  Validat Termining alert.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/14/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class Validat_Termining_alert: NSObject {

 
    
        class func isValidEmail(TestEmail:String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: TestEmail)
        }
        class func isValidAge(TestAge:String)->Bool{
            let age = "[0-9]{2,2}"
            let agetest = NSPredicate(format: "SELF MATCHES %@", age)
            return agetest.evaluate(with: TestAge)
        }
    //    func isValidPhone(Testphone: String) -> Bool {
    //        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
    //        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
    //        return phoneTest.evaluate(with: Testphone)
    //    }
       class func isVaildPassword(Testpass:String)->Bool{
            let passreges = "^(?=.*\\d).{6,12}$"
            let passwordtest = NSPredicate(format: "SELF MATCHES %@", passreges)
            return passwordtest.evaluate(with:Testpass)
        }

        static func showAlert(message: String , my:UIViewController){
            let alert = UIAlertController(title: "Alrm", message: message, preferredStyle:.actionSheet)
            my.present(alert, animated: true, completion: nil)
           Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
            // to run in I Pad
            if let popverController = alert.popoverPresentationController{
                popverController.sourceView = my.view // to set the source of your alert
                popverController.sourceRect = CGRect(x: my.view.bounds.midX, y: my.view.bounds.maxX, width: 0, height: 0)
            }
        }
    }

    extension String {
        var trimmend : String {
            return self.trimmingCharacters(in: .whitespaces)
            
        }

            var isPhoneNumber:Bool{
                do{let detctor=try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
                    let match = detctor.matches(in: self, options: [], range: NSMakeRange(0, self.count))
                    if let res=match.first{return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && (self.count >= 8 && self.count <= 15)}else{return false}
                }catch{
                    return false}
        }
    }


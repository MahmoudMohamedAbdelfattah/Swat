//
//  SuperVisore.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/14/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class SuperVisore: UIViewController {
//
    class func trans(name:String,my:UIViewController ){
        let loginVC = UIStoryboard(name:"Main" ,bundle: nil)
        let new = loginVC.instantiateViewController(withIdentifier: name)
        my.navigationController?.pushViewController(new, animated: true)
        my.navigationController?.navigationBar.isHidden = true
    }
//
    @IBOutlet weak var stackkk: UIStackView!
    @IBOutlet weak var LeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var RightConstraint: NSLayoutConstraint!
    @IBOutlet weak var ViewRequestComplaint: UIView!
    @IBOutlet weak var ViewInterruption: UIView!
    @IBOutlet weak var ViewAdvancePayment: UIView!
    @IBOutlet weak var ViewResignation: UIView!
    @IBOutlet weak var ViewPlanHoladiy: UIView!
    @IBOutlet weak var ViewAttend: UIView!
    @IBOutlet weak var MainView: circle!
    @IBOutlet weak var RightFristView: NSLayoutConstraint!

    //
    
    @IBAction func ButtMove(_ sender: UIButton) {
        
        if sender.tag == 2 {
            SuperVisore.trans(name: "resignation", my: self)
        }
       else if sender.tag == 3 {
            SuperVisore.trans(name: "payment", my: self)
        }
        else if sender.tag == 5 {
            SuperVisore.trans(name: "PlentyProcedure", my: self)
        }
    }
    
    func AutomationButton () {
         UIView.animate(withDuration: 1) {
          self.view.layoutIfNeeded()
        self.RightFristView.constant = 100
      }
    }
    func autoooo () {
    UIView.animate(withDuration: 5, delay: 3, options:[.repeat , .autoreverse], animations: {
               // order now
               self.view.layoutIfNeeded()
           }, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)
        ViewAttend.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .white)
        ViewPlanHoladiy.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color: .white)
        ViewRequestComplaint.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .white)
        ViewInterruption.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .white)
        ViewResignation.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .white)
        ViewAdvancePayment.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .white)
       goToSecondStep()

    }
    

    func autooo () {
        UIView.animate(withDuration: 1, delay: 0, options: .transitionFlipFromRight, animations: {
                self.RightFristView.constant = 25
                self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    
    
    func goToSecondStep() {
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            self.LeftConstraint.constant = -self.view.frame.size.width / 4
            self.RightConstraint.constant = self.view.frame.size.width / 4
            
           self.view.layoutIfNeeded()
            
        }, completion: nil)
        UIView.animate(withDuration: 1) {
            self.LeftConstraint.constant = -self.view.frame.size.width / 4
            self.RightConstraint.constant = self.view.frame.size.width / 4
            
           self.view.layoutIfNeeded()
        }

    }

}


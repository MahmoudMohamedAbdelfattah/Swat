//
//  sales.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 11/15/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import Firebase

class sales: UIViewController {

   
    @IBOutlet weak var MainView: circle!
    @IBOutlet weak var sendMessButt: UIButton!
    @IBOutlet weak var DataCustomerButt: UIButton!
    @IBOutlet weak var LineViewHeight: NSLayoutConstraint!
    @IBOutlet weak var LineView: UIView!

    private func animate() {
        DispatchQueue.main.async {
         UIView.animate(withDuration: 2) {
            self.sendMessButt.alpha = 1
            self.DataCustomerButt.alpha = 1
            self.LineViewHeight.constant += 130
            self.view.layoutIfNeeded()
                    //  self.LineViewHeight.constant = 20
          }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.LineViewHeight.constant = 20
        self.sendMessButt.alpha = 0
        self.DataCustomerButt.alpha = 0
        animate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        MainView.CornerRadiusBorderNum(Radius: 40, BorderWidth: 2, color: .white)
        sendMessButt.CornerRadiusBorderNum(Radius: 15, BorderWidth: 2, color: .white)
        DataCustomerButt.CornerRadiusBorderNum(Radius: 15, BorderWidth: 2, color: .white)

    }
    
    @IBAction func SenderMessageButt(_ sender: UIButton) {
        ViewController.trans(name: "MessageSender", my: self)
    }
    
    @IBAction func DataCustomer(_ sender: UIButton) {
        ViewController.trans(name: "DataCustomer", my: self)
    }
    
    

}

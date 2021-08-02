//
//  OperationHome.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 12/2/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class OperationHome: UIViewController {
    
    
    @IBOutlet weak var AddSite: UIButton!
    @IBOutlet weak var ReviewButt: UIButton!
    
    @IBOutlet weak var MainView: UIView!
    
    @IBOutlet weak var salesButt: UIButton!
    @IBAction func OperationButt(_ sender: UIButton) {
        ViewController.trans(name: "DataCustomer", my: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddSite.CornerRadiusBorderNum(Radius: 20, BorderWidth: 1, color: .white)
        ReviewButt.CornerRadiusBorderNum(Radius: 20, BorderWidth: 1, color: .white)
        salesButt.CornerRadiusBorderNum(Radius: 20, BorderWidth: 1, color: .white)

        MainView.CornerRadiusBorderNum(Radius: 40, BorderWidth: 2, color: .white)
        
    }
    
    @IBAction func SitePreview(_ sender: UIButton) {
        ViewController.trans(name: "ReviewView", my: self)
    }
    


}

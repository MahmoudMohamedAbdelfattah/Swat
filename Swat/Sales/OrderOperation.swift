//
//  OrderOperation.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 12/1/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class OrderOperation: UIViewController {

    @IBOutlet weak var DatePicker: UIDatePicker!
    
    @IBOutlet weak var ViewIso: UIView!
    @IBOutlet weak var MainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        MainView.CornerRadiusBorderNum(Radius: 40, BorderWidth: 2, color: .white)
        DatePicker.CornerRadiusBorderNum(Radius: 10, BorderWidth: 2, color:.white)
        ViewIso.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .white)
   
        
    }
    

}

//
//  PENALTY PROCEDURE.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/16/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class PENALTY_PROCEDURE: UIViewController {

    @IBOutlet weak var MainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        MainView?.CornerRadiusBorderNum(Radius: 25, BorderWidth: 2, color: .white)

       
    }
    

   

}

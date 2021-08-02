//
//  Request for resignation.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/15/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class Request_for_resignation: UIViewController {

    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var isoStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainView.CornerRadiusBorderNum(Radius: 25, BorderWidth: 2, color: .white)
        
        self.navigationController?.navigationBar.isHidden = false

        

        // Do any additional setup after loading the view.
    }
}

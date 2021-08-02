//
//  NewsHome.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/9/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class NewsHome: UIViewController {
    
    @IBOutlet weak var MainView: circle!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MainView.CornerRadiusBorderNum(Radius: 20, BorderWidth: 2, color: .white)

    }
    


}

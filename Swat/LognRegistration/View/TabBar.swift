//
//  TabBar.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/12/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

     override func draw(_ rect: CGRect) {
           // Drawing code
           self.layer.cornerRadius = 20
        self.layer.backgroundColor = UIColor.gray.cgColor
           self.clipsToBounds = true
       }

}

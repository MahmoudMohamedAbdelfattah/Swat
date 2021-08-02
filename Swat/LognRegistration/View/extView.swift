//
//  extView.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/14/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

extension UIView {

 
    
    
    func CornerRadiusBorderNum (Radius: CGFloat , BorderWidth : CGFloat , color : UIColor?)
     {
         self.layer.cornerRadius = Radius
         self.layer.borderWidth = BorderWidth
        self.layer.borderColor = (color?.cgColor)
         self.clipsToBounds = true
     }

}

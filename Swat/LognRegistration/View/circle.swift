//
//  circle.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/10/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class circle: UIView {
    
//    var lineWidth: CGFloat = 10
//    override func draw(_ rect: CGRect) {
//        let radius = (min(bounds.width, bounds.height) - lineWidth) / 4.0
//        let path = UIBezierPath()
//        path.lineWidth = lineWidth
//        UIColor.white.set()
//        let center = CGPoint(x: bounds.maxX / 2, y: bounds.maxY / 2)
//        // Draw circle
//        path.move(to: CGPoint(x: center.x + radius, y: center.y))
//        path.addArc(withCenter: CGPoint(x: center.x, y: center.y), radius: radius, startAngle:0, endAngle: 2 * .pi, clockwise: true)
//        path.stroke()
//        self.layer.zPosition = -1
//    }
       
    override func draw(_ rect: CGRect) {
         let mylayer : CAGradientLayer = CAGradientLayer ()
               mylayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
                                     //  array of color to make rgb call "func - > rgb" use  init
                     let firstcolor = UIColor.init(red: 26/255, green: 36/255, blue: 79/255, alpha: 1).cgColor
                     let secoundColor = UIColor.init(red: 71/255, green: 131/255, blue: 209/255, alpha: 1).cgColor
                                     // when start operation gradient & end
        mylayer.startPoint = CGPoint(x: 0, y: 0.0)
                                     mylayer.endPoint = CGPoint(x: 0, y: 0.7)
                                     mylayer.colors = [firstcolor, secoundColor]
                                     // to add layer befor button
                                     mylayer.zPosition = -2
                                     // to add layer on view
                    layer.addSublayer(mylayer)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
}

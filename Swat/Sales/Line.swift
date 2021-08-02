//
//  Line.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 11/18/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class Line: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var lineWidth: CGFloat = 10
        override func draw(_ rect: CGRect) {
            let radius = (min(bounds.width, bounds.height) - lineWidth) / 4.0
            let path = UIBezierPath()
            path.lineWidth = lineWidth
            UIColor.white.set()
            let center = CGPoint(x: bounds.maxX / 2, y: bounds.maxY / 2)
            // Draw circle
            path.move(to: CGPoint(x: center.x + radius, y: center.y))
            path.addArc(withCenter: CGPoint(x: center.x, y: center.y), radius: radius, startAngle:0, endAngle: 2 * .pi, clockwise: true)
            path.stroke()
            self.layer.zPosition = -1
    }

}

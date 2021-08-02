//
//  MyCustomButton.swift
//  calcu
//
//  Created by mahmoud abdelfattah on 4/4/19.
//  Copyright © 2019 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class mycutombutton : UIButton
{
    override func awakeFromNib() {
        super.awakeFromNib()
    // firstbutton.layer.masksToBounds = true
        self.layer.borderColor = UIColor.lightGray.withAlphaComponent (0.5).cgColor
        self.layer.borderWidth = 1
    }
    // size huga area of screen تظبيط شاشه
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height/2
    }
}

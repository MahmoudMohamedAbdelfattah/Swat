//
//  RegCollection.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/29/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class RegCollection: UICollectionViewCell {
    
    
    @IBOutlet weak var StackJobLbl: UIStackView!
    @IBOutlet weak var LBLName: UILabel!
    @IBOutlet weak var IMGReg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        IMGReg.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .black)
        // Initialization code
    }

}

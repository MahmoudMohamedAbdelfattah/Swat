//
//  CellBusinessView.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/11/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class CellBusinessView: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        CellImagBusiness.CornerRadiusBorderNum(Radius: 10, BorderWidth: 1, color: .black)
        // Initialization code
    }
    
    @IBOutlet weak var CellImagBusiness: UIImageView!
    @IBOutlet weak var CellDescriptionBusiness: UILabel!
    @IBOutlet weak var CellTitleBusiness: UILabel!
    @IBOutlet weak var CellNameBusiness: UILabel!
    
}

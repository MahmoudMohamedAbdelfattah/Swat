//
//  customerdatacell.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 11/26/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class customerdatacell: UICollectionViewCell {
    @IBOutlet weak var EmailTxt: UILabel!
    
    @IBOutlet weak var DateTxt: UILabel!
    @IBOutlet weak var AddressTxt: UILabel!
    @IBOutlet weak var NameResponsible: UILabel!
    @IBOutlet weak var PhonTxt: UILabel!
    @IBOutlet weak var FieldWork: UILabel!
    @IBOutlet weak var NameOrgniztion: UILabel!
    @IBOutlet weak var NameSales: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

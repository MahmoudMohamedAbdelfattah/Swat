//
//  CellHomepage.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/9/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class CellHomepage: UITableViewCell {

    @IBOutlet weak var ViewMainCell: UIView!
    @IBOutlet weak var ImageNews: UIImageView!
    @IBOutlet weak var NameNews: UILabel!
    @IBOutlet weak var descriptionNews: UILabel!
    @IBOutlet weak var TitleNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ImageNews.CornerRadiusBorderNum(Radius: 15, BorderWidth: 1, color: .black)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

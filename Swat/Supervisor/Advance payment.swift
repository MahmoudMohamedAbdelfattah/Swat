//
//  Advance payment.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/16/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit

class Advance_payment: UIViewController {

    @IBOutlet weak var MainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        MainView.CornerRadiusBorderNum(Radius: 25, BorderWidth: 2, color: .white)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

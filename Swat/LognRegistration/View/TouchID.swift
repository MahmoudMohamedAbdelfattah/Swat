//
//  TouchID.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/26/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import LocalAuthentication
class TouchID: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func authTouchID(_ sender: UIButton) {
        let context = LAContext()
                var error: NSError?
                
                // 2
                // check if Touch ID is available
                if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                    // 3
                    let reason = "Authenticate with Touch ID"
                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                        {(succes, error) in
                            // 4
                            if succes {
                                self.showAlertController("Touch ID Authentication Succeeded")
                            }
                            else {
                                self.showAlertController("Touch ID Authentication Failed")
                            }
                            })
                }
                    // 5
                else {
                    showAlertController("Touch ID not available")
                }
            }
            
            func showAlertController(_ message: String) {
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController, animated: true, completion: nil)
            }
            
        }
    



//
//  homepage.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/7/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import WebKit

class homepage: UIViewController, WKNavigationDelegate {

 
    var webView: WKWebView!
    
//    override func loadView() {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        view = webView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let link = "http://www.swat-security.net/?fbclid=IwAR174Sr0yxTGCpOCBE5odKn2OShs7Kk12vScBoE4oF6SirIxoy1gGgA1y7I"
        if let url = URL(string: link) {
            UIApplication.shared.open(url, options: [:], completionHandler: { (_) in
                
            })
        }
     
    }
    



}

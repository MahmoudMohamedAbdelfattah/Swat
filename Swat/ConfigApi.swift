//
//  ConfigApi.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/10/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import Foundation

struct URLs {
    
    // Base URL
    static let MainUrl = "http://newsapi.org/v2/top-headlines?country=eg&"
    // URL Top headlines from Egypt
    static let headlineEygpt = "\(MainUrl)apiKey=9649e2712c7544e691d3a27f4d02d566"
    // url Business of eygpt
    static let businessUrl = "\(MainUrl)category=business&apiKey=9649e2712c7544e691d3a27f4d02d566"
    // Url Enterainment Of Eygpt
    static let EntertainmentURL = "\(MainUrl)category=entertainment&apiKey=9649e2712c7544e691d3a27f4d02d566"
    // URL helth of eygpt
    static let  helthURL = "\(MainUrl)category=health&apiKey=9649e2712c7544e691d3a27f4d02d566"
}


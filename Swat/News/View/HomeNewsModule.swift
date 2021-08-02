//
//  HomeNewsModule.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 10/10/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import Foundation
// Home News
struct HomeNewsModule : Decodable {
   let status: String
   let totalResults: Int
   let articles: [AllArticle]?
}
struct AllArticle : Decodable {
    let source : Allsource?
    let author: String?
    let url : String?
    let urlToImage : String?
    let title : String?
    let description : String?
}
struct Allsource : Decodable {
      let name : String
}


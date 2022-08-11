//
//  Model.swift
//  CoinFlipProject
//
//  Created by Nathaniel Whittington on 7/30/22.
//

import Foundation

struct NBATeamsModel: Decodable{
    
    let results: Int?
    let response: [Response]?
   
}


struct Response: Decodable{
    let id : Int?
    let name: String?
    let nickname: String?
    let code: String?
    let city: String?
    let logo: String?
    let allStar: Bool?
}





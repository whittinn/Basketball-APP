//
//  TeamTableViewCellModel.swift
//  Example
//
//  Created by Nathaniel Whittington on 8/10/22.
//

import Foundation

class TeamTableViewCellModel{
    
    let title: String
    let imageURL: URL?
    let imageData: Data? = nil
    
    init(title:String,imageURL:URL?){
        self.title = title
        self.imageURL = imageURL
        
    }
}

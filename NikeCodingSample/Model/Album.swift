//
//  Album.swift
//  NikeCodingSample
//
//  Created by Greg Hughes on 3/10/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import Foundation

struct TopLevelDictionary : Codable {
    let feed : Feed
}

struct Feed : Codable {
    let results : [Album]
}

struct Album : Codable {
    let artistName : String
    let name: String
    let artworkUrl100 : URL
    
}

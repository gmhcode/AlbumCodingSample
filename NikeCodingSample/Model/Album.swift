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
    let releaseDate: String
    let name: String
    let copyright : String
    let artworkUrl100 : URL
    let genres : [Genre]
    
}

struct Genre: Codable {
    let name : String
}

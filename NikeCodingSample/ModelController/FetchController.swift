//
//  FetchController.swift
//  NikeCodingSample
//
//  Created by Greg Hughes on 3/10/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import UIKit

class FetchController {
    
    static let shared = FetchController()
    private let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json")
    let imageCache = NSCache<NSString, UIImage>()
    
    ///Fetches the albums
    func fetchAlbums(completion:@escaping([Album])->Void) {
        guard let url = url else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion([])
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion([]); return}
            let jsonDecoder = JSONDecoder()
            
            do {
                let topLevel = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
                let albums = topLevel.feed.results
                completion(albums)
                
            }catch let er {
                 print("❌ There was an error in \(#function) \(er) : \(er.localizedDescription) : \(#file) \(#line)")
                completion([])
            }
            
        }.resume()
    }
    
    func fetchAlbumCover(url: URL, completion:@escaping(UIImage) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(UIImage())
                return
            }
            guard let data = data, let image = UIImage(data: data) else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(UIImage()); return}
            completion(image)
        }.resume()
    }
}

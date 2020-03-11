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
    
    ///Fetches the Album Cover Image from the URL parameter, then completed with an image. So far this is only used in the retrieveImageFromCache function.
    private func fetchAlbumCover(url: URL, completion:@escaping(UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            guard let data = data, let image = UIImage(data: data) else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
            completion(image)
        }.resume()
    }
    
   
    ///Checks to see if the image is cached. If it is, that image is returned, if not, we fetch the Image and put it in the cache
    func retrieveImageFromCache(album: Album, completion: @escaping (UIImage?)->Void) {
        //Checks to see if the image exists in the cache
        if let cachedImage = imageCache.object(forKey: album.artworkUrl100.absoluteString as NSString) {
            completion(cachedImage)
            //If it doesnt exists in the cache, fetch the image
        } else {
            fetchAlbumCover(url: album.artworkUrl100) { (image) in
                guard let image = image else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}

                self.imageCache.setObject(image, forKey: album.artworkUrl100.absoluteString as NSString)
                completion(image)
            }
        }
    }
}

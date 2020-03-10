//
//  AlbumDetailViewController.swift
//  NikeCodingSample
//
//  Created by Greg Hughes on 3/10/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    
    let album: Album
    var albumCoverImageView = UIImageView()
    var artistNameLabel = UILabel()
    var albumNameLabel = UILabel()
    //genre
    //releaseDate
    //copyright
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

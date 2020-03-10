//
//  ViewController.swift
//  NikeCodingSample
//
//  Created by Greg Hughes on 3/10/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var albums : [Album] = []
    let albumCellName = "albumCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setTableView()
        setAlbums()
    }
    
    func setAlbums() {
        FetchController().fetchAlbums { (albums) in
            self.albums = albums
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setTableView() {
        tableView.rowHeight = 100
        tableView.register(AlbumCell.self, forCellReuseIdentifier: albumCellName)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: albumCellName, for: indexPath) as? AlbumCell
            else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return UITableViewCell()}
        cell.album = albums[indexPath.row]
        
        
        return cell
    }

}


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
        view.backgroundColor = .white
        setAlbums()
        setTableView()
        
    }
    // MARK: - Set up
    func setAlbums() {
        FetchController().fetchAlbums { (albums) in
            self.albums = albums
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    ///Make sure the rowHeight is automatic dimention
    func setTableView() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight =
            UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.register(AlbumCell.self, forCellReuseIdentifier: albumCellName)
    }
    
    // MARK: - TableView Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: albumCellName, for: indexPath) as? AlbumCell
            else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return UITableViewCell()}
        cell.album = albums[indexPath.row]
        return cell
    }
    ///Pushed to the AlbumDetailViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        let albumVC = AlbumDetailViewController(album: album)
        self.navigationController?.pushViewController(albumVC, animated: true)
    }
    
    
}


//
//  AlbumCell.swift
//  NikeCodingSample
//
//  Created by Greg Hughes on 3/10/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    var album : Album? {
        didSet{
            setupViewData()
        }
    }
    
    var albumCoverImageView = UIImageView()
    var artistNameLabel = UILabel()
    var albumNameLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageView()
        setImageConstraints()
        setArtistNameLabelConstraints()
        setAlbumNameLabelConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("initCoder has not been implemented")
    }
    
    
    func setupViewData() {
        guard let album = album else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        FetchController.shared.retrieveImageFromCache(album: album) { (image) in
            DispatchQueue.main.async {
                self.albumCoverImageView.image = image
            }
        }
        artistNameLabel.text = "Artist: " + album.artistName
        artistNameLabel.textColor = #colorLiteral(red: 0.9380758405, green: 0.9380758405, blue: 0.9380758405, alpha: 1)
        artistNameLabel.numberOfLines = 0
        
        albumNameLabel.text = "Album: " + album.name
        albumNameLabel.textColor = #colorLiteral(red: 0.9380758405, green: 0.9380758405, blue: 0.9380758405, alpha: 1)
        albumNameLabel.numberOfLines = 0
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.1607642472, green: 0.1607983708, blue: 0.1607597768, alpha: 1)
        backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    
    
    func configureImageView() {
        albumCoverImageView.layer.cornerRadius = 10
        albumCoverImageView.clipsToBounds = true
    }
    
    
    
    // MARK: - Cell Contraints
    func setImageConstraints() {
        addSubview(albumCoverImageView)
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        albumCoverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        albumCoverImageView.widthAnchor.constraint(equalTo: albumCoverImageView.heightAnchor).isActive = true
        
    }
    
    func setArtistNameLabelConstraints() {
        addSubview(artistNameLabel)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 20).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: albumCoverImageView.topAnchor, constant: 15).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setAlbumNameLabelConstraints() {
        addSubview(albumNameLabel)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 20).isActive = true
        albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 10).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        bottomAnchor.constraint(greaterThanOrEqualTo: albumNameLabel.bottomAnchor, constant: 25).isActive = true
    }
    
    

}

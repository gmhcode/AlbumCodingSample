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
    var genreLabel = UILabel()
    var releaseDateLabel = UILabel()
    var copyrightLabel = UILabel()
    var iTunesPageButton = UIButton()
    
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = #colorLiteral(red: 0.8345568776, green: 0.8345568776, blue: 0.8345568776, alpha: 1)
        
        setAlbumImage()
        setArtistNameLabelConstraints()
        setAlbumNameLabelConstraints()
        setGenreLabelConstraints()
        setReleaseDateLabelConstraints()
        setCopyrightLabelConstraints()
        setITunesPageButtonContraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewData()
    }
    

    
    
    
    func setupViewData() {
        FetchController.shared.retrieveImageFromCache(album: album) { (image) in
            DispatchQueue.main.async {
                self.albumCoverImageView.image = image
                self.albumCoverImageView.layer.borderWidth = 2
                self.albumCoverImageView.layer.borderColor = #colorLiteral(red: 0.1575104892, green: 0.1575104892, blue: 0.1575104892, alpha: 1)
            }
        }
        
        
        artistNameLabel.text = "Artist: " + album.artistName
        artistNameLabel.textColor = #colorLiteral(red: 0.1607642472, green: 0.1607983708, blue: 0.1607597768, alpha: 1)
        artistNameLabel.font = artistNameLabel.font.withSize(14)
        
        
        albumNameLabel.text = "Album: " + album.name
        albumNameLabel.textColor = #colorLiteral(red: 0.1607642472, green: 0.1607983708, blue: 0.1607597768, alpha: 1)
        albumNameLabel.font = albumNameLabel.font.withSize(14)
        
        
        genreLabel.text = "Genres: " + String(album.genres.map({$0.name + ", "}).joined().dropLast(2))
        genreLabel.textColor = #colorLiteral(red: 0.1607642472, green: 0.1607983708, blue: 0.1607597768, alpha: 1)
        genreLabel.font = genreLabel.font.withSize(14)
        
        
        releaseDateLabel.text = "Release Date: " + album.releaseDate
        releaseDateLabel.textColor = #colorLiteral(red: 0.1607642472, green: 0.1607983708, blue: 0.1607597768, alpha: 1)
        releaseDateLabel.font = releaseDateLabel.font.withSize(14)
        
        
        copyrightLabel.text = "Copyright: " + album.copyright
        copyrightLabel.textColor = #colorLiteral(red: 0.1607642472, green: 0.1607983708, blue: 0.1607597768, alpha: 1)
        copyrightLabel.font = copyrightLabel.font.withSize(14)
        
        
        iTunesPageButton.setTitle("iTunes Page", for: .normal)
        iTunesPageButton.titleLabel?.textColor = #colorLiteral(red: 0.1607642472, green: 0.1607983708, blue: 0.1607597768, alpha: 1)
        iTunesPageButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        iTunesPageButton.layer.cornerRadius = 10
        iTunesPageButton.layer.borderWidth = 2
        iTunesPageButton.layer.borderColor = #colorLiteral(red: 0.1575104892, green: 0.1575104892, blue: 0.1575104892, alpha: 1)
        
        iTunesPageButton.addTarget(self, action: #selector(openInItunes), for: .allTouchEvents)
        
    }
    
    @objc func openInItunes() {
        UIApplication.shared.open(album.url, options: [:], completionHandler: nil)
    }
}

//Constraints
extension AlbumDetailViewController {
    
    func setAlbumImage() {
        
        self.view.addSubview(albumCoverImageView)
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
        albumCoverImageView.heightAnchor.constraint(equalTo: albumCoverImageView.widthAnchor).isActive = true
        albumCoverImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        albumCoverImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setArtistNameLabelConstraints() {
        
        self.view.addSubview(artistNameLabel)
        artistNameLabel.numberOfLines = 0
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        //        artistNameLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 1.1).isActive = true
        artistNameLabel.widthAnchor.constraint(equalTo: albumCoverImageView.widthAnchor).isActive = true
        artistNameLabel.centerXAnchor.constraint(equalTo: albumCoverImageView.centerXAnchor).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func setAlbumNameLabelConstraints() {
        
        self.view.addSubview(albumNameLabel)
        albumNameLabel.numberOfLines = 0
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.widthAnchor.constraint(equalTo: artistNameLabel.widthAnchor).isActive = true
        albumNameLabel.centerXAnchor.constraint(equalTo: artistNameLabel.centerXAnchor).isActive = true
        albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    
    func setGenreLabelConstraints() {
        
        self.view.addSubview(genreLabel)
        genreLabel.numberOfLines = 0
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.widthAnchor.constraint(equalTo: albumNameLabel.widthAnchor).isActive = true
        genreLabel.centerXAnchor.constraint(equalTo: albumNameLabel.centerXAnchor).isActive = true
        genreLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func setReleaseDateLabelConstraints() {
        
        self.view.addSubview(releaseDateLabel)
        releaseDateLabel.numberOfLines = 0
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.widthAnchor.constraint(equalTo: albumNameLabel.widthAnchor).isActive = true
        releaseDateLabel.centerXAnchor.constraint(equalTo: albumNameLabel.centerXAnchor).isActive = true
        releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func setCopyrightLabelConstraints() {
        
        self.view.addSubview(copyrightLabel)
        copyrightLabel.numberOfLines = 0
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.widthAnchor.constraint(equalTo: albumNameLabel.widthAnchor).isActive = true
        copyrightLabel.centerXAnchor.constraint(equalTo: albumNameLabel.centerXAnchor).isActive = true
        copyrightLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func setITunesPageButtonContraints () {
        
        self.view.addSubview(iTunesPageButton)
        iTunesPageButton.translatesAutoresizingMaskIntoConstraints = false
        iTunesPageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        iTunesPageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        iTunesPageButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        iTunesPageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        iTunesPageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    
    
    
    
}

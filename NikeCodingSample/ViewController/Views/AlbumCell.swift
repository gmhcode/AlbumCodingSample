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
            setViews()
        }
    }
    
    var vi = UIImageView()
    var vt = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(vi)
        addSubview(vt)
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("initCoder has not been implemented")
    }
    
    
    func setViews() {
        guard let album = album else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

        FetchController.shared.fetchAlbumCover(url: album.artworkUrl100) { (image) in
            DispatchQueue.main.async {
                self.vi.image = image
                self.vt.text = album.artistName
            }
        }
    }
    
    
    
    func configureImageView() {
        vi.layer.cornerRadius = 10
        vi.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        vt.numberOfLines = 0
        vt.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        vi.translatesAutoresizingMaskIntoConstraints = false
        vi.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        vi.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        vi.heightAnchor.constraint(equalToConstant: 80).isActive = true
        vi.widthAnchor.constraint(equalTo: vi.heightAnchor).isActive = true
        
    }
    
    func setTitleLabelConstraints() {
        vt.translatesAutoresizingMaskIntoConstraints = false
        vt.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        vt.leadingAnchor.constraint(equalTo: vi.trailingAnchor, constant: 20).isActive = true
        vt.heightAnchor.constraint(equalToConstant: 80).isActive = true
        vt.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

}

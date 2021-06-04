//
//  TableViewCell.swift
//  Top100Albums
//
//  Created by user197715 on 6/4/21.
//

import UIKit

class TableViewCell : UITableViewCell {
    
    var album : Album?{
        didSet {
            guard let albumItem = album else {return}
            if let imageUrl = albumItem.artworkUrl100 {
                let image = try! Data(contentsOf: URL(string: imageUrl)!)
                albumImageView.image = UIImage(data: image)
            }
            if let name = albumItem.name {
                nameLabel.text = name
            }
            if let artistName = albumItem.artistName {
                authorLabel.text = artistName
            }
        }
    }
    
    private let albumImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private func setLayout(){
        albumImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        authorLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.albumImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerView.addSubview(nameLabel)
        containerView.addSubview(authorLabel)
        self.contentView.addSubview(albumImageView)
        self.contentView.addSubview(containerView)
        
        setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

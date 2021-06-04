//
//  AlbumDetailViewController.swift
//  Top100Albums
//
//  Created by user197715 on 6/4/21.
//

import UIKit

class AlbumDetailViewController: UIViewController{
    var album : Album?{
        didSet {
            guard let albumItem = album else {return}
            if let imageUrl = albumItem.artworkUrl100 {
                let image = try! Data(contentsOf: URL(string: imageUrl)!)
                albumImageView.image = UIImage(data: image)
            }
            if let name = albumItem.name {
                nameTextView.text = "Album: " + name
            }
            if let artistName = albumItem.artistName {
                authorTextView.text = "Artist: " + artistName
            }
            genreTextView.text = "Genre: " + albumItem.getGenreString()
            if let releaseDate = albumItem.releaseDate {
                releaseDateTextView.text = "Release: " + releaseDate
            }
            if let copyright = albumItem.copyright {
                copyrightTextView.text = copyright
            }
        }
    }
    
    //red container that will contain the image
    private let containerView : UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private let albumImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameTextView : UITextView = {
        let textView = UITextView()
        textView.usesStandardTextScaling = true
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let authorTextView : UITextView = {
        let textView = UITextView()
        textView.usesStandardTextScaling = true
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let genreTextView : UITextView = {
        let textView = UITextView()
        textView.usesStandardTextScaling = true
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let releaseDateTextView : UITextView = {
        let textView = UITextView()
        textView.usesStandardTextScaling = true
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let copyrightTextView : UITextView = {
        let textView = UITextView()
        textView.usesStandardTextScaling = true
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let linkButton : UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Go to Album", for: UIControl.State.normal)
        return button
    }()
    
    @objc func buttonAction(_ sender:UIButton!){
        if let url = URL(string: self.album?.url ?? ""){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
   
    private func setLayout(){
        containerView.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive=true
        
        albumImageView.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        albumImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive=true
        
        nameTextView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20).isActive=true
        nameTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive=true
        nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
        authorTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor).isActive=true
        authorTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive=true
        authorTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
        genreTextView.topAnchor.constraint(equalTo: authorTextView.bottomAnchor).isActive=true
        genreTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive=true
        genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
        releaseDateTextView.topAnchor.constraint(equalTo: genreTextView.bottomAnchor).isActive=true
        releaseDateTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive=true
        releaseDateTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
        copyrightTextView.topAnchor.constraint(equalTo: releaseDateTextView.bottomAnchor, constant: 15).isActive=true
        copyrightTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive=true
        copyrightTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        
        linkButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive=true
        linkButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive=true
        linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        containerView.addSubview(albumImageView)
        view.addSubview(containerView)
        view.addSubview(nameTextView)
        view.addSubview(authorTextView)
        view.addSubview(genreTextView)
        view.addSubview(releaseDateTextView)
        view.addSubview(copyrightTextView)
        view.addSubview(linkButton)
        linkButton.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        setLayout()
    }
}

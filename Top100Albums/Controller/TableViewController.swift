//
//  TableViewController.swift
//  Top100Albums
//
//  Created by user197715 on 6/4/21.
//

import UIKit
class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var albums : [Album] = []
    
    private let albumsTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "albumCell")
        return tableView
    }()
    
    private func setLayout () {
        albumsTableView.topAnchor.constraint(equalTo:view.layoutMarginsGuide.topAnchor).isActive = true
        albumsTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        albumsTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        albumsTableView.bottomAnchor.constraint(equalTo:view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    private func setUpNavigation() {
        navigationItem.title = "Top 100 Albums in Peru"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        self.navigationController?.navigationBar.isTranslucent = false
       }
    
    //get data from url
    private func getData(){
        let urlString = "https://rss.itunes.apple.com/api/v1/pe/apple-music/top-albums/all/100/explicit.json"
        
        guard let url = URL(string : urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) {
            (data, response, err) in
            guard let data = data else { return }
            do{
                let appleTopAlbumsData = try JSONDecoder().decode(AppleTopAlbumsData.self, from: data)
                self.albums =  appleTopAlbumsData.getAlbums()
                
                DispatchQueue.global(qos: .background).async{
                    DispatchQueue.main.async{
                        self.albumsTableView.reloadData()
                    }
                }
            } catch let jsonErr{
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        albumsTableView.dataSource = self
        albumsTableView.delegate = self
        view.addSubview(albumsTableView)
        
        setLayout()
        setUpNavigation()
        getData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! TableViewCell
        cell.album = albums[indexPath.row]
      return cell
    }
    
    func tableView(_ tableview: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let albumDetailViewController = AlbumDetailViewController()
        albumDetailViewController.album = albums[indexPath.row]
        self.present(albumDetailViewController, animated: true, completion: nil)
    }
    
}

//
//  JsonnFeed.swift
//  Top100Albums
//
//  Created by user197715 on 6/4/21.
//

import Foundation

struct AppleTopAlbumsData : Decodable{
    private let feed : AppleTopAlbumsFeed
    
    func getTitle() -> String{
        let title = feed.getTitle()
        return title
    }
    func getAlbums() -> [Album]{
        let albums = feed.getAlbums()
        return albums
    }
}

struct AppleTopAlbumsFeed : Decodable{
    private let results : [Album]
    private let title : String
    
    func getTitle () -> String{
        return title
    }
    func getAlbums () -> [Album] {
        return results
    }
}

struct Album : Decodable{
    let name : String?
    let artistName : String?
    let artworkUrl100 : String?
    let genres : [Genre]
    let releaseDate : String?
    let copyright : String?
    let url : String?
    
    func getGenreString() -> String{
        var string = ""
        for genre in self.genres{
            string = string + genre.name + ", "
        }
        string.removeLast(2)
        return string
    }
}

struct Genre : Decodable{
    let genreId : String
    let name : String
    let url : String
}


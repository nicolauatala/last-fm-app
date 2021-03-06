//
//  MockHomeService.swift
//  lastfmTests
//
//  Created by Nicolau Atala on 07/01/22.
//

@testable import lastfm

class MockHomeService: HomeServiceProtocol {
	func getTopAlbums(page: Int, completion: @escaping ((TopAlbums?) -> Void)) {
		let attr = AlbumsAttr(tag: "", page: "", perPage: "", totalPages: "", total: "")
		let newAlbum = Album(name: "My test album",
							 mbid: nil,
							 url: "",
							 artist: ArtistUnion.string("Me"),
							 image: [],
							 attr: nil,
							 tags: nil,
							 tracks: nil,
							 listeners: nil,
							 playcount: nil,
							 wiki: nil)
		let topAlbums = TopAlbums(albums: Albums(album: [newAlbum], attr: attr))
		completion(topAlbums)
	}
}

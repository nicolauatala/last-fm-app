//
//  MockAlbumService.swift
//  lastfmTests
//
//  Created by Nicolau Atala on 09/01/22.
//

@testable import lastfm

class MockAlbumService: AlbumServiceProtocol {
	static let newAlbum = Album(name: "My test album",
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

	func getInfo(album: Album, completion: @escaping ((AlbumInfo?) -> Void)) {
		completion(AlbumInfo(album: MockAlbumService.newAlbum))
	}

}

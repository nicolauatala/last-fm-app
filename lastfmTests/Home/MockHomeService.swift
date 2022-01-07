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
		let topAlbums = TopAlbums(albums: Albums(album: [], attr: attr))
		completion(topAlbums)
	}
}

//
//  TopAlbums.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

// MARK: - Welcome
struct TopAlbums: Codable {
	let albums: Albums
}


// MARK: - AlbumsAttr
struct AlbumsAttr: Codable {
	let tag, page, perPage, totalPages: String
	let total: String
}

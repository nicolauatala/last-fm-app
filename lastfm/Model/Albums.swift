//
//  Albums.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

// MARK: - Albums
struct Albums: Codable {
	let album: [Album]
	let attr: AlbumsAttr

	enum CodingKeys: String, CodingKey {
		case album
		case attr = "@attr"
	}
}

// MARK: - AlbumsAttr
struct AlbumsAttr: Codable {
	let tag, page, perPage, totalPages: String
	let total: String
}


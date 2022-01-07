//
//  Album.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

// MARK: - Album
struct Album: Codable {
	let name, mbid: String
	let url: String
	let artist: Artist
	let image: [Image]
	let attr: AlbumAttr

	enum CodingKeys: String, CodingKey {
		case name, mbid, url, artist, image
		case attr = "@attr"
	}

	func largeUrlImage() -> String? {
		return self.image.filter { elm in
			elm.size.rawValue == "large"
		}.first?.text
	}
}

// MARK: - AlbumAttr
struct AlbumAttr: Codable {
	let rank: String
}

//
//  Album.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

struct AlbumInfo: Codable {
	let album: Album
}

// MARK: - Album
struct Album: Codable {
	let name: String
	let mbid: String?
	let url: String
	let artist: ArtistUnion
	let image: [Image]
	let attr: AlbumAttr?
	let tags: Tags?
	let tracks: Tracks?
	let listeners, playcount: String?
	let wiki: Wiki?

	enum CodingKeys: String, CodingKey {
		case name, mbid, url, artist, image
		case attr = "@attr"
		case tags, tracks, listeners, playcount, wiki
	}

	func largeUrlImage() -> String? {
		return self.image.filter { elm in
			elm.size == "large"
		}.first?.text
	}
}

// MARK: - AlbumAttr
struct AlbumAttr: Codable {
	let rank: String
}

// NEW

enum ArtistUnion: Codable {
	case artistClass(ArtistClass)
	case string(String)

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let x = try? container.decode(String.self) {
			self = .string(x)
			return
		}
		if let x = try? container.decode(ArtistClass.self) {
			self = .artistClass(x)
			return
		}
		throw DecodingError.typeMismatch(ArtistUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ArtistUnion"))
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		switch self {
		case .artistClass(let x):
			try container.encode(x)
		case .string(let x):
			try container.encode(x)
		}
	}
}

// MARK: - ArtistClass
struct ArtistClass: Codable {
	let name, mbid: String
	let url: String
}


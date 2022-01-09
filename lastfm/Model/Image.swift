//
//  Image.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

// MARK: - Image
struct Image: Codable {
	let text: String
	let size: String

	enum CodingKeys: String, CodingKey {
		case text = "#text"
		case size
	}
}

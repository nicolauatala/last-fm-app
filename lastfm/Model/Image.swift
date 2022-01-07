//
//  Image.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

// MARK: - Image
struct Image: Codable {
	let text: String
	let size: Size

	enum CodingKeys: String, CodingKey {
		case text = "#text"
		case size
	}
}

enum Size: String, Codable {
	case extralarge = "extralarge"
	case large = "large"
	case medium = "medium"
	case small = "small"
}

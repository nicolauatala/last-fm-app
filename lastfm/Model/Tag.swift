//
//  Tag.swift
//  lastfm
//
//  Created by Nicolau Atala on 09/01/22.
//

import Foundation

// MARK: - Tags
struct Tags: Codable {
	let tag: [Tag]
}

// MARK: - Tag
struct Tag: Codable {
	let url: String
	let name: String
}

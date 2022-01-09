//
//  Track.swift
//  lastfm
//
//  Created by Nicolau Atala on 09/01/22.
//

import Foundation

// MARK: - Tracks
struct Tracks: Codable {
	let track: [Track]
}

// MARK: - Track
struct Track: Codable {
	let streamable: Streamable
	let duration: Int
	let url: String
	let name: String
	let attr: TrackAttr
	let artist: ArtistClass

	enum CodingKeys: String, CodingKey {
		case streamable, duration, url, name
		case attr = "@attr"
		case artist
	}
}

// MARK: - TrackAttr
struct TrackAttr: Codable {
	let rank: Int
}

// MARK: - Streamable
struct Streamable: Codable {
	let fulltrack, text: String

	enum CodingKeys: String, CodingKey {
		case fulltrack
		case text = "#text"
	}
}

// MARK: - Wiki
struct Wiki: Codable {
	let published, summary, content: String
}

//
//  TopAlbumsRepository.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//


import Foundation

final class TopAlbumsRepository: TopAlbumsRepositoryProtocol {
	static var shared: TopAlbumsRepositoryProtocol = TopAlbumsRepository()
	private var repository = DefaultRepository<TopAlbums>(with: "top-albums-repository")
	private var topAlbums: TopAlbums?

	init() {
		guard let list = repository.retrieve() else { return }
		self.topAlbums = list
	}

	func update(with list: TopAlbums) {
		self.topAlbums = list
		repository.save(data: list)
	}

	func lestFetch() -> TopAlbums? {
		topAlbums
	}
}

protocol TopAlbumsRepositoryProtocol {
	static var shared: TopAlbumsRepositoryProtocol { get set }
	func update(with list: TopAlbums)
	func lestFetch() -> TopAlbums?
}


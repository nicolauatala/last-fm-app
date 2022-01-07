//
//  HomeViewModel.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

import Foundation

final class HomeViewModel {

	private var serivce: HomeServiceProtocol
	private var pageCounter = 1
	private(set) var topAlbums: TopAlbums?

	init(service: HomeServiceProtocol) {
		self.serivce = service
	}

	func getTopAlbums() {
		serivce.getTopAlbums(page: pageCounter) { [weak self] (response) in
			if let response = response {
				self?.topAlbums = response
			}
		}
	}
}

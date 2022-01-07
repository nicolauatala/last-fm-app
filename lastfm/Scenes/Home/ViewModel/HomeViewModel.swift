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
	private(set) var topAlbums: Observable<TopAlbums?> = Observable(nil)

	init(service: HomeServiceProtocol) {
		self.serivce = service
	}

	func getTopAlbums() {
		loadLastFetchFromRepository()
		serivce.getTopAlbums(page: pageCounter) { [weak self] (response) in
			guard let self = self else { return }
			if let response = response {
				self.topAlbums.value = response
			}
		}
	}

	func loadLastFetchFromRepository() {
		guard let list = TopAlbumsRepository.shared.lestFetch() else { return }
		topAlbums.value = list
		return
	}
}

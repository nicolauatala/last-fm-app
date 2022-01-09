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
	private(set) var albums: Observable<[Album]> = Observable([])
	private weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
	
	init(service: HomeServiceProtocol, coordinatorDelegate: HomeViewModelCoordinatorDelegate) {
		self.serivce = service
		self.coordinatorDelegate = coordinatorDelegate
	}

	func getTopAlbums() {
//		loadLastFetchFromRepository()
		serivce.getTopAlbums(page: pageCounter) { [weak self] (response) in
			guard let self = self else { return }
			if let albums = response?.albums.album {
				self.albums.value = self.albums.currentValue + albums
				self.pageCounter += 1
			}
		}
	}

	func loadLastFetchFromRepository() {
		guard let list = TopAlbumsRepository.shared.lestFetch() else { return }
//		topAlbums.value = list
		return
	}

	func albumDetail(with index: Int) {
		let album = albums.currentValue[index]
		coordinatorDelegate?.albumDetail(album)
	}
}

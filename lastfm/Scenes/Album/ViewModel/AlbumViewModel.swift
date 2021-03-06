//
//  AlbumViewModel.swift
//  lastfm
//
//  Created by Nicolau Atala on 09/01/22.
//

import Foundation

final class AlbumViewModel {
	private var serivce: AlbumServiceProtocol
	private(set) var album: Album
	private(set) var details: Observable<AlbumInfo?> = Observable(nil)

	init(service: AlbumServiceProtocol, album: Album) {
		self.serivce = service
		self.album = album
	}

	func getInfo() {
		serivce.getInfo(album: album) { [weak self] (response) in
			self?.details.value = response
		}
	}

}

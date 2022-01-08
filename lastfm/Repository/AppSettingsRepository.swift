//
//  StoreReview.swift
//  lastfm
//
//  Created by Nicolau Atala on 08/01/22.
//


import Foundation

final class AppSettingsRepository: AppSettingsRepositoryProtocol {
	static var shared: AppSettingsRepositoryProtocol = AppSettingsRepository()
	private var repository = DefaultRepository<AppSettings>(with: RepositoryKeys.settings)
	private var settings: AppSettings

	init() {
		guard let appSettings = repository.retrieve() else {
			let newAppSettings = AppSettings(openingCount: 1)
			self.settings = newAppSettings
			update()
			return
		}
		self.settings = appSettings
		self.settings.increaseOpeningCount()
		update()
	}

	private func update() {
		DispatchQueue.main.async {
			self.repository.update(data: self.settings)
		}
	}
}

protocol AppSettingsRepositoryProtocol {
	static var shared: AppSettingsRepositoryProtocol { get }
}


//
//  HomeCoordinator.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import UIKit

class HomeCoordinator: Coordinator {

	private let window: UIWindow
	private let homeViewController: HomeViewController

	init(window: UIWindow) {
		self.window = window
		let homeService = HomeService()
		let homeViewModel = HomeViewModel(service: homeService)
		homeViewController = HomeViewController(viewModel: homeViewModel)
	}

	func start() {
		window.rootViewController = homeViewController
		_ = AppSettingsRepository.shared
	}
}

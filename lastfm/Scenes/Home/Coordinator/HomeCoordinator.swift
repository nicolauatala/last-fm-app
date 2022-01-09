//
//  HomeCoordinator.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import UIKit

class HomeCoordinator: Coordinator, HomeViewModelCoordinatorDelegate {
	private let window: UIWindow
	private var homeViewController: HomeViewController!
	private var homeViewModel: HomeViewModel!
	private var navigationController: UINavigationController!

	init(window: UIWindow) {
		self.window = window
	}

	deinit {
		print("\(#function) - HomeCoordinator")
	}

	func start() {
		let homeService = HomeService()
		homeViewModel = HomeViewModel(service: homeService, coordinatorDelegate: self)
		homeViewController = HomeViewController(viewModel: homeViewModel)
		_ = AppSettingsRepository.shared
		navigationController = UINavigationController(rootViewController: homeViewController)
		window.rootViewController = navigationController
	}

	func albumDetail(_ with: Album) {
		print("\(#fileID) - \(#function) - with - \(with)")
		navigationController.pushViewController(AlbumViewController(), animated: true)
	}
}

protocol HomeViewModelCoordinatorDelegate: AnyObject {
	func albumDetail(_ with: Album)
}

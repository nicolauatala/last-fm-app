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
		homeViewController = HomeViewController()
	}

	func start() {
		window.rootViewController = homeViewController
	}
}

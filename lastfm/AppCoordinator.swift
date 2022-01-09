//
//  AppCoordinator.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import UIKit

final class AppCoordinator: Coordinator {
	private let window: UIWindow
	private let homeCoordinator: HomeCoordinator

	init(window: UIWindow) {
		self.window = window
		homeCoordinator = HomeCoordinator(window: window)
	}

	func start() {
		window.makeKeyAndVisible()
		coordinate(to: homeCoordinator)
	}
}

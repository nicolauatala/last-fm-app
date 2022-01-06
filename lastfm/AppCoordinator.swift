//
//  AppCoordinator.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import UIKit

final class AppCoordinator: Coordinator {
	private let window: UIWindow

	init(window: UIWindow) {
		self.window = window
	}

	func start() {
		let homeCoordinator = HomeCoordinator(window: window)
		coordinate(to: homeCoordinator)
	}
}

//
//  SceneDelegate.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var appCoordinator: AppCoordinator?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions) {
			guard let windowScene = (scene as? UIWindowScene) else {
				return
			}

			let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
			appWindow.windowScene = windowScene

			appWindow.makeKeyAndVisible()

			window = appWindow
			appCoordinator = AppCoordinator(window: window!)
			appCoordinator?.start()
	}

	func sceneDidDisconnect(_ scene: UIScene) {}

	func sceneDidBecomeActive(_ scene: UIScene) {}

	func sceneWillResignActive(_ scene: UIScene) {}

	func sceneWillEnterForeground(_ scene: UIScene) {}

	func sceneDidEnterBackground(_ scene: UIScene) {}


}


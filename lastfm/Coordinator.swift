//
//  Coordinator.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

protocol Coordinator {
	func start()
	func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
	func coordinate(to coordinator: Coordinator	) {
		coordinator.start()
	}
}

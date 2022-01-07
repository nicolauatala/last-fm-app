//
//  RepositoryProtocol.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

import Foundation

protocol Repository {
	associatedtype Generic
}

extension Repository {
	func retrieve() -> Generic? {
		return nil
	}

	func save(data: Generic) -> Bool {
		return false
	}

	func update(data: Generic) -> Bool {
		return false
	}

	func remove(data: Generic) -> Bool {
		return false
	}
}

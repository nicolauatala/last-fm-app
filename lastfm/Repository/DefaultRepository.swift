//
//  DefaultRepository.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

import Foundation

class DefaultRepository<Generic: Codable>: Repository {

	private var repository: UserDefaults
	private(set) var key: String

	init(with key: String) {
		self.key = key
		self.repository = UserDefaults.standard
	}

	func retrieve() -> Generic? {
		let decoder = JSONDecoder()
		guard let data = repository.data(forKey: key),
			  let object = try? decoder.decode(Generic.self, from: data) else {
				  return repository.object(forKey: key) as? Generic
			  }
		return object
	}

	@discardableResult func save(data: Generic) -> Bool {
		let encoder = JSONEncoder()

		guard let encodedData = try? encoder.encode(data) else {
			repository.set(data, forKey: key)
			repository.synchronize()
			return true
		}

		repository.set(encodedData, forKey: key)
		repository.synchronize()
		return true
	}

	@discardableResult func update(data: Generic) -> Bool {
		return save(data: data)
	}

	@discardableResult func remove(data: Generic) -> Bool {
		repository.removeObject(forKey: key)
		repository.synchronize()
		return true
	}
}

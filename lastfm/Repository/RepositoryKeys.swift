//
//  RepositoryKeys.swift
//  lastfm
//
//  Created by Nicolau Atala on 08/01/22.
//

import Foundation

struct RepositoryKeys {
	fileprivate static let repositoryKey = "repository-key"
	static let settings = "settings-\(RepositoryKeys.repositoryKey)"
	static let topAlbums = "top-albums-\(RepositoryKeys.repositoryKey)"
}

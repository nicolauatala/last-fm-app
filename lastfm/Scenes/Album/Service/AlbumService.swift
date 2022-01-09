//
//  AlbumService.swift
//  lastfm
//
//  Created by Nicolau Atala on 09/01/22.
//

import Foundation
import Alamofire

protocol AlbumServiceProtocol {
	func getInfo(album: Album, completion: @escaping ((AlbumInfo?) -> Void))
}

class AlbumService: AlbumServiceProtocol {
	func getInfo(album: Album, completion: @escaping ((AlbumInfo?) -> Void)) {
		if case ArtistUnion.artistClass(let artist) = album.artist {
			AF.request(APIRouter.albumInfo(artist: artist.name, name: album.name))
				.responseDecodable(of: AlbumInfo.self) { (response: DataResponse<AlbumInfo, AFError>) in
					print("response")
					print(response)
					DispatchQueue.main.async {
						switch response.result {
						case .success(let response):
							completion(response)
						case .failure(let error):
							print(error)
							completion(nil)
						}
					}
				}
		}
	}
}

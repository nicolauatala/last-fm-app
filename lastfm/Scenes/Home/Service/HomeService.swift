//
//  HomeService.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol {
	func getTopAlbums(page: Int, completion: @escaping ((TopAlbums?) -> Void))
}

class HomeService: HomeServiceProtocol {
	func getTopAlbums(page: Int, completion: @escaping ((TopAlbums?) -> Void)) {
		AF.request(APIRouter.topAlbums(page))
			.responseDecodable(of: TopAlbums.self) { (response: DataResponse<TopAlbums, AFError>) in
				DispatchQueue.main.async {
					switch response.result {
					case .success(let response):
						if (page == 1) {
							TopAlbumsRepository.shared.update(with: response)
						}
						completion(response)
					case .failure(let error):
						print(error)
						completion(nil)
					}
				}
			}
	}
}

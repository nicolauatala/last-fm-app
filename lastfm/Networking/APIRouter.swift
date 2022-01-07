//
//  APIRouter.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import Foundation
import Alamofire

enum APIRouter: APIURLRequest {

	case topAlbums(_ page: Int)

	// MARK: - HTTPMethod
	var method: HTTPMethod {
		switch self {
		case .topAlbums:
			return .get
		}
	}
	// MARK: - Parameters
	var parameters: Parameters {
		switch self {
		case .topAlbums(let page):
			return ([
				"tag": "hip-hop",
				"limit": "10",
				"method": "tag.getTopAlbums",
				"page": page
			])
		}
	}

	// MARK: - URLRequestConvertible
	func asURLRequest() throws -> URLRequest {
		let url = try APIConstants.Server.baseURL.asURL()
		var urlRequest = URLRequest(url: url)

		// HTTP Method
		urlRequest.httpMethod = method.rawValue

		// Parameters
		var queryParams = parameters.map { pair  in
			return URLQueryItem(name: pair.key, value: "\(pair.value)")
		}
		queryParams.append(URLQueryItem(name: "api_key", value: APIConstants.Server.apiKey))
		queryParams.append(URLQueryItem(name: "format", value: "json"))

		var components = URLComponents(string: url.absoluteString)
		components?.queryItems = queryParams
		urlRequest.url = components?.url

		return urlRequest
	}
}

//
//  APIURLRequest.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import Foundation
import Alamofire

protocol APIURLRequest: URLRequestConvertible {
	var method: HTTPMethod { get }
	var parameters: Parameters { get }
}

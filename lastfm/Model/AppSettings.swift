//
//  AppSettings.swift
//  lastfm
//
//  Created by Nicolau Atala on 08/01/22.
//

import Foundation
import StoreKit

class AppSettings: Codable {
	var openingCount: Int

	func increaseOpeningCount() {
		openingCount = openingCount + 1
		if (self.openingCount == 10) {
			if #available(iOS 10.3, *) {
				SKStoreReviewController.requestReview()
			}
			openingCount = 0
		}
		print("\(#fileID) - \(#function) - openingCount - \(openingCount)")
	}

	init(openingCount: Int) {
		self.openingCount = openingCount
	}
}

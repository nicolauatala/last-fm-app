//
//  String+Extension.swift
//  lastfm
//
//  Created by Nicolau Atala on 09/01/22.
//

import Foundation

extension String {
	func dateFormat() -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "d MMM y, hh:mm"
		guard let newDate = dateFormatter.date(from: self) else {
			return "-"
		}
		dateFormatter.dateFormat = "d/MM/yyyy"
		return dateFormatter.string(from: newDate)
	}
}

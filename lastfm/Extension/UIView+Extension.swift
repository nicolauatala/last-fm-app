//
//  UIView+Extension.swift
//  lastfm
//
//  Created by Nicolau Atala on 08/01/22.
//

import UIKit

extension UIView {

	@IBInspectable
	var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
}

//
//  Observable.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

final class Observable<T> {
	typealias Subscribe = (T) -> Void
	var subscribe: Subscribe?
	var currentValue: T

	deinit {
		print("_ Deinit: \(String(describing: self.subscribe))")
	}

	var value: T {
		didSet {
			subscribe?(value)
			currentValue = value
		}
	}

	init(_ value: T) {
		self.value = value
		self.currentValue = value
	}

	func bind(listener: Subscribe?) {
		self.subscribe = listener
		listener?(value)
	}
}

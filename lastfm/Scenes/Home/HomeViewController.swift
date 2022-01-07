//
//  HomeViewController.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func viewDidAppear(_ animated: Bool) {
		let service = HomeService()
		service.getTopAlbums(page: 1) { response in
			print(response)
		}
	}

}

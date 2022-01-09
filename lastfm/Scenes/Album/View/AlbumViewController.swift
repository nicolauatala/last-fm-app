//
//  AlbumViewController.swift
//  lastfm
//
//  Created by Nicolau Atala on 09/01/22.
//

import UIKit

class AlbumViewController: UIViewController {

	internal let viewModel: AlbumViewModel

	init(viewModel: AlbumViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = viewModel.album.name
		viewModel.getInfo()
    }
}

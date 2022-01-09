//
//  AlbumViewController.swift
//  lastfm
//
//  Created by Nicolau Atala on 09/01/22.
//

import UIKit
import SDWebImage

class AlbumViewController: UIViewController {

	//MARK: Outlet
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var albumName: UILabel!
	@IBOutlet weak var artist: UILabel!
	@IBOutlet weak var published: UILabel!
	@IBOutlet weak var listeners: UILabel!
	@IBOutlet weak var tracks: UILabel!

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
		setupView()
		bindData()
    }

	override func viewDidAppear(_ animated: Bool) {
		viewModel.getInfo()
	}

	private func setupView() {
		albumName.text = viewModel.album.name
		if case ArtistUnion.artistClass(let artist) = viewModel.album.artist {
			self.artist.text = artist.name
		}
		guard let url = viewModel.album.largeUrlImage(), let imageURL = URL(string: url) else { return }
		imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
		imageView.sd_setImage(with: imageURL)
	}

	private func bindData() {
		viewModel.details.bind { [weak self] (detail) in
			guard let self = self else { return }
			DispatchQueue.main.async {
				if let published = detail?.album.wiki?.published,
				   let dateFormat = published.dateFormat() {
					self.published.text = "Published: \(dateFormat)"
				}
				if let listeners = detail?.album.listeners {
					self.listeners.text = "Listeners: \(listeners)"
				}
				if let tracks = detail?.album.tracks?.track {
					self.tracks.text = "Tracks: \(tracks.count)"
				}
			}
		}
	}
}

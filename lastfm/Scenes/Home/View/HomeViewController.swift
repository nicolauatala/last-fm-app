//
//  HomeViewController.swift
//  lastfm
//
//  Created by Nicolau Atala on 06/01/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {

	internal let viewModel: HomeViewModel
	private var collectionView: UICollectionView?
	internal var isLoading: Bool = false

	init(viewModel: HomeViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Top Albums"
		setupCollectionView()
		bindData()
		loadTopAlbums()
    }

	private func setupCollectionView() {
		collectionView = UICollectionView(frame: CGRect(x: 0,
														y: 0,
														width: view.bounds.width,
														height: view.bounds.height),
										  collectionViewLayout: UICollectionViewFlowLayout())
		collectionView?.delegate = self
		collectionView?.dataSource = self
		collectionView?.register(UINib(nibName: AlbumCollectionViewCell.reuseIdentifier, bundle: nil),
								 forCellWithReuseIdentifier: AlbumCollectionViewCell.reuseIdentifier)
		view.addSubview(collectionView!)
		collectionView?.translatesAutoresizingMaskIntoConstraints = false
		collectionView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
		collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
		collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
		collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
		collectionView?.backgroundColor = .black
	}

	private func bindData() {
		viewModel.albums.bind { [weak self] (_) in
			guard let self = self else { return }
			DispatchQueue.main.async {
				self.collectionView?.reloadData()
				self.isLoading = false
			}
		}
	}

	func loadTopAlbums() {
		viewModel.getTopAlbums()
	}

}

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

	init(viewModel: HomeViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		setupCollectionView()
		bindData()
    }

	override func viewDidAppear(_ animated: Bool) {
		viewModel.getTopAlbums()
	}

	fileprivate func setupCollectionView() {
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
		viewModel.topAlbums.bind { [weak self] (_) in
			guard let self = self else { return }
			DispatchQueue.main.async {
				self.collectionView?.reloadData()
			}
		}
	}

}


extension HomeViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.topAlbums.currentValue?.albums.album.count ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.reuseIdentifier,
															for: indexPath) as? AlbumCollectionViewCell else {
			preconditionFailure("Invalid cell type")
		}
		if let albumList = viewModel.topAlbums.currentValue?.albums.album {
			let album = albumList[indexPath.row] as Album
			cell.name.text = album.name
			if let imageURL = album.largeUrlImage() {
				cell.loadImage(imageURL)
			}
		}

		return cell
	}

//	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//		viewModel.showDetailView(with: indexPath.item)
//	}
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		sizeForItemAt indexPath: IndexPath
	) -> CGSize {
		let itemsPerRow: CGFloat = 2
		let availableWidth = view.frame.width - 12
		let widthPerItem = availableWidth / itemsPerRow

		return CGSize(width: widthPerItem, height: widthPerItem)
	}

	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		minimumLineSpacingForSectionAt section: Int
	) -> CGFloat {
		return 0.0
	}
}

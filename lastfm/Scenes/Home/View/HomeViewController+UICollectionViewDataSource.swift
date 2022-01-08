//
//  HomeViewController+UICollectionViewDataSource.swift
//  lastfm
//
//  Created by Nicolau Atala on 08/01/22.
//

import UIKit

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

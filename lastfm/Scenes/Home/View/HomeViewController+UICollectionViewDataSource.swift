//
//  HomeViewController+UICollectionViewDataSource.swift
//  lastfm
//
//  Created by Nicolau Atala on 08/01/22.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print(viewModel.albums.currentValue.count)
		return viewModel.albums.currentValue.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.reuseIdentifier,
															for: indexPath) as? AlbumCollectionViewCell else {
			preconditionFailure("Invalid cell type")
		}
		let topAlbums = viewModel.albums.currentValue
		let album = topAlbums[indexPath.row] as Album
		cell.name.text = album.name
		if let imageURL = album.largeUrlImage() {
			cell.loadImage(imageURL)
		}

		return cell
	}

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let contentOffsetY = scrollView.contentOffset.y
		if contentOffsetY >= (scrollView.contentSize.height - scrollView.bounds.height) - 44 {
			guard !self.isLoading, viewModel.albums.currentValue.count > 0 else { return }
			self.isLoading = true
			loadTopAlbums()
		}
	}

	//	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	//		viewModel.showDetailView(with: indexPath.item)
	//	}
}

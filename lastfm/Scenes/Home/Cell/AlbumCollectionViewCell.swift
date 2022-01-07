//
//  AlbumCollectionViewCell.swift
//  lastfm
//
//  Created by Nicolau Atala on 07/01/22.
//

import UIKit
import SDWebImage

class AlbumCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var name: UILabel!

	static let reuseIdentifier = String(describing: AlbumCollectionViewCell.self)

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func loadImage(_ url: String?) {
		guard let url = url, let imageURL = URL(string: url) else { return }
		imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
		imageView.sd_setImage(with: imageURL)
	}

}

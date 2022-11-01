//
//  MediaUserCollectionViewCell.swift
//  UIKitInstagram
//
//  Created by Maxim on 23.10.2022.
//

import UIKit

/// Контроллер ячейки медиа в коллекции
final class MediaUserCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var mediaImageView: UIImageView!
    
    // MARK: - Public Properties
    var media: Media? {
        didSet {
            if let image = media?.contentImageName {
                mediaImageView.image = UIImage(named: image)
            }
        }
    }
}

//
//  MediaUserTableViewCell.swift
//  UIKitInstagram
//
//  Created by Maxim on 23.10.2022.
//

import UIKit

/// Контроллер строки медиа в таблице
final class MediaUserTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    private enum Constants {
        static let indentifierMediaUserCollectionCell = "MediaUserCollectionCell"
        static let photoOneImageName = "musk"
        static let photoTwoImageName = "musk2"
        static let photoThreeImageName = "musk3"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Private Properties
    private let mediaItems: [Media] = {
        let photoOne = Media(contentImageName: Constants.photoOneImageName)
        let photoTwo = Media(contentImageName: Constants.photoTwoImageName)
        let photoThree = Media(contentImageName: Constants.photoThreeImageName)
        return [photoOne, photoTwo, photoThree, photoThree, photoOne, photoTwo,
                photoTwo, photoThree, photoOne, photoOne, photoTwo, photoThree]
    }()
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MediaUserTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        mediaItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                Constants.indentifierMediaUserCollectionCell,
                                                             for: indexPath) as? MediaUserCollectionViewCell {
            itemCell.media = mediaItems[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
}

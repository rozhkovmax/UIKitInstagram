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
    private var itemMedia: [Media] = {
        var photoOne = Media()
        photoOne.contentImageName = Constants.photoOneImageName
        var photoTwo = Media()
        photoTwo.contentImageName = Constants.photoTwoImageName
        var photoThree = Media()
        photoThree.contentImageName = Constants.photoThreeImageName
        return [photoOne, photoTwo, photoThree, photoThree, photoOne, photoTwo,
                photoTwo, photoThree, photoOne, photoOne, photoTwo, photoThree]
    }()
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        createCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private Methods
    private func createCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MediaUserTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return itemMedia.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                Constants.indentifierMediaUserCollectionCell,
                                                             for: indexPath) as? MediaUserCollectionViewCell {
            itemCell.media = itemMedia[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
}

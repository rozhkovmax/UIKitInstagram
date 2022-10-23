//
//  ActualTableViewCell.swift
//  UIKitInstagram
//
//  Created by Maxim on 23.10.2022.
//

import UIKit

/// Контроллер строки сторис в таблице
final class ActualTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    private enum Constants {
        static let indentifierMediaUserCollectionCell = "ActualCollectionCell"
        static let actualImageName = "icon Tesla"
        static let contentOneName = "Starlink"
        static let contentTwoName = "Tesla"
        static let contentThreeName = "Starship"
        static let contentFourName = "SpaceX"
        static let contentFiveName = "Crew Dragon"
        static let contentSixName = "Hyperloop"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var actualCollectionView: UICollectionView!
    
    // MARK: - Private Properties
    private var itemActual: [Actual] = {
        var contentOne = Actual()
        contentOne.contentImageName = Constants.actualImageName
        contentOne.contentName = Constants.contentOneName
        var contentTwo = Actual()
        contentTwo.contentImageName = Constants.actualImageName
        contentTwo.contentName = Constants.contentTwoName
        var contentThree = Actual()
        contentThree.contentImageName = Constants.actualImageName
        contentThree.contentName = Constants.contentThreeName
        var contentFour = Actual()
        contentFour.contentImageName = Constants.actualImageName
        contentFour.contentName = Constants.contentFourName
        var contentFive = Actual()
        contentFive.contentImageName = Constants.actualImageName
        contentFive.contentName = Constants.contentFourName
        var contentSix = Actual()
        contentSix.contentImageName = Constants.actualImageName
        contentSix.contentName = Constants.contentSixName
        return [contentOne, contentTwo, contentThree, contentFour, contentFive, contentSix]
    }()
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        createActualCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private Methods
    private func createActualCollectionView() {
        actualCollectionView.delegate = self
        actualCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ActualTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return itemActual.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                Constants.indentifierMediaUserCollectionCell,
                                                             for: indexPath) as? ActualCollectionViewCell {
            itemCell.actual = itemActual[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
}

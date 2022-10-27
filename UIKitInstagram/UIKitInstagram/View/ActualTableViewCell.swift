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
        static let actualImageName = "tesla"
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
    private let itemActual: [Actual] = {
        let contentOne = Actual(contentImageName: Constants.actualImageName, contentName: Constants.contentOneName)
        let contentTwo = Actual(contentImageName: Constants.actualImageName, contentName: Constants.contentTwoName)
        let contentThree = Actual(contentImageName: Constants.actualImageName, contentName: Constants.contentThreeName)
        let contentFour = Actual(contentImageName: Constants.actualImageName, contentName: Constants.contentFourName)
        let contentFive = Actual(contentImageName: Constants.actualImageName, contentName: Constants.contentFourName)
        let contentSix = Actual(contentImageName: Constants.actualImageName, contentName: Constants.contentSixName)
        return [contentOne, contentTwo, contentThree, contentFour, contentFive, contentSix]
    }()
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        createActualCollectionView()
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
        itemActual.count
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

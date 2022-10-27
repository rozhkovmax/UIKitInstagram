//
//  ActualCollectionViewCell.swift
//  UIKitInstagram
//
//  Created by Maxim on 23.10.2022.
//

import UIKit

/// Контроллер ячейки сторис в коллекции
final class ActualCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var actualImageView: UIImageView!
    @IBOutlet private weak var actualNameLabel: UILabel!
    
    // MARK: - Public Properties
    var actual: Actual? {
        didSet {
            actualNameLabel.text = actual?.contentName
            if let image = actual?.contentImageName {
                actualImageView.image = UIImage(named: image)
            }
        }
    }
}

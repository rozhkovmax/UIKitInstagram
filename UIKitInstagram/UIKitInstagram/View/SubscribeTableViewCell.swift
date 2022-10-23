//
//  SubscribeTableViewCell.swift
//  UIKitInstagram
//
//  Created by Maxim on 22.10.2022.
//

import UIKit

/// Контроллер подписки в таблице
final class SubscribeTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    private enum Constants {
        static let subscribeOnButtonName = "Подписаться"
        static let subscribeOffButtonName = "Вы подписаны"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var subscribeTextLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var subscribeButton: UIButton!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public Methods
    func refresh(_ model: Comment) {
        subscribeTextLabel.attributedText = NSMutableAttributedString()
            .bold("\(model.nameText) ")
            .normal("\(model.lineText) ")
            .textColor("\(model.hourText)")
        avatarImageView.image = UIImage(named: model.avatarImageName)
        if model.isSubscribe == true {
            subscribeButton.setTitle(Constants.subscribeOnButtonName, for: .normal)
            subscribeButton.setTitleColor(.white, for: .normal)
            subscribeButton.layer.borderColor = UIColor.gray.cgColor
            subscribeButton.layer.borderWidth = 0.5
            subscribeButton.backgroundColor = .link
        } else {
            subscribeButton.setTitle(Constants.subscribeOffButtonName, for: .normal)
            subscribeButton.setTitleColor(.white, for: .normal)
            subscribeButton.layer.borderColor = UIColor.gray.cgColor
            subscribeButton.layer.borderWidth = 0.5
            subscribeButton.backgroundColor = .black
        }
        subscribeButton.titleLabel?.font = .systemFont(ofSize: 14)
        subscribeButton.layer.cornerRadius = 5
    }
}

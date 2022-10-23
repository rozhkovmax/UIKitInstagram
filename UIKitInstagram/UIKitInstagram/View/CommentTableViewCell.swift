//
//  CommentTableViewCell.swift
//  UIKitInstagram
//
//  Created by Maxim on 19.10.2022.
//

import UIKit

/// Контроллер комментария в таблице
final class CommentTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    private enum Constants {
        static let defaultImageName = "questionmark.circle"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var commentTextLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public Methods
    func refresh(_ model: Comment) {
        commentTextLabel.attributedText = NSMutableAttributedString()
            .bold("\(model.nameText) ")
            .normal("\(model.lineText) ")
            .textColor("\(model.hourText)")
        avatarImageView.image = UIImage(named: model.avatarImageName)
        photoImageView.image = UIImage(named: model.photoImageName ?? Constants.defaultImageName)
    }
}

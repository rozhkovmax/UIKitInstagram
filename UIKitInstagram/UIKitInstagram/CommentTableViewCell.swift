//
//  CommentTableViewCell.swift
//  UIKitInstagram
//
//  Created by Maxim on 19.10.2022.
//

import UIKit

/// Контроллер комментария в таблице
final class CommentTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var hourLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public Methods
    func refresh(_ model: Comment) {
        nameLabel.text = model.nameText
        commentLabel.text = model.lineText
        hourLabel.text = model.hourText
        avatarImageView.image = UIImage(named: model.avatarImageName)
        photoImageView.image = UIImage(named: model.photoImageName)
    }
}

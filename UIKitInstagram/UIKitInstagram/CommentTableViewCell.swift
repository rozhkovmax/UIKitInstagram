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
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public Methods
    func refresh(_ model: Comments) {
        nameLabel.text = model.nameText
        commentLabel.text = model.textLine
        hourLabel.text = model.hourText
        avatarImageView.image = UIImage(named: model.avatarImge)
        photoImageView.image = UIImage(named: model.photoImage)
    }
}

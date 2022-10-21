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
        photoImageView.image = UIImage(named: model.photoImageName)
    }
}

extension NSMutableAttributedString {
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: 15) }
    var systemFont: UIFont { return UIFont.systemFont(ofSize: 15) }
    
    func bold(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: systemFont,
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func textColor(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: systemFont,
            .foregroundColor: UIColor.lightGray,
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}

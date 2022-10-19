//
//  RequestTableViewCell.swift
//  UIKitInstagram
//
//  Created by Maxim on 19.10.2022.
//

import UIKit

/// Контроллер первой строки в таблице
final class RequestTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public Methods
    func refresh(_ model: Comments) {
        titleLabel.text = model.lineOne
    }
}

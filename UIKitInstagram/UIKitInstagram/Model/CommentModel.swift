//
//  CommentModel.swift
//  UIKitInstagram
//
//  Created by Maxim on 19.10.2022.
//

import Foundation

/// Модель комментариев
struct Comment {
    let lineText: String
    let nameText: String
    let hourText: String
    let avatarImageName: String
    let photoImageName: String?
    let isSubscribe: Bool?
}

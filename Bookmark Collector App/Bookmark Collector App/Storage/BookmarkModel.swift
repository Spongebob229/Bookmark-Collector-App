//
//  Bookmark.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import Foundation

struct BookmarkModel: Identifiable, Codable {
    var id: String
    let name: String
    let link: String
    let creatorId: String
}

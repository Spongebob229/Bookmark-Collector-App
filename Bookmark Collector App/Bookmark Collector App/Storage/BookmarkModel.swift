//
//  Bookmark.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import Foundation

struct BookmarkModel: Identifiable {
    var id = UUID()
    
    let name: String
    let link: String
}

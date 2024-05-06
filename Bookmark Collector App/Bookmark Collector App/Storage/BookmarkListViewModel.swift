//
//  BookmarkStorage.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import Foundation

class BookmarkListViewModel: ObservableObject {
   @Published var bookmarks: [BookmarkModel] = []
    
    func addBookmark(name: String, link: String) {
        bookmarks.append(BookmarkModel(name: name, link: link))
    }
}

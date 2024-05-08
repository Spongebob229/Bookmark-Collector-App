//
//  BookmarkStorage.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import Foundation

class BookmarkListViewModel: ObservableObject {
   @Published var bookmarks: [BookmarkModel] = []
    let userId: String = AuthService.shared.user?.uid ?? ""
    
    func addBookmark(name: String, link: String) throws {
        let id = UUID().uuidString
        let bookmarkModel = BookmarkModel(id: id, name: name, link: link, creatorId: userId)
        try DatabaseService.shared.createBookmarkDocument(bookmark: bookmarkModel)
        bookmarks.append(BookmarkModel(id: id, name: name, link: link, creatorId: userId))
        
    }
    
    @MainActor func getModels() async throws {
        let models = try await DatabaseService.shared.getBookmarkList(creationId: userId)
        
        bookmarks += models
    }
    
   
}

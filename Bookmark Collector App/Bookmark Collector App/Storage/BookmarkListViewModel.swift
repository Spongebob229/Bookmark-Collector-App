//
//  BookmarkStorage.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import Foundation

class BookmarkListViewModel: ObservableObject, Equatable {
    static func == (lhs: BookmarkListViewModel, rhs: BookmarkListViewModel) -> Bool {
        return lhs.bookmarks == rhs.bookmarks
    }
    
   @Published var bookmarks: [BookmarkModel] = []
    
    func addBookmark(name: String, link: String) {
        let id = UUID().uuidString
        Task {
            do {
                let bookmarkModel = BookmarkModel(id: id, name: name, link: link)
                try DatabaseService.shared.createBookmarkDocument(bookmark: bookmarkModel)
                bookmarks.append(BookmarkModel(id: id, name: name, link: link))
                
            } catch {
                print("lol")
            }
        }
    }
    
    @MainActor func getModels() async throws {
        let models = try await DatabaseService.shared.getBookmarkList()
        
        bookmarks += models
    }
    
   
}

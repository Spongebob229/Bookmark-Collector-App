//
//  DatabaseService.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 06.05.2024.
//

import Foundation
import FirebaseFirestore

final class DatabaseService {
    static let shared = DatabaseService()

    private init() {}

    private let dataBase = Firestore.firestore()

    private var bookmarksCollectionReference: CollectionReference {
        dataBase.collection("bookmarks")
    }
    
    func createBookmarkDocument(bookmark: BookmarkModel) throws {
        try bookmarksCollectionReference.document(bookmark.id).setData(from: bookmark)
    }
    
    func getBookmarkList() async throws -> [BookmarkModel] {
        try await bookmarksCollectionReference
            .getDocuments()
            .documents.map { try $0.data(as: BookmarkModel.self) }
    }
}

//
//  BookmarkList.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct BookmarkList: View {
    @EnvironmentObject var bookmarkStorage: BookmarkListViewModel
    var body: some View {
        VStack(spacing: 0) {
            if bookmarkStorage.bookmarks.isEmpty {
                MainTitle(title: Constants.mainTitleText, color: .black)
                    .multilineTextAlignment(.center)
            }
            else {
                ScrollView {
                    ForEach(bookmarkStorage.bookmarks) { bookmark in
                        BookmarkView(bookmark: bookmark)
                    }
                }
            }
        }
    }
}

private extension BookmarkList {
    private enum Constants {
        static let mainTitleText = "Save your first bookmark"
    }
}

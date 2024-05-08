//
//  BookmarkList.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct BookmarkList: View {
    @EnvironmentObject var bookmarkListViewModels: BookmarkListViewModel
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            if bookmarkListViewModels.bookmarks.isEmpty {
                MainTitle(title: Constants.mainTitleText, color: .black)
                    .multilineTextAlignment(.center)
            }
            else {
                ScrollView {
                    ForEach(bookmarkListViewModels.bookmarks) { bookmark in
                        BookmarkView(bookmark: bookmark)
                    }
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await bookmarkListViewModels.getModels()
                } catch {
                    showAlert.toggle()
                }
            }
        }
        .alert("Error;)", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

private extension BookmarkList {
    private enum Constants {
        static let mainTitleText = "Save your first bookmark"
    }
}

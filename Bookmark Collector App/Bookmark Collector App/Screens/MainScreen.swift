//
//  MainScreen.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var bookmarkListViewModel: BookmarkListViewModel = BookmarkListViewModel()
    @State var showBookmarkCreationSheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                BookmarkList()
                
                VStack {
                    Spacer()
                    MainButton(title: "Add bookmark", type: .dark) {
                        showBookmarkCreationSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showBookmarkCreationSheet) {
                SheetView(showSheet: $showBookmarkCreationSheet)
                    .presentationDetents([.height(360)])
                    .presentationCornerRadius(20)
        
            }
        }
        .environmentObject(bookmarkListViewModel)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("List")
        .padding(.horizontal, 16)
       
    }
}

#Preview {
    MainScreen()
}

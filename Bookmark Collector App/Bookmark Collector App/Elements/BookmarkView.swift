//
//  BookmarkView.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct BookmarkView: View {
    let bookmark: BookmarkModel
    
    
    var body: some View {
        HStack{
            Text(bookmark.name)
                .font(.system(size: 17))
            
            Spacer()
            Image("OpenLink")
            
        }
        .padding(.bottom, 11)
        .padding(.horizontal, 16)
        .onTapGesture {
            if let url = URL(string: bookmark.link) {
                   UIApplication.shared.open(url)
                }
        }
        
        Divider()
            .padding(.leading, 20)
            .padding(.bottom, 28)
    }
}

//
//  SheetView.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct SheetView: View {
    @EnvironmentObject var bookmarkListViewModel: BookmarkListViewModel
    @State var name: String = ""
    @State var link: String = ""
    @Binding var showSheet: Bool
    @State var showErrorAlert = false
    @State var showEmptyAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                Spacer()
                Image(systemName: "xmark")
                    .frame(height: 12)
                    .onTapGesture {
                        showSheet.toggle()
                    }
            }
            .padding(.bottom, 16)
            .padding(.top, 22)
            
            Spacer()
            
            HStack{
                Text("Title")
                    .font(.system(size: 17))
                Spacer()
            }
            .padding(.bottom, 12)
    
            InputField(placeholder: "Bookmark title", text: $name)
                .padding(.bottom, 16)
            
            HStack{
                Text("Link")
                    .font(.system(size: 17))
                Spacer()
            }
            .padding(.bottom, 12)
            
            InputField(placeholder: "Bookmark link (URl)", text: $link)
                .padding(.bottom, 24)
                
            
            Spacer()
            
            MainButton(title: "Save", type: .dark) {
                if name.isEmpty || link.isEmpty {
                    showEmptyAlert.toggle()
                } else {
                    do {
                        bookmarkListViewModel.addBookmark(name: name, link: link)
                        showSheet.toggle()
                    } catch {
                        showErrorAlert.toggle()
                    }
                }
            }
            .padding(.bottom, 16)
             
        }
        .alert("Error", isPresented: $showErrorAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert("Fill all the fields", isPresented: $showEmptyAlert) {
            Button("OK", role: .cancel) { }
        }
        .padding(.horizontal)
    }
}


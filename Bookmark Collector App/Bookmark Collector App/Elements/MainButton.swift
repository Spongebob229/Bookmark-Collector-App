//  ContentView.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct MainButton: View {
    let title: String
    let type: ButtonType
    let onButtonPressed: (() -> Void)
    
    var body: some View {
        Button {
            onButtonPressed()
        } label: {
            Text(title)
                .foregroundStyle(type == .light ? .black : .white)
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 58)
                .background(type == .light ? Color.white : Color.black)
                .cornerRadius(16)
        }
    }
}

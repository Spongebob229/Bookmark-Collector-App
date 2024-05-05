//
//  WelcomeScreen.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("WelcomeScreenBackground")
                .resizable()
                .frame(height: 614)
                .padding(.bottom, 6)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, Color.black.opacity(0.2)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            HStack {
                MainTitle(title: "Save all interesting links in one app", color: .white)
                Spacer()
            }
            .padding(.bottom, 24)
            .padding(.horizontal, 8)
            
            
            MainButton(title: "Let’s start collecting", type: .light) {
                
            }
            .padding(.horizontal, 8)
            Spacer()
        }
        
        .background(Color.black)
        .ignoresSafeArea()
    }
}


#Preview {
    WelcomeScreen()
}

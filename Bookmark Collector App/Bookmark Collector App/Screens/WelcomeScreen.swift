//
//  WelcomeScreen.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import SwiftUI

struct WelcomeScreen: View {
    @State var showMainScreen = false
    @State var showBottomSheet = false
    @State var authType: AuthType = .signIn
    
    var body: some View {
        NavigationStack {
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
                    AuthService.shared.user != nil ? showMainScreen.toggle() : showBottomSheet.toggle()
                }
                .sheet(isPresented: $showBottomSheet) {
                    if(authType == .signIn) {
                        LoginScreen(showMainScreen: $showMainScreen, authType: $authType)
                            .padding()
                            .presentationDetents([.medium])
                            .presentationCornerRadius(20)
                        
                    }
                    else {
                        RegistrationScreen(showContentView: $showMainScreen, authType: $authType)
                            .padding()
                            .presentationDetents([.height(530)])
                            .presentationCornerRadius(20)
                    }
                }
                .padding(.horizontal, 8)
                
                NavigationLink(isActive: $showMainScreen) {
                    MainScreen()
                } label: {
                    EmptyView()
                }
                
                Spacer()
            }
            
            .background(Color.black)
            .ignoresSafeArea()
        }
    }
}


#Preview {
    WelcomeScreen()
}

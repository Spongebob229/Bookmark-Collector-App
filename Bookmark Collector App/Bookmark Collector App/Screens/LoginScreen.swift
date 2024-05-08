//
//  LoginScreen.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 07.05.2024.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State var showAlert = false
    @State var loginError: Error?
    @Binding var showMainScreen: Bool
    @Binding var authType: AuthType
    
    var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Text("Login")
                        .padding(.bottom, 12)
                        .font(.system(size: 30, weight: .semibold))
                    Spacer()
                }
                .padding(.top)
                .padding(.bottom, 8)
                
                HStack {
                    Text("Email")
                        .padding(.bottom, 12)
                        .font(.system(size: 17))
                    Spacer()
                }
                InputField(placeholder: "Email", text: $email)
                    .padding(.bottom, 16)
                    .autocapitalization(.none)
                
                HStack {
                    Text("Password")
                        .padding(.bottom, 12)
                        .font(.system(size: 17))
                    Spacer()
                }
                SecureInputField(text: $password)
                    .padding(.bottom, 24)
                
                HStack {
                    Text("Don't have an account?")
                    Button {
                        authType = .signUp
                    } label: {
                        Text("SIGN UP")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundStyle(Color.blue)
                    }
                    Spacer()
                }
                
                Spacer()
                
                
                
                MainButton(title: "Login", type: .dark) {
                    Task {
                        do {
                            try await AuthService.shared.signInUser(with: email, password: password)
                            showMainScreen.toggle()
                            print("Logged in")
                        } catch {
                            loginError = error
                            showAlert.toggle()
                        }
                    }
                }
                .alert(loginError?.localizedDescription ?? "Login error!", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                
            }
        }
    }

//
//  RegistrationScreen.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 07.05.2024.
//

import SwiftUI

struct RegistrationScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmationPassword = ""
    @State var showAlert = false
    @State var showIncorrectPassword = false
    @State var loginError: Error?
    @Binding var showContentView: Bool
    @Binding var authType: AuthType
    
    var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Text("Create account")
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
                    InputField(placeholder: "Your email", text: $email)
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
                        Text("Confirm your password")
                            .padding(.bottom, 12)
                            .font(.system(size: 17))
                        Spacer()
                    }
                    
                    SecureInputField(text: $confirmationPassword)
                        .padding(.bottom, 24)
                    
                    HStack {
                        Text("Already have an account?")
                        Button {
                            authType = .signIn
                        } label: {
                            Text("LOG IN")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundStyle(Color.blue)
                        }
                        Spacer()
                    }
                    
                }
                
                Spacer()
                
            }
        
        MainButton(title: "Sign up", type: .dark) {
                Task {
                    do {
                        if password == confirmationPassword {
                            try await AuthService.shared.signUpUser(with: email, password: password)
                            
                            showContentView.toggle()
                            print("Signed up")
                            
                        }
                        else {
                            showIncorrectPassword.toggle()
                            confirmationPassword = ""
                        }
                        
                    } catch {
                        loginError = error
                        print(error)
                        showAlert.toggle()
                    }
                }
            }
            .alert(loginError?.localizedDescription ?? "Sign up error!", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            .alert("Password should be the same; )", isPresented: $showIncorrectPassword) {
                Button("OK", role: .cancel) { }
            }
            
            
        }
    }



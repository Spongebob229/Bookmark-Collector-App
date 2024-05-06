//
//  Bookmark_Collector_AppApp.swift
//  Bookmark Collector App
//
//  Created by Schannikov Timothy on 05.05.2024.
//

import Firebase
import SwiftUI

@main
struct Bookmark_Collector_AppApp: App {
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            WelcomeScreen()
        }
    }
}

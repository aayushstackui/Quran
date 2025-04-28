//
//  QuranApp.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/27/25.
//

import SwiftUI
import Firebase

@main
struct QuranApp: App {
    init() {
        FirebaseApp.configure()
        print("Firebase configured successfully!")
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

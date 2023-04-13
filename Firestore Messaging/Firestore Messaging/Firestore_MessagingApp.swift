//
//  Firestore_MessagingApp.swift
//  Firestore Messaging
//
//  Created by Michael Parekh on 4/12/23.
//

import SwiftUI
import Firebase

@main
struct Firestore_MessagingApp: App {
    // Installed the ‘FirebaseFirestore’ and ‘FirebaseFirestoreSwift’ packages (‘FirebaseFirestoreSwift’ allows us to convert the Firestore data into our ‘Message’ model).
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

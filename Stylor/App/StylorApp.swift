//
//  StylorApp.swift
//  Stylor
//
//  Created by Ali El Mufti on 06/07/2024.
//
import SwiftUI
import FirebaseCore
import FirebaseAppCheck
import FirebaseAuth

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Firebase
        FirebaseApp.configure()
        
        // Configure App Check with Debug Provider Factory
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Handle URL for email verification
        if Auth.auth().canHandle(url) {
            return true
        }
        return false
    }
}

@main
struct YourApp: App {
    // Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppView() // Your initial view
        }
    }
}

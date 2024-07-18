//
//  StylorApp.swift
//  Stylor
//
//  Created by Ali El Mufti on 06/07/2024.
//
import SwiftUI
import FirebaseCore
import FirebaseAppCheck

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Firebase App Check with Debug Provider Factory
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        
        // Configure Firebase
        FirebaseApp.configure()
        
        // Set up the initial window and root view controller
        var window: UIWindow?
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()

        return true
    }
}

@main
struct YourApp: App {
  // Register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
        AuthenticationView()
      }
    }.environment(\.colorScheme, .dark) // or `.dark`
  }
}

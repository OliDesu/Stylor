//
//  SceneDelegate.swift
//  Stylor
//
//  Created by Ali El Mufti on 23/07/2024.
//
import Foundation
import Firebase
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) -> Bool {
        if let url = userActivity.webpageURL {
            Auth.auth().applyActionCode(url.absoluteString) { error in
                if let error = error {
                    print("Error applying action code: \(error.localizedDescription)")
                    return
                }

                // Successfully verified
                print("Email successfully verified. User should be logged in.")
                
                // Optionally, you might want to redirect the user to the app's main screen
                // Example:
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainVC = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController")
                    appDelegate.window?.rootViewController = mainVC
                }
            }
        }
        return true
    }
}

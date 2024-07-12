import UIKit
import FirebaseAuth
import SwiftUI

struct LoginViewControllerWrapper: UIViewControllerRepresentable {
    @Binding var isLoggedIn: Bool

    func makeUIViewController(context: Context) -> LoginViewController {
        let loginViewController = LoginViewController()
        loginViewController.onLoginSuccess = {
            self.isLoggedIn = true
        }
        return loginViewController
    }

    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
        // No update logic needed for this example
    }
}

class LoginViewController: UIViewController {
    var onLoginSuccess: (() -> Void)?
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        // Layout your UI elements here
        emailTextField.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
        passwordTextField.frame = CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 40)
        loginButton.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 40)
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to login:", error)
                return
            }
            
            // Successfully logged in
            print("Successfully logged in with user:", result?.user.uid ?? "")
            self.onLoginSuccess?()
        }
    }
    struct RootView: View {
        @State private var isLoggedIn = false

        var body: some View {
            if isLoggedIn {
                ContentView()
            } else {
                LoginViewControllerWrapper(isLoggedIn: $isLoggedIn)
            }
        }
    }
}


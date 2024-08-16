import SwiftUI

struct AuthenticationView: View {
    @State private var showLogin = false
    @State private var showRegister = false
    @State private var isLoggedIn = false
    @StateObject var viewModel: RegisterViewModel = RegisterViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        VStack {
            if isLoggedIn {
                NavigationView {
                    MainTabView()
                }
            } else {
                VStack(alignment: .center) {
                    Spacer()
                    Divider()
                    Text("🎨🪡🦹🏻").font(.system(size: 70))
                    Divider()
                    Spacer()
                    
                    NavigationStack(path: $path){
                        List {
                            
                            NavigationLink("Se Connecter", value: "LoginView")
                            NavigationLink("S'inscrire", value: "RegistrationView")
                        }.navigationDestination(for: String.self) { value in
                            switch value {
                            case "LoginView":
                                LoginView(viewModel: LoginViewModel(), didLogin: $isLoggedIn)
                                
                            case "RegistrationView":
                                NameAgeRegistration(
                                    delegate: viewModel,
                                    path: $path
                                )
                            default:
                                Text("Unknown View")
                            }
                        }
                    }
                    
                }
            }
        }
        .padding()
        .frame(maxHeight: .infinity)
    }
    
}

#Preview {
        AuthenticationView()
}


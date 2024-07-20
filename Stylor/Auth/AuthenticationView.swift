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
                                LoginViewControllerWrapper(isLoggedIn:$isLoggedIn)
                                
                            case "RegistrationView":
                                NameAgeRegistration(
                                    path: $path
                                ).environmentObject(self.viewModel)
                            default:
                                Text("Unknown View")
                            }
                      /*  NavigationLink {
                            NameAgeRegistration(
                                path: $path
                            ).environmentObject(self.viewModel).navigationDestination(item: <#T##Binding<Optional<Hashable>>#>, destination: <#T##(Hashable) -> View#>)

                        } label: {
                            Text(
                                "S'enregistrer"
                            )
                        }
                        
                        NavigationLink {
                       LoginViewControllerWrapper(isLoggedIn:$isLoggedIn)
                        } label: {
                            Text(
                                "Se connecter"
                            )
                        }*/
                        
                        
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
        AuthenticationView(viewModel: RegisterViewModel())
}


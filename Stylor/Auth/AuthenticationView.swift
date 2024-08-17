import SwiftUI

struct AuthenticationView: View {
    @State private var showLogin = false
    @State private var showRegister = false
    @State private var isLoggedIn = false
    @StateObject var viewModel: RegisterViewModel = RegisterViewModel()
    
    @State private var path = AuthenticationNavigationPath()
    
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
                    NavigationStack(path: $path.path){
                        List {
                            NavigationLink("Se Connecter", value: "LoginView")
                            NavigationLink("S'inscrire", value: "RegistrationView")
                        }.navigationDestination(for: AuthenticationPathValue.self) { value in
                            switch value {
                            case .loggedIn:
                                LoginView(viewModel: LoginViewModel(), didLogin: $isLoggedIn)
                            case .registerName:
                                NameAgeRegistration(
                                    path: $path,
                                    surname: $viewModel.surname,
                                    name: $viewModel.name,
                                    username: $viewModel.username,
                                    age: $viewModel.age,
                                    errorMessage: $viewModel.errorMessage
                                ).environmentObject(self.viewModel)
                            case .registerOccupation:
                                OccupationChoiceView(
                                    path: $path,
                                    role: $viewModel.role
                                )
                            case .registerMailPassword:
                                MailPasswordRegistration(
                                    path: $path,
                                    email: $viewModel.email,
                                    password: $viewModel.password,
                                    isRegisteredComplete: $viewModel.isRegisteredComplete,
                                    errorMessage: $viewModel.errorMessage
                                )
                            case .registerPicture:
                                PicturesRegistration(
                                    path: $path
                                )
                            }
//                            switch value {
//                            case "LoginView":
//                                LoginView(viewModel: LoginViewModel(), didLogin: $isLoggedIn)
//                            case "RegistrationView":
//                                NameAgeRegistration(
//                                    path: $path
//                                ).environmentObject(self.viewModel)
//                            default:
//                                Text("Unknown View")
//                            }
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxHeight: .infinity)
    }
}

enum AuthenticationPathValue: Hashable {
    case loggedIn, registerName, registerOccupation, registerMailPassword, registerPicture
}

@Observable
class AuthenticationNavigationPath {
    var path = NavigationPath()
    
    func navigate(to value: AuthenticationPathValue) {
        path.append(value)
    }
    
    func back() {
        path.removeLast()
    }
    
    func popToFirst() {
        path = .init()
    }
}

#Preview {
    AuthenticationView()
}


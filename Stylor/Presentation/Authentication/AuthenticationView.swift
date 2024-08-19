import SwiftUI

struct AuthenticationView: View {
    @StateObject var viewModel: RegisterViewModel = RegisterViewModel()

    @State private var authPathStore = AuthenticationNavigationPathStore()

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Divider()
            Text("🎨🪡🦹🏻").font(.system(size: 70))
            Divider()
            Spacer()
            NavigationStack(path: $authPathStore.path){
                List {
                    NavigationLink("Se Connecter", value: AuthenticationNavigationPathStore.PathValue.logIn)
                    NavigationLink("S'inscrire", value: AuthenticationNavigationPathStore.PathValue.registerName)
                }.navigationDestination(for: AuthenticationNavigationPathStore.PathValue.self) { value in
                    switch value {
                    case .logIn:
                        LoginView(viewModel: LoginViewModel())
                    case .registerName:
                        NameAgeRegistration(
                            surname: $viewModel.surname,
                            name: $viewModel.name,
                            username: $viewModel.username,
                            age: $viewModel.age,
                            errorMessage: $viewModel.errorMessage
                        )
                        .environment(authPathStore)
                    case .registerOccupation:
                        OccupationChoiceView(
                            role: $viewModel.role
                        )
                        .environment(authPathStore)
                    case .registerMailPassword:
                        MailPasswordRegistration(
                            email: $viewModel.email,
                            password: $viewModel.password,
                            isRegisteredComplete: $viewModel.isRegisteredComplete,
                            errorMessage: $viewModel.errorMessage
                        )
                        .environment(authPathStore)
                    case .registerPicture:
                        PicturesRegistration()
                            .environment(authPathStore)
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


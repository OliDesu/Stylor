import SwiftUI

struct AuthenticationView: View {
    @StateObject var viewModel: RegisterViewModel = RegisterViewModel()

    /*
     We initialize our pathStore here, since the NavigationStack is here.
     We pass it through as an environment value, which is fine since it
     is just a value and we do not risk to capture anything and cause
     memory leaks. It could also be passed as a Binding it works just fine.
     */
    @State private var authPathStore = AuthenticationNavigationPathStore()

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Divider()
            Text("🎨🪡🦹🏻").font(.system(size: 70))
            Divider()
            Spacer()
            NavigationStack(path: $authPathStore.path) {
                List {
                    NavigationLink("Se Connecter", value: AuthenticationNavigationPathStore.PathValue.logIn)
                    NavigationLink("S'inscrire", value: AuthenticationNavigationPathStore.PathValue.registerName)
                }.navigationDestination(for: AuthenticationNavigationPathStore.PathValue.self) { value in
                    switch value {
                    case .logIn:

                        // MARK: Login
                        LoginView(viewModel: LoginViewModel())
                    case .registerName:

                        // MARK: Register name & age
                        NameAgeRegistration(
                            surname: $viewModel.surname,
                            name: $viewModel.name,
                            username: $viewModel.username,
                            age: $viewModel.age,
                            errorMessage: $viewModel.errorMessage
                        )
                    case .registerOccupation:

                        // MARK: Register occupation
                        OccupationChoiceView(
                            role: $viewModel.role
                        )
                    case .registerMailPassword:

                        // MARK: register password
                        MailPasswordRegistration(
                            email: $viewModel.email,
                            password: $viewModel.password,
                            isRegisteredComplete: $viewModel.isRegisteredComplete,
                            errorMessage: $viewModel.errorMessage
                        )
                    case .registerPicture:
                        PicturesRegistration()
                    }
                }
            }
            .environment(authPathStore)
        }
        .padding()
        .frame(maxHeight: .infinity)
    }
}

// MARK: - Preview
#Preview {
    AuthenticationView()
}


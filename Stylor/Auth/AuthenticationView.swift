import SwiftUI

struct AuthenticationView: View {
    @State private var showLogin = false
    @State private var showRegister = false
    @State private var isLoggedIn = false
    @StateObject  var viewModel = RegisterViewModel()
    @State private var path = NavigationPath()

    var body: some View {
        VStack {
            if isLoggedIn {
                NavigationView {
                    MainTabView()
                }
            } else {
                VStack(alignment: .center) {
                    Group {
                        Text("🎨🪡🦹🏻").font(.system(size: 70))
                    }
                    Spacer()
                    Group {
                        Button(action: {
                            showLogin = true
                        }) {
                            Text("Se connecter").foregroundColor(.black)
                                .padding()
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity, minHeight: 52)
                                .cornerRadius(15)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.black)
                                }
                        }
                        .sheet(isPresented: $showLogin) {
                            LoginViewControllerWrapper(isLoggedIn: $isLoggedIn)
                        }
                    }
                    
                    Button(action: {
                        showRegister = true
                    }) {
                        
                            
                            NavigationLink(destination:NameAgeRegistration(path:$path)
                                .environmentObject(self.viewModel)) {
                                    Text(
                                        "Créer un compte"
                                    ).foregroundColor(
                                        .black
                                    )
                                    .padding()
                                    .font(
                                        .system(
                                            size: 16,
                                            weight: .semibold
                                        )
                                    )
                                    .frame(
                                        maxWidth: .infinity,
                                        minHeight: 52
                                    )
                                    .cornerRadius(
                                        15
                                    )
                                    .overlay {
                                        RoundedRectangle(
                                            cornerRadius: 15
                                        )
                                        .stroke(
                                            Color.black
                                        )
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}


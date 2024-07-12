import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    @State private var showRegister = false
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            if isLoggedIn {
                Text("Welcome to the Content View")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } else {
                VStack {
                    Button(action: {
                        showLogin = true
                    }) {
                        Text("Login")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showLogin) {
                        LoginViewControllerWrapper(isLoggedIn: $isLoggedIn)
                    }
                    
                    Button(action: {
                        showRegister = true
                    }) {
                        Text("Register")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showRegister) {
                        RegisterView()
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


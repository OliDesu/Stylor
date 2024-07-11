import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    @State private var showRegister = false
    
    var body: some View {
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
                LoginViewControllerWrapper()
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
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

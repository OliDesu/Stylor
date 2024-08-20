import SwiftUI

struct NameAgeRegistration: View {
    @Environment(AuthenticationNavigationPathStore.self) var authPathStore

    @Binding var surname: String
    @Binding var name: String
    @Binding var username: String
    @Binding var age: Date
    @Binding var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Prénom", text: $surname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Nom", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Nom d'utilisateur", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .padding()

            DatePicker("Date de naissance", selection: $age, displayedComponents: .date)
                .datePickerStyle(.compact)
                .padding()
            
            Button("Next") {
                authPathStore.navigate(to: .registerOccupation)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding() 
    }
}

#Preview {
    NameAgeRegistration(
        surname: .constant("surname"),
        name: .constant("name"),
        username: .constant("username"),
        age: .constant(Date()),
        errorMessage: .constant(nil)
    )
}


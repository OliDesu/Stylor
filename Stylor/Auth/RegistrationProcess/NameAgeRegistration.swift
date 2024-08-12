import SwiftUI

struct NameAgeRegistration: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
      
            TextField("Prénom", text: $viewModel.surname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Nom", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Nom d'utilisateur", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .padding()

            DatePicker("Date de naissance", selection: $viewModel.age, displayedComponents: .date)
                .datePickerStyle(.compact)
                .padding()


            NavigationLink(destination: OccupationChoiceView(path: $path).environmentObject(self.viewModel)) {
                Text("Next")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding() 
    }
}

#Preview {
    NameAgeRegistration(path: .constant(NavigationPath()))
        .environmentObject(RegisterViewModel())
}


import SwiftUI
import PhotosUI
import SwiftUI

struct PicturesRegistration: View {
    @State private var showImagePicker = false
    @State private var selectedImages: [UIImage] = []
    @Binding var path: AuthenticationNavigationPath
    let userService = UserApiService()

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(selectedImages, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                }
            }
            
            Button(action: {
                showImagePicker.toggle()
            }) {
                Text("Select Images")
            }
            
            Button(action: {
                if !selectedImages.isEmpty {
                    let imageApiService = ImageApiService(user:
                UserDataService.shared.getCurrentUser())  // Ensure the correct user instance is passed
                    imageApiService.uploadImages(images: selectedImages) { result in
                        switch result {
                        case .success(let urls):
                            var currentUser = UserDataService.shared.getCurrentUser();
                            currentUser.userPortfolioImages.append(contentsOf: urls)
                            UserDataService.shared.setCurrentUser(currentUser)
                            userService.updateUserImagesInDatabase()
                            path.popToFirst()
                        case .failure(let error):
                            print("Failed to upload images: \(error)")
                        }
                    }
                }
            }) {
                Text("Finish")
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(images: $selectedImages)  // This assumes you have a custom ImagePicker that can handle multiple images
        }
    }
    
    
}

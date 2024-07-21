//
//  PicturesRegistration.swift
//  Stylor
//
//  Created by Ali El Mufti on 19/07/2024.
//

import SwiftUI

struct PicturesRegistration: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var path: NavigationPath
    @StateObject private var imageService = ImageApiService(
        user: UserDataService.shared.getCurrentUser()!
    )
    @State private var selectedImage: [UIImage] = []
    @State private var showingImagePicker = false
    var body: some View {
        Text(
            "Select the pictures of your portfolio"
        )
        Spacer()
        VStack {
            if let selectedImage = selectedImage {
                Images(
                    uiImage: selectedImage
                )
                .resizable()
                .scaledToFit()
                .frame(
                    width: 200,
                    height: 200
                )
            }
            
            Button(
                "Select Image"
            ) {
                showingImagePicker = true
            }
            .sheet(
                isPresented: $showingImagePicker
            ) {
                ImagePicker(
                    image: $selectedImage
                )
            }
            
        }
        Button (
            "Finish"
        ){ if let image = selectedImage {
            imageService.updateUserProfileImage(
                image: image
            )
            path.removeLast(
                path.count
            )
        }
            if let errorMessage = viewModel.errorMessage {
                Text(
                    errorMessage
                )
                .foregroundColor(
                    .red
                )
                .padding()
            }
        }
    }
}

// ImagePicker is a custom UIViewControllerRepresentable for selecting images from the photo library
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(
            parent: ImagePicker
        ) {
            self.parent = parent
        }
        
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Environment(
        \.presentationMode
    ) var presentationMode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(
            parent: self
        )
    }
    
    func makeUIViewController(
        context: Context
    ) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: Context
    ) {
    }
        }
        
        
        
 

    #Preview {
        PicturesRegistration(
            path: .constant(
                NavigationPath()
            )
        )
        .environmentObject(
            RegisterViewModel()
        )
    }

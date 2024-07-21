//
//  ImageService.swift
//  Stylor
//
//  Created by Ali El Mufti on 20/07/2024.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

class ImageApiService: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    // Function to upload image to Firebase Storage
    func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        guard let userId = user.id else {
            completion(.failure(NSError(domain: "UserIDError", code: -1, userInfo: nil)))
            return
        }
        
        let storageRef = Storage.storage().reference().child("userPortfolioImages").child(userId).child(UUID().uuidString)
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "ImageConversionError", code: -1, userInfo: nil)))
            return
        }
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            storageRef.downloadURL { url, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let downloadURL = url?.absoluteString {
                    completion(.success(downloadURL))
                } else {
                    completion(.failure(NSError(domain: "URLRetrievalError", code: -1, userInfo: nil)))
                }
            }
        }
    }
    
    // Function to update user's profileImagesURLs array in Firestore
    func updateUserProfileImage(image: UIImage) {
        uploadImage(image: image) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let url):
                print(url)
                self.user.userPortfolioImages.append(url)
                print(user)
                self.updateUserImageInDatabase()
            case .failure(let error):
                print("Failed to upload image: \(error)")
            }
        }
    }
    
    // Function to update user in Firestore
    private func updateUserImageInDatabase() {
        guard let userId = user.id else { return }
        
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userId) // Use .document(userId) to get a DocumentReference
        
        userRef.updateData(["userPortfolioImages": self.user.userPortfolioImages]) { error in
            if let error = error {
                print("Error updating user: \(error)")
            } else {
                print("User successfully updated")
            }
        }
    }

}

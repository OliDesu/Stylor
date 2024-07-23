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
    
    func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {

        
        let storageRef = Storage.storage().reference().child("userPortfolioImages").child(user.id).child(UUID().uuidString)
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
    
    
    
    func uploadImages(images: [UIImage], completion: @escaping (Result<[String], Error>) -> Void) {
        let dispatchGroup = DispatchGroup()
        var urls: [String] = []
        var errors: [Error] = []
        
        for image in images {
            dispatchGroup.enter()
            uploadImage(image: image) { result in
                switch result {
                case .success(let url):
                    urls.append(url)
                case .failure(let error):
                    errors.append(error)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            if errors.isEmpty {
                completion(.success(urls))
            } else {
                completion(.failure(errors.first!))  // Return the first error for simplicity
            }
        }
    }
    
    private func updateUserImageInDatabase() {
        
        let db = Firestore.firestore()
        
        let userRef = db.collection("users").document(user.id)
        print(user)
        userRef.updateData(["userPortfolioImages": self.user.userPortfolioImages]) { error in
            if let error = error {
                print("Error updating user: \(error)")
            } else {
                print("User successfully updated")
            }
        }
    }
}

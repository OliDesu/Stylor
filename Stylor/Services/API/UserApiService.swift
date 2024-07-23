import Foundation
import Firebase
import FirebaseFirestore

// Define your User model

class UserApiService {
     let db = Firestore.firestore()

    public func addUser(user: User) {
        let userData: [String: Any] = [
            "id": user.id,
            "name": user.name,
            "surname": user.surname,
            "age": user.age,
            "userPortfolioImages": user.userPortfolioImages
        ]

        db.collection("users").document(user.id).setData(userData) { error in
            if let error = error {
                print("Error adding user: \(error)")
            } else {
                print("User added successfully")
            }
        }
    }
    
     func updateUserImagesInDatabase() {
        let user = UserDataService.shared.getCurrentUser()
         print(user)
        guard !user.userPortfolioImages.isEmpty else { return }
        if (user.userPortfolioImages.isEmpty) {
            return
        }
            let db = Firestore.firestore()
            let userRef = db.collection("users").document(user.id)
            
            userRef.updateData(["userPortfolioImages": user.userPortfolioImages]) { error in
                if let error = error {
                    print("Error updating user: \(error)")
                } else {
                    print("User successfully updated")
                }
            }
        }
    
}



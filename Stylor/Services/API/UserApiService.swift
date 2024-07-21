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

        db.collection("users").document().setData(userData) { error in
            if let error = error {
                print("Error adding user: \(error)")
            } else {
                print("User added successfully")
            }
        }
    }
}



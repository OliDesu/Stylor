import Foundation
import Firebase
import FirebaseFirestore

// Define your User model

class UserService {
     let db = Firestore.firestore()

    public func addUser(user: User) {
        let userData: [String: Any] = [
            "id": user.id,
            "name": user.name,
            "surname": user.surname,
            "age": user.age,
            "profileImagesURLs": user.profileImagesURLs
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



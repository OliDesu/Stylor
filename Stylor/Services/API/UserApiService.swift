import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
// Define your User model

class UserApiService {
     let db = Firestore.firestore()
    @Published var queryResultUsers: [User] = []

    public func addUser(user: User) {
        let userData: [String: Any] = [
            "id": user.id,
            "name": user.firstName,
            "surname": user.lastName,
            "role": user.role.rawValue,
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
    
    private func sync() {
        let user = UserDataService.shared.getCurrentUser()

        db.collection("users").document(user.id).getDocument { (document, error) in
                guard document != nil, error == nil else { return }
                do {
                    try UserDataService.shared.setCurrentUser(document!.data(as: User.self))
                } catch {
                    print("Sync error: \(error)")
                }
            }
        }
    
    func fetchUsers(with keyword: String) {
            db.collection("users").whereField("keywordsForLookup", arrayContains: keyword).getDocuments { querySnapshot, error in
                guard let documents = querySnapshot?.documents, error == nil else {
                    print("No documents")
                    return
                }
                self.queryResultUsers = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: User.self)
                }
                print(self.queryResultUsers)
            }
        }
    
}



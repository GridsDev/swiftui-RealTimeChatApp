//
//  DatabaseManager.swift
//  swiftui-RealTimeChatApp
//
//  Created by Grids Jivapong on 2/3/2564 BE.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
//    ใช้เพื่อทดสอบ
//    public func test() {
//        database.child("foo").setValue(["something": true])
//    }
    
//    public func insertUser(with user: ChatAppUser) {
//        database.child(user.emailAddress).setValue([
//            "first_name": user.firstName,
//            "last_name": user.lastName
//        ])
//    }
}

// MARK : - Account Management
extension DatabaseManager {
    public func userExists(with email: String,
                           completion: @escaping ((Bool) -> Void)) {
        database.child(email).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
    }
    /// insert new user to database
    public func insertUser(with user: ChatAppUser) {
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}



struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
//    let profilePictureUrl: String
    
}

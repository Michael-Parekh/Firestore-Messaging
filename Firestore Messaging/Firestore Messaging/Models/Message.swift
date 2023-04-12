//
//  Message.swift
//  Firestore Messaging
//
//  Created by Michael Parekh on 4/12/23.
//

import Foundation

// This is the structure that all messages we create must follow.
// => Conforms to the 'Identifiable' protocol so that each message can be uniquely identified using an ID.
// => Conforms to the 'Codable' protocol so that each message can be encoded/decoded to and from the Firestore model.
struct Message: Identifiable, Codable {
    var id: String
    var text: String
    // Senders will have a 'received' value of false and recipients will have a 'received' value of true.
    var received: Bool
    var timestamp: Date
}

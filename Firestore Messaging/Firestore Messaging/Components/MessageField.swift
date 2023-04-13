//
//  MessageField.swift
//  Firestore Messaging
//
//  Created by Michael Parekh on 4/13/23.
//

import SwiftUI

struct MessageField: View {
    // String that changes when the user inputs into the 'MessageField'.
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
            
            Button {
                print("Message sent")
                // Reset the 'message' state to an empty string once it has been sent.
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
    }
}

// Create a custom text field since the built-in SwiftUI text field is difficult to work with.
struct CustomTextField: View {
    var placeholder: Text
    // Make 'text' a binding variable to connect the value to the 'MessageField' view that displays and changes it.
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

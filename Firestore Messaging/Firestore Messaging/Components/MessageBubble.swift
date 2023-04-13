//
//  MessageBubble.swift
//  Firestore Messaging
//
//  Created by Michael Parekh on 4/12/23.
//

import SwiftUI

struct MessageBubble: View {
    // Accepts an argument of custom type 'Message'.
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        // The alignment should be leading if the user received the message (left side) and trailing if the user sent the message (right side).
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    // The background color also depends on whether the user is the sender or recipient of the message (sender = Peach and recipient = Gray).
                    .background(message.received ? Color("Gray") : Color("Peach"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                // Show the timestamp when a user taps on the message bubble.
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "This is a test message sent using Firestore's integration with Swift.", received: false, timestamp: Date()))
    }
}

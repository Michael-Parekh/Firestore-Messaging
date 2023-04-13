//
//  ContentView.swift
//  Firestore Messaging
//
//  Created by Michael Parekh on 4/12/23.
//

import SwiftUI

struct ContentView: View {
    // Temporary dummy data.
    var messageArray = ["Hey, what's up?", "Nothing much. How are you doing?", "Great! School has been busy but I am almost ready to graduate."]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubble(message: Message(id: "12345", text: text, received: true, timestamp: Date()))
                    }
                }
                .padding()
                .background(.white)
                // Use our custom 'cornerRadius' extension.
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            
            MessageField()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

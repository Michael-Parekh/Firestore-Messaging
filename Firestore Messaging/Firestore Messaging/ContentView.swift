//
//  ContentView.swift
//  Firestore Messaging
//
//  Created by Michael Parekh on 4/12/23.
//

import SwiftUI

struct ContentView: View {
    // Utilize a 'StateObject' so that this view updates whenever new messages are created.
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                // Utilize 'ScrollViewReader' and 'scrollTo' to scroll to the bottom of the conversation whenever a new message is sent.
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    // Use our custom 'cornerRadius' extension.
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: messagesManager.lastMessageId) { id in
                        withAnimation {
                            // When the 'lastMessageId' changes, scroll to the bottom of the conversation.
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("Peach"))
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

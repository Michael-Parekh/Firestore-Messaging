//
//  TitleRow.swift
//  Firestore Messaging
//
//  Created by Michael Parekh on 4/12/23.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://drive.google.com/uc?export=view&id=1dnymYTUnMGjmTRJXdXLLA7A0BADQOV17")
    var name = "Michael Parekh"
    
    var body: some View {
        HStack(spacing: 20) {
            // Since we are loading an image from the internet, use 'AsyncImage'.
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // 'phone.fill' is an SF Symbols designated icon.
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Peach"))
    }
}

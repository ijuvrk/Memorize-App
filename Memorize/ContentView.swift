//
//  ContentView.swift
//  Memorize
//
//  Created by Ijaz Ahmad on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "😈", "🕷️"]
    
    var body: some View {
        
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        
        .foregroundStyle(.teal)
        .padding()
    }
}

struct CardView: View {
    
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base
                    .foregroundStyle(.white)
                base
                    .strokeBorder(lineWidth: 2)
                
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




















#Preview {
    ContentView()
}

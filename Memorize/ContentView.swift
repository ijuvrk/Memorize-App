//
//  ContentView.swift
//  Memorize
//
//  Created by Ijaz Ahmad on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        
        .foregroundStyle(.teal)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = true
    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base
                    .foregroundStyle(.white)
                base
                    .strokeBorder(lineWidth: 2)
                
                Text("👻")
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

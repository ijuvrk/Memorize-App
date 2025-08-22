//
//  ContentView.swift
//  Memorize
//
//  Created by Ijaz Ahmad on 20/11/24.
//

import SwiftUI
    
struct ContentView: View {
    let emojis = ["👻", "🎃", "😈", "🕷️", "🕸️", "😧", "😱", "🧸", "👿", "🏴‍☠️", "☠️", "🧟"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.teal)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {       //by offset - label callers use
        Button(action: {
            cardCount += offset
            }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
}

struct CardView: View {
    
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {                                     //can only be inside HStack or sm
                base
                    .foregroundStyle(.white)
                base
                    .strokeBorder(lineWidth: 2)
                
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)                          //when faceup text is visible, base not. and                                                        viceversa
            base.fill().opacity(isFaceUp ? 0 : 1)
    
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




















#Preview {
    ContentView()
}

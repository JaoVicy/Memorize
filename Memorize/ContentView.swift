//
//  ContentView.swift
//  Memorize
//
//  Created by João Víctor Benetti Filipim on 28/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                CardView()
            }
        }
        .padding()
        .foregroundColor(Color.cyan)
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    
    var body: some View {
        ZStack() {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                
                Text("🦑")
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

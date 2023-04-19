//
//  ContentView.swift
//  MobileML
//
//  Created by Link Chen on 2023/4/14.
//

import SwiftUI

struct ContentView: View {
    let init_cards = [init_clf_cards, init_det_cards, init_est_cards]
    
    // Parameter for init cards
    @Binding var init_type: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Swiper for cards
            TabView {
                let cards = init_cards[init_type]()
                ForEach(cards) { card in
                    CardView(card: card)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .ignoresSafeArea()
            
            // Back button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .background(.black)
                    .clipShape(Circle())
            }
            // Keep it accessible
            .accessibilityLabel(Text("Back"))
            .position(x: UIScreen.main.bounds.maxX - 40, y: 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(init_type: .constant(0))
    }
}

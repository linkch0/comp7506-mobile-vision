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
        Button("Homepage") {
            presentationMode.wrappedValue.dismiss()
        }
        // Swiper for cards
        TabView {
            let cards = init_cards[init_type]()
            ForEach(cards) { card in
                CardView(card: card)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

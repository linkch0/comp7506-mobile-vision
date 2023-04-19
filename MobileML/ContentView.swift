//
//  ContentView.swift
//  MobileML
//
//  Created by Link Chen on 2023/4/14.
//

import SwiftUI

struct ContentView: View {
//    let cards = init_cards()
    var cards_init = [init_clf_cards, init_det_cards, init_est_cards]
    @Binding var init_type: Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button("Homepage") {
            presentationMode.wrappedValue.dismiss()
        }
        // Swiper for cards
        TabView {
            var cards = cards_init[init_type]()
            ForEach(cards) { card in
                CardView(card: card)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(cards: init_cards())
//    }
//}

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
        HStack {
            Spacer()
            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                    Circle()
                        .fill(Color(.secondarySystemBackground))
                        .frame(width: 30, height: 30) // You can make this whatever size, but keep UX in mind.
                        .overlay(
                            Image(systemName: "xmark")
                                .font(.system(size: 15, weight: .bold, design: .rounded)) // This should be less than the frame of the circle
                                .foregroundColor(.secondary)
                        )
                })
                .buttonStyle(PlainButtonStyle()) // This gives it no designs on idle, but can change on input
                .accessibilityLabel(Text("Close")) // Keep it accessible
                .padding(.horizontal, 25)
                .padding(.top, 20)
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

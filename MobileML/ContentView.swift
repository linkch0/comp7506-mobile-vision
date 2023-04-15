//
//  ContentView.swift
//  MobileML
//
//  Created by Link Chen on 2023/4/14.
//

import SwiftUI

let model_name = "yolo"



struct ContentView: View {
    let cards = init_cards()
    var body: some View {
        // Swiper for cards
        TabView {
            ForEach(cards) { card in
//                GeometryReader { proxy in
//                    ZStack{
//                        let width = proxy.size.width
//                        let height = proxy.size.height
//                        RoundedRectangle(cornerRadius: 16)
//                            .fill(Color.white)
//                            .frame(width: width, height: height)
//                            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 10)
//                        CardView(card: card)
//                    }
//                }
                CardView(card: card)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  MobileML
//
//  Created by Link Chen on 2023/4/14.
//

import SwiftUI

struct ContentView: View {
    // Object Detection, Pose Estimation, Image Classfication
    let init_cards = [yolo_card, posenet_card, mobilenet_card]
    
    // Parameter for init cards
    @Binding var init_type: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Card View
            let card = init_cards[init_type]()
            CardView(card: card)
            
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
        // Hide the status bar
        .statusBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(init_type: .constant(0))
    }
}

//
//  Card.swift
//  MobileML
//
//  Created by Link Chen on 2023/4/14.
//

import SwiftUI


struct JustifiedTextView: UIViewRepresentable {
    // Jusify text in SwiftUI
    let text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 20)
        textView.isEditable = false
        // Set alignment to justified
        textView.textAlignment = .justified
//        textView.layer.borderWidth = 2
//        textView.layer.cornerRadius = 8
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}


struct CardView: View {
    let card: Card
    @State private var isPresented = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(card.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            card.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            Text(card.subtitle)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)
            
//            Text(card.desc)
//                .padding(.top, 5)
            JustifiedTextView(text: card.desc)
                .frame(height: 200)
            
            Button(action : {
                self.isPresented = true
            }) {
                Text(card.btnTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $isPresented){
                StoryboardWrapper(storyboardName: card.board)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            
            // This should be the last, put everything to the top
            Spacer()
        }
        .padding()
    }
}

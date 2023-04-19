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
        // textView.layer.borderWidth = 2
        // textView.layer.cornerRadius = 8
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}


struct CardView: View {
    let card: Card
    @State private var isPresented = false
    @State private var imgSize: CGSize = .zero
    
    
    var body: some View {
        GeometryReader { reader in
            // Get full screen size
            let w = reader.size.width
            let h = reader.size.height
            
            VStack {
                card.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: w/2, height: h/2)
                    .ignoresSafeArea()
                    .padding(.bottom, -60)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(card.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(card.subtitle)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    JustifiedTextView(text: card.desc)
                        .frame(height: 250)
                    
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
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: yolo_card())
    }
}

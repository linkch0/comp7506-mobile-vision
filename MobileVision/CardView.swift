//
//  CardView.swift
//  MobileVision
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
    // Object Detection, Pose Estimation, Image Classfication
    let init_cards = [yolo_card, posenet_card, mobilenet_card]
    @State private var isPresented = false
    @State private var imgSize: CGSize = .zero
    
    // Parameter for init cards
    @Binding var init_type: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Init card
            let card = init_cards[init_type]()
            VStack {
                // Swiper for cards
                TabView {
                    ForEach(card.images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: UIScreen.main.bounds.height / 2)
                            .padding(.bottom, -60)
                            .ignoresSafeArea()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .ignoresSafeArea()
                
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(init_type: .constant(0))
    }
}

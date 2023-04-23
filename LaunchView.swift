//
//  LaunchView.swift
//  MobileVision
//
//  Created by Link Chen on 2023/4/23.
//

import SwiftUI

struct LaunchView: View {
    @Binding var showHomeView: Bool
    
    var body: some View {
        VStack {
            Text("COMP7506 2A Group 36")
                .font(.title)
                .bold()
                .padding(.bottom, 10)
            Text("CHEN Lu, WANG Junheng")
                .font(.title2)
            Text("WANG Yifei, LIU Wanting")
                .font(.title2)
                .padding(.bottom, 10)
            
            // App Name
            Text("Mobile Vision")
                .font(.system(size: 36))
                .bold()
                .padding(.bottom, -10)
            
            // App Logo
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Spacer()
                Button(action: {
                    showHomeView = true
                }, label: {
                    Text("Skip")
                })
                .padding(.trailing, 30)
                .buttonStyle(.bordered)
                .foregroundColor(.black)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showHomeView = true
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showHomeView: .constant(false))
    }
}

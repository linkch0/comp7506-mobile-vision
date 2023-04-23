//
//  MobileVisionApp.swift
//  MobileVision
//
//  Created by Link Chen on 2023/4/14.
//

import SwiftUI

@main
struct MobileVisionApp: App {
    @State var showHomeView = false
    
    var body: some Scene {
        WindowGroup {
            if !showHomeView {
                LaunchView(showHomeView: $showHomeView)
            } else {
                HomeContentView()
            }
        }
    }
}

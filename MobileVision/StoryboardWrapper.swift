//
//  StoryboardViewControllerWrapper.swift
//  MobileVision
//
//  Created by Link Chen on 2023/4/15.
//

import SwiftUI

struct StoryboardWrapper: UIViewControllerRepresentable {
    let storyboardName: String

    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No-op
    }
}

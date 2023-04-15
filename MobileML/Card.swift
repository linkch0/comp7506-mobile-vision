//
//  Card.swift
//  MobileML
//
//  Created by Link Chen on 2023/4/14.
//

import SwiftUI

public struct Card: Identifiable {
    public var id = UUID()
    var image: Image
    var title: String
    var subtitle: String
    // Description of the model
    var desc: String
    // Button title
    var btnTitle: String
    var board: String
}


public func init_cards() -> [Card] {
    // Initialize the data of model cards
    var cards: [Card] = []
    cards.append(yolo_card())
    cards.append(posenet_card())
    
    return cards
}


func yolo_card() -> Card {
    let image = Image("yolo")
    let title = "Object Detection"
    let subtitle = "YOLO"
    let desc = "Object detection is a computer vision technique that involves identifying and localizing objects in images or videos. YOLO (You Only Look Once) is a popular algorithm for object detection."
    let btnTitle = "Open Camera"
    let board = "YOLO"
    
    return Card(image: image, title: title, subtitle: subtitle,
                desc: desc, btnTitle: btnTitle, board: board)
    
}


func posenet_card() -> Card {
    let image = Image("pose")
    let title = "Pose Estimation"
    let subtitle = "PoseNet"
    let desc = "PoseNet is an deep learning model for estimating human pose in real time from a single camera image or video. It was developed by researchers at Google. PoseNet uses a convolutional neural network (CNN) to estimate the location of key body joints (such as the elbows, wrists, knees, and ankles) in the image."
    let btnTitle = "Open Camera"
    let board = "Pose"
    
    return Card(image: image, title: title, subtitle: subtitle,
                desc: desc, btnTitle: btnTitle, board: board)
    
}

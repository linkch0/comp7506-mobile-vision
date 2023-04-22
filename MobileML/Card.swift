//
//  Card.swift
//  MobileML
//
//  Created by Link Chen on 2023/4/14.
//

import SwiftUI

public struct Card: Identifiable {
    public var id = UUID()
    // Image name array for swiper
    var images: [String]
    var title: String
    var subtitle: String
    // Description of the model
    var desc: String
    // Button title
    var btnTitle: String
    var board: String
}

func yolo_card() -> Card {
    let images = ["y0", "y1", "y2"]
    let title = "Object Detection"
    let subtitle = "YOLO"
    let desc = "Object detection is a computer vision technique that involves identifying and localizing objects in images or videos. YOLO (You Only Look Once) is a popular algorithm for object detection. Click the button to experience a real-time object detection demo using YOLOv3."
    let btnTitle = "Open Camera"
    let board = "YOLO"
    
    return Card(images: images, title: title, subtitle: subtitle,
                desc: desc, btnTitle: btnTitle, board: board)
}


func posenet_card() -> Card {
    let images = ["p1", "p2", "p0"]
    let title = "Pose Estimation"
    let subtitle = "PoseNet"
    let desc = "PoseNet is an deep learning model for estimating human pose in real time from a single camera image or video. It was developed by researchers at Google. PoseNet uses a convolutional neural network (CNN) to estimate the location of key body joints (such as the elbows, wrists, knees, and ankles) in the image."
    let btnTitle = "Open Camera"
    let board = "Pose"
    
    return Card(images: images, title: title, subtitle: subtitle,
                desc: desc, btnTitle: btnTitle, board: board)
}

func mobilenet_card() -> Card {
    let images = ["m1", "m0"]
    let title = "Image Classification"
    let subtitle = "MobileNet"
    let desc = "Image classification task annotates the most prominent objects in an image. Here using MobileNet, an open source image classifier model proposed by Google in 2017. It is a lightweight neural network focused on mobile devices and could recognize around 1,000 different categories."
    let btnTitle = "Open Camera"
    let board = "MobileNet"
    
    return Card(images: images, title: title, subtitle: subtitle,
                desc: desc, btnTitle: btnTitle, board: board)
}

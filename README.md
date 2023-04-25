#  COMP7506 2A Group Project

Group36, Members: [CHEN Lu](https://github.com/HeroLink), [WANG Junheng](https://github.com/Caffretro), [WANG Yifei](https://github.com/WaangYifei), [LIU Wanting](https://github.com/wantine)

If you have any question, please reach out to [link@connect.hku.hk](mailto:link@connect.hku.hk).

# Build

This application is build by Xcode version 14.3 (14E222b) on macOS 13.3.1 (22E261).

Before building this application, make sure you download [YOLOv3Tiny](https://ml-assets.apple.com/coreml/models/Image/ObjectDetection/YOLOv3Tiny/YOLOv3Tiny.mlmodel), [PoseNetMobileNet100S16FP16](https://ml-assets.apple.com/coreml/models/Image/PoseEstimation/PoseNet/PoseNetMobileNet100S8FP16.mlmodel), and [MobileNetV2](https://ml-assets.apple.com/coreml/models/Image/ImageClassification/MobileNetV2/MobileNetV2.mlmodel). **Clicking links will directly download**. 

Drag each download to each model directory:

1. YOLOv3Tiny: `./MobileVision/YOLO`

2. PoseNetMobileNet100S16FP16: `./MobileVision/PoseNet/Model`

3. MobileNetV2: `./MobileVision/MobileNet/Image Predictor`

If you wish to use different models, you can download from [here](https://developer.apple.com/machine-learning/models/). Do remember to change the model name corresponding to your downloads:

1. YOLO: Line24 in [`./MobileVision/YOLO/VisionObjectRecognitionViewController.swift`](./MobileVision/YOLO/VisionObjectRecognitionViewController.swift)

2. PoseNet: Line44 in [`./MobileVision/PoseNet/Model/PoseNet.swift`](./MobileVision/PoseNet/Model/PoseNet.swift)

3. MobileNet: Line27 in [`./MobileVision/MobileNet/Image%20Predictor/ImagePredictor.swift`](./MobileVision/MobileNet/Image%20Predictor/ImagePredictor.swift)

After importing the models, build this project in Xcode on a physical iOS device because it has to use the camera.

# Acknowledgements

1. Object Detection example is modified from [Apple 'Recognizing Objects in Live Capture'](https://developer.apple.com/documentation/vision/recognizing_objects_in_live_capture).

2. Pose Estimation example is modified from [Apple 'Detecting Human Body Poses in an Image'](https://developer.apple.com/documentation/coreml/detecting_human_body_poses_in_an_image).

3. Image Classification example is modified from [Apple 'Classifying Images with Vision and Core ML'](https://developer.apple.com/documentation/vision/classifying_images_with_vision_and_core_ml).


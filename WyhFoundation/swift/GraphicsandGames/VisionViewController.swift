//
//  VisionViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//




import UIKit
enum VisionViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n应用计算机视觉算法对输入的图像和视频执行各种任务。。"
        case .topics:
            return "VNImageRequestHandler--处理与单个图像相关的一个或多个图像分析请求的对象。\nVNImageBasedRequest--用于图像分析的抽象超类请求聚焦于图像的特定部分。\nVNStatefulRequest--一种抽象的请求类型，随着时间的推移构建条件的证据。\nVNClassifyImageRequest--对图像进行分类的请求。\nVNFeaturePrintObservation--观察结果由VNGenerateImageFeaturePrintRequest。\nVNGenerateImageFeaturePrintRequest--一种基于图像的请求，从图像中生成特征打印。\nVNRequest--用于分析请求的抽象超类。\nVNObservation--分析结果的抽象超类。\nVNSequenceRequestHandler--处理序列中每一帧的图像分析请求的对象。\nVNGenerateAttentionBasedSaliencyImageRequest--生成一张热图，识别图像中最有可能引起注意的部分。\nVNGenerateObjectnessBasedSaliencyImageRequest--生成一个热图，识别图像中最有可能代表物体的部分。\nVNSaliencyImageObservation--在图像中包含重要区域的灰度热图的观测结果。\nVNTrackingRequest--图像分析的抽象超类要求在多个图像或视频帧中跟踪独特的特征。\nVNTrackRectangleRequest--一种图像分析请求，用于在多个图像或视频帧中跟踪先前识别的矩形物体的运动。\nVNTrackObjectRequest--一种图像分析请求，用于在多个图像或视频帧中跟踪先前识别的任意物体的运动。\nVNDetectedObjectObservation--提供被检测图像特征的位置和范围的图像分析结果。\nVNDetectRectanglesRequest--在图像中找到投影矩形区域的图像分析请求。\nVNRectangleObservation--关于由图像分析请求检测到的投影矩形区域的信息。\nVNDetectFaceRectanglesRequest--在图像中查找人脸的图像分析请求。\nVNDetectFaceLandmarksRequest--在图像中找到面部特征(如眼睛和嘴)的图像分析请求。\nVNDetectFaceCaptureQualityRequest--一种生成浮点数的请求，表示照片中给定人脸的捕获质量。\nVNFaceObservation--由图像分析请求检测到的人脸或面部特征信息。\nVNDetectHumanRectanglesRequest--一种图像分析请求，它在图像中找到包含人的矩形区域。\nVNDetectHumanBodyPoseRequest--检测人体姿势的请求。\nVNDetectHumanHandPoseRequest--检测人手姿势的请求。\nVNRecognizedPointsObservation--提供分析所识别的点的观察。\nVNHumanBodyPoseObservation--一个观察提供了身体点的分析认可。\nVNHumanHandPoseObservation--观察提供了分析识别的指针。\nVNPoint--表示图像中单个二维点的不可变对象。\nVNDetectedPoint--表示图像中归一化点以及置信值的对象。\nVNRecognizedPoint--表示图像中标准化点、标识符标签和置信值的对象。\nVNRecognizedPointKey--所有可识别的点键的数据类型。\nVNRecognizedPointGroupKey--所有可识别点组键的数据类型。\nVNDetectTrajectoriesRequest--一种检测形状沿抛物线路径移动的轨迹的请求。\nVNTrajectoryObservation--描述探测到的轨迹的观测。\nVNDetectContoursRequest--一种检测图像边缘轮廓的请求。\nVNContoursObservation--提供图像中所有被检测轮廓的一种观测方法。\nVNContour--表示图像中已检测轮廓的类。\nVNGenerateOpticalFlowRequest--为目标图像中的每个像素生成方向变化矢量的对象。\nVNRecognizeAnimalsRequest--在图像中识别各种动物的请求。\nVNBarcodeSymbology--远景框架支持的符号。\nVNDetectBarcodesRequest--一种图像分析请求，用于查找和识别图像中的条形码。\nVNBarcodeObservation--由图像分析请求检测到的条形码信息。\nVNDetectTextRectanglesRequest--在图像中找到可见文本区域的图像分析请求。\nVNTextObservation--关于由图像分析请求检测到的文本区域的信息。\nVNRecognizeTextRequest--一种图像分析请求，用于查找和识别图像中的文本。\nVNRecognizedTextObservation--一种检测和识别图像中文本区域的请求。\nVNRequestProgressProviding--在Vision中提供长时间运行任务的进度信息的协议。\nVNDetectHorizonRequest--确定图像中水平角度的图像分析请求。\nVNHorizonObservation--由图像分析请求检测的地平角信息。\nVNTargetedImageRequest--图像分析的抽象超类要求对已处理的图像和副图像进行操作。\nVNImageRegistrationRequest--图像分析的抽象超类请求根据图像的内容对齐图像。\nVNImageAlignmentObservation--图像分析结果的抽象超类，描述两幅图像的相对对齐。门外语\nVNTranslationalImageRegistrationRequest--一种图像分析请求，用于确定对齐两幅图像内容所需的仿射变换。\nVNImageTranslationAlignmentObservation--由图像对齐请求产生的仿射变换信息。\nVNHomographicImageRegistrationRequest--一种图像分析请求，用于确定对齐两幅图像内容所需的透视翘曲矩阵。\nVNImageHomographicAlignmentObservation--由图像对齐请求产生的透视扭曲信息。\nVNRecognizedObjectObservation--一种带有分类标签数组的被检测物体观测，该分类标签对被识别物体进行分类。\nVNCoreMLRequest--使用Core ML模型处理图像的图像分析请求。\nVNClassificationObservation--由图像分析请求产生的分类信息。\nVNPixelBufferObservation--由Core ML图像分析请求产生的输出图像。\nVNCoreMLFeatureValueObservation--由Core ML图像分析请求生成的键值信息集合。\nVNGeometryUtils--实用程序方法来确定各种视觉类型的几何图形。\nVNVideoProcessor--对视频内容进行离线分析的对象。\nVNCircle--圆心用圆心和半径表示的不可变的二维圆\nVNVector--一个不可变的二维矢量，由它的x轴和y轴投影表示。"
        case .demo:
            return "Click here to example"
        }
    }
}
class VisionViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [VisionViewControllerType.overview, VisionViewControllerType.topics, VisionViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? VisionViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? VisionViewControllerType ?? VisionViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = VisionDemoViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
            }
               
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


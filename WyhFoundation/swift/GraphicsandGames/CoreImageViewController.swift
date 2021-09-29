//
//  CoreImageViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/27.
//






import UIKit
enum CoreImageViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS5+\n使用内置或自定义过滤器来处理静态和视频图像。"
        case .topics:
            return "CIImage--由核心图像过滤器处理或产生的图像的表示形式。\nCIFilter--一种图像处理器，通过操作一个或多个输入图像或生成新的图像数据来产生图像。\nCIContext--用于绘制图像处理结果和执行图像分析的评估上下文。\nBasic Data Types--用于应用或创建图像过滤器的颜色、矢量和其他类型。\nMethods and Protocols for Filter Creation--创建核心图像过滤器，将其属性暴露为属性。\nCIKernel--一个基于gpu的图像处理程序，用于创建自定义核心图像过滤器。\nCIColorKernel--一个基于gpu的图像处理程序，只处理图像中的颜色信息，用于创建自定义核心图像过滤器。\nCIWarpKernel--一种基于gpu的图像处理程序，仅处理图像中的几何信息，用于创建自定义核心图像过滤器。\nCIBlendKernel--一个基于gpu的图像处理程序，为混合两个图像进行了优化。\nCISampler--一种对象，它检索像素样本以由滤波器核进行处理。\nCIImageProcessorKernel--扩展抽象类以创建可与Core image工作流集成的自定义图像处理器。\nCIImageProcessorInput--在自定义图像处理器中使用的图像数据和信息的容器。\nCIImageProcessorOutput--一种容器，用于写入由自定义图像处理器产生的图像数据和信息。\nCIRenderDestination--用于配置呈现任务目标的所有属性和发出异步呈现任务的规范。\nCIRenderInfo--渲染任务的时间、通过和像素处理的封装。\nCIRenderTask--与CIRenderDestination一起发布的一个渲染任务\nCIImageAccumulator--用于管理用于绘画或流体模拟等任务的基于反馈的图像处理的对象。\nCIBarcodeDescriptor--表示机器可读代码属性的抽象基类。\nCIQRCodeDescriptor--CIBarcodeDescriptor的一个具体子类，它表示一个正方形的QR码符号。\nCIAztecCodeDescriptor--CIBarcodeDescriptor的一个具体子类，表示阿兹特克代码符号。\nCIPDF417CodeDescriptor--CIBarcodeDescriptor的一个具体子类，表示一个PDF 417符号。\nCIDataMatrixCodeDescriptor--CIBarcodeDescriptor的一个具体子类，它表示一个数据矩阵代码符号。\nCIDetector--在静态图像或视频中识别显著特征(如面孔和条形码)的图像处理器。\nCIFeature--表示图像中检测到的显著特征的对象的抽象超类。\nCIFaceFeature--在静止或视频图像中检测到的关于人脸的信息。\nCIRectangleFeature--关于在静止或视频图像中检测到的矩形区域的信息。\nCITextFeature--关于可能包含在静止或视频图像中检测到的文本的区域的信息。\nCIQRCodeFeature--关于在静止或视频图像中检测到的快速响应代码(一种2D条码)的信息。\nCIFilterConstructor--生成CIFilter实例的对象的通用接口。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreImageViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreImageViewControllerType.overview, CoreImageViewControllerType.topics, CoreImageViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreImageViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreImageViewControllerType ?? CoreImageViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreImageDemoViewController()
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


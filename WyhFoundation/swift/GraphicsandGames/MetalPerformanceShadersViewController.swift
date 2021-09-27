//
//  MetalPerformanceShadersViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/26.
//







import UIKit
enum MetalPerformanceShadersViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS9+\n优化图形和计算性能的内核是为每个金属GPU家族的独特特性进行微调。"
        case .topics:
            return "Image Filters--应用高性能滤波器，并从图像中提取统计和直方图数据。\nMPSImage--用于卷积神经网络的一种纹理，可能有四个以上的通道。\nMPSTemporaryImage--一种用于卷积神经网络的纹理，用于存储可迅速使用和丢弃的瞬态数据。\nObjects that Simplify the Creation of Neural Networks--使用过滤器、图像和状态节点网络简化神经网络的创建。\nConvolutional Neural Network Kernels--构建具有层次的神经网络。\nRecurrent Neural Networks--创建递归神经网络。\nMatrices and Vectors--解方程组，分解矩阵，矩阵和向量相乘。\nMPSRayIntersector--在射线和几何图形之间执行交集测试的核函数。\nMPSAccelerationStructureGroup--一组加速度结构。\nMPSInstanceAccelerationStructure--建立在其他加速度结构实例之上的加速度结构。\nMPSTriangleAccelerationStructure--在三角形上建造的加速结构。\nMPSAccelerationStructure--在几何体上建立并用于加速光线追踪的数据结构的基类。\nMPSKernel--金属性能着色器内核的标准接口。\nNSKeyedArchiver--一种编码器，将对象的数据存储到由键引用的归档文件中。\nMPSKeyedUnarchiver--一个支持金属性能着色器内核解码的密钥归档程序。\nMPSDeviceProvider--一个接口，允许为未归档的对象设置金属设备。\nMPSImageNormalizedHistogram--计算图像的归一化直方图的滤波器。\nMPSNNCropAndResizeBilinear--一种裁剪和双线性调整大小的过滤器。\nMPSNNResizeBilinear--双线性调整大小的滤波器。\nMPSStateResourceList--一个对象的接口，为金属性能着色器状态容器定义资源。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class MetalPerformanceShadersViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MetalPerformanceShadersViewControllerType.overview, MetalPerformanceShadersViewControllerType.topics, MetalPerformanceShadersViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MetalPerformanceShadersViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MetalPerformanceShadersViewControllerType ?? MetalPerformanceShadersViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MetalPerformanceShadersDemoViewController()
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


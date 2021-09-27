//
//  MetalViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/27.
//







import UIKit
enum MetalViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n使用图形处理器渲染高级3D图形并执行数据并行计算。"
        case .topics:
            return "MTLDevice--用于绘制图形或进行并行计算的GPU的金属接口。\nMTLCommandQueue--为GPU执行组织命令缓冲区的队列。\nMTLCommandBuffer--一种容器，用于存储供GPU执行的编码命令。\nMTLCommandEncoder--一种将GPU命令写入命令缓冲区的编码器。\nCounter Sampling--通过测量应用程序中的GPU统计数据来提高性能。\nMTLComputePipelineDescriptor--用于自定义新计算管道状态对象的编译的对象。\nMTLComputePipelineState--包含已编译计算管道的对象。\nMTLComputePassDescriptor--用于创建计算命令编码器的计算通道的配置。\nMTLComputeCommandEncoder--在计算通道中对命令进行编码的对象。\nRender Pipelines--指定图形原语应该如何呈现。\nMTLRenderPassDescriptor--一组保存渲染通道结果的渲染目标。\nMTLRenderCommandEncoder--用于为渲染通道编码命令的对象。\nMTLParallelRenderCommandEncoder--一个对象，它将一个单独的渲染通道分割开来，以便可以从多个线程同时对其进行编码。。\nModel I/O--指定纹理中与图形处理相关的精确位置。\nMTLIntersectionFunctionTable--一个交叉函数表，Metal调用它来执行射线跟踪交叉测试。\nMTLIntersectionFunctionTableDescriptor--如何创建交集函数表的规范。\nMTLIntersectionFunctionDescriptor--对执行交集测试的交集函数的描述。\nMTLAccelerationStructureCommandEncoder--一个对象，用于编码构建或改装加速结构的命令。\nMTLIntersectionFunctionSignature--用于指定不同类型的自定义交集函数的常量。\nAcceleration Structures--组织模型数据以允许图形处理器加速的射线与模型的交集。\nDrawable Objects--从绘制对象中获取绘制纹理。\nLibraries--将你的着色器组织到库中。\nFunctions--检索有关呈现和计算函数的信息。\nMTLResource--GPU可访问的内存分配。\nMTLBlitCommandEncoder--一种对内存复制、过滤和填充命令进行编码的编码器。\nMTLBlitPassDescriptor--一种blit通道的配置，用于创建blit命令编码器。\nMTLResourceStateCommandEncoder--对修改资源配置的命令进行编码的编码器。\nMTLResourceStatePassDescriptor--资源状态通道的配置，用于创建资源状态命令编码器。\nBuffers--创建和操作非结构化GPU资源。\nTextures--创建和操作结构化GPU资源。\nIndirect Command Buffers--通过重用命令来补偿编码时间，或者通过在GPU上生成命令来创建GPU驱动的渲染管道。\nHeaps--创建一个单独的内存分配，从中可以细分资源。\nSynchronization--管理应用程序中资源的访问，以避免数据风险。\nMTLOrigin--区域的前左上角的坐标。\nMTLRegion--对象元素子集的边界。\nMTLAxisAlignedBoundingBox--轴对齐的边界框的边界。\nMTLSize--物体的尺寸。\nMTLCoordinate2D--视窗中的坐标。\nMTLPackedFloat3--一种结构，包含三个没有额外填充的32位浮点值。\nMTLPackedFloat4x3--一种结构，它包含一个32位浮点值的4x4矩阵的前三行，按列主序排列。\nMTLPackedFloat3--一种结构，包含三个没有额外填充的32位浮点值。\nMTLPackedFloat4x3--一种结构，它包含一个32位浮点值的4x4矩阵的前三行，按列主序排列。\nMTLTimestamp--时间戳，马赫绝对时间。\nFrame Capture Debugging Tools--在运行时分析和优化应用的性能。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class MetalViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MetalViewControllerType.overview, MetalViewControllerType.topics, MetalViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MetalViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MetalViewControllerType ?? MetalViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MetalDemoViewController()
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


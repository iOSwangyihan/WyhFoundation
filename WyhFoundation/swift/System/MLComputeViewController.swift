//
//  MLComputeViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/24.
//



import UIKit
enum MLComputeViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n加速跨CPU和一个或多个gpu的神经网络的训练和验证。"
        case .topics:
            return "Components:\nMLCTensor--在整个框架中使用的数据对象。。\nMLCActivationLayer--对源张量应用激活函数并产生输出的一层。。\nMLCMultiheadAttentionLayer--一个多头、缩放的点积注意层，用于处理输入键值对中的一个或多个条目。。\nMLCSoftmaxLayer--softmax层。。\nMLCArithmeticLayer--一个算术层。\nMLCReductionLayer--用于将给定维度上的张量值缩减为标量值的一层\nMLCMatMulLayer--批处理矩阵乘法层。\nMLCFullyConnectedLayer--完全连通层，也称为致密层。\nMLCGramMatrixLayer--一种克矩阵层，计算张量的每个特征通道的空间平面之间的非中心互相关值。\nMLCTransposeLayer--一层转置\nMLCConcatenationLayer--一个连接层。\nMLCReshapeLayer--一个重塑层。\nMLCSliceLayer--一片层。\nMLCSplitLayer--一个分离层。\nMLCPaddingLayer--一个填充层。\nMLCLayerNormalizationLayer--一层标准化层。\nMLCBatchNormalizationLayer--批处理归一化层\nMLCGroupNormalizationLayer--组标准化层。\nMLCInstanceNormalizationLayer--实例规范化层\nMLCDropoutLayer--一个辍学层。\nMLCConvolutionLayer--一个卷积层。\nMLCLSTMLayer--长短期记忆(LSTM)层。\nMLCPoolingLayer--一个汇聚层。\nMLCUpsampleLayer--一个upsample层。\nMLCEmbeddingLayer--一种用于存储字嵌入的嵌入层。\nMLCLossLayer--一个损失层。\nMLCYOLOLossLayer--YOLO损失层。\nMLCLayer--所有框架层的基类\nMLCPaddingPolicy--为卷积或池化层指定的填充策略。\nMLCPaddingType--为填充层指定的填充类型。\nMLCDevice--一个对象，表示框架用来执行神经网络的CPU或一个或多个gpu。\nMLCGraph--用于构建训练或推理图的层图。\nMLCTrainingGraph--由一个或多个图对象加上直接添加到训练图的其他层创建的训练图。\nMLCInferenceGraph--由一个或多个MLCGraph实例以及直接添加到推理图的其他层创建的推理图。\nMLCComparisonLayer--\nMLCGatherLayer--\nMLCScatterLayer--\nMLCSelectionLayer--\nMLCComparisonOperation--"
        case .demo:
            return "Click here to example"
        }
    }
}
class MLComputeViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MLComputeViewControllerType.overview, MLComputeViewControllerType.topics, MLComputeViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MLComputeViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MLComputeViewControllerType ?? MLComputeViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MLComputeDemoViewController()
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





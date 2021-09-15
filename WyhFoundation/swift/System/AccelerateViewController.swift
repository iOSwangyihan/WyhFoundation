//
//  AccelerateViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum AccelerateViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n进行大规模的数学计算和图像计算，优化高性能、低能耗。"
        case .topics:
            return "BNNS--实现和运行神经网络进行训练和推理。语言\nvImage--使用CPU的矢量处理器操作大图像。\nvDSP--在大向量上执行基本的算术运算和常见的数字信号处理程序。\nFast Fourier Transforms-将时域和空域复值的向量和矩阵变换到频域，反之亦然。\nDiscrete Fourier Transforms--将时域和空域复值向量变换到频域，反之亦然。\nDiscrete Cosine Transforms--将时域和空域实值向量变换到频域，反之亦然。\nCore Video Interoperability--在Core Video和vImage之间传递图像数据。\nsimd--对小的向量和矩阵进行计算。\nBiquadratic IIR Filters--对单通道和多通道数据应用双二次滤波器。\nDiscrete Cosine Transforms--将时域和空域实值向量变换到频域，反之亦然。\nConversion--将图像转换为不同的格式。\nImage Shearing--水平和垂直的剪切图像。\nConvolution--对图像应用卷积核。\nMorphology--放大和侵蚀图像。\nTransform--对图像应用颜色变换。\nHistogram--计算或操作图像的直方图。\nSparse Solvers--求解系数矩阵稀疏的方程组。\nvecLib--在大型向量上执行计算。\nBLAS--苹果的基本线性代数子程序(BLAS)的实现。\nQuadrature--在有限或无限区间上近似函数的定积分。\n"
        case .demo:
            return "Click here to example"
        }
    }
}

class AccelerateViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [AccelerateViewControllerType.overview, AccelerateViewControllerType.topics, AccelerateViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AccelerateViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AccelerateViewControllerType ?? AccelerateViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AccelerateDemoViewController()
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









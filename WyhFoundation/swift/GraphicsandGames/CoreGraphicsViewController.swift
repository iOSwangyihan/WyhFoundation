//
//  CoreGraphicsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//







import UIKit
enum CoreGraphicsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n利用Quartz技术的强大功能来执行带有高保真输出的轻量级2D渲染。处理基于路径的绘图，抗锯齿渲染，梯度，图像，颜色管理，PDF文档，等等。"
        case .topics:
            return "CGFloat--核心图形和相关框架中浮点标量值的基本类型。\nCGPoint--在二维坐标系中包含一个点的结构。\nCGSize--一种包含宽度和高度值的结构。\nCGRect--一种包含矩形的位置和尺寸的结构。\nCGVector--包含二维向量的结构。\nCGAffineTransform--用于绘制2D图形的仿射变换矩阵。\nCGContext--一个石英2D绘图环境。\nCGImage--位图图像或图像掩码。\nCGPath--不可变的图形路径:在图形上下文中绘制的图形或线条的数学描述。\nCGMutablePath--可变图形路径:图形上下文中要绘制的图形或线条的数学描述。\nCGLayer--一个用于重用用核心图形绘制的内容的离线上下文。\nCGColor--一组定义颜色的组件，并用颜色空间指定如何解释它们。\nCGColorConversionInfo--描述如何在颜色空间之间进行转换以供其他系统服务使用的对象。\nCGColorSpace--指定如何解释显示的颜色值的配置文件。\nCGFont--用于绘制文本的一组字符符号和布局信息。\nCGPDFDocument--一种包含PDF(便携式文档格式)绘图信息的文档。\nCGDataConsumer--一种对数据写入任务的抽象，无需管理原始内存缓冲区。\nCGDataProvider--一种对数据读取任务的抽象，无需管理原始内存缓冲区。\nCGShading--由您提供的自定义函数控制的颜色间平滑过渡的定义，用于绘制径向和轴向渐变填充。\nCGGradient--用于绘制径向和轴向渐变填充的颜色之间平滑过渡的定义。\nCGFunction--用于定义和使用回调函数的通用工具。\nCGPattern--用于绘制图形路径的2D模式。\nCGPathFillRule--确定路径内部区域的规则，fillPath(using:)和clip(using:)方法使用。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreGraphicsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreGraphicsViewControllerType.overview, CoreGraphicsViewControllerType.topics, CoreGraphicsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreGraphicsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreGraphicsViewControllerType ?? CoreGraphicsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreGraphicsDemoViewController()
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


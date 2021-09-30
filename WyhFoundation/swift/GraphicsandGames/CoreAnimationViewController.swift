//
//  CoreAnimationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//





import UIKit
enum CoreAnimationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n渲染、合成和动画视觉元素。"
        case .topics:
            return "CALayer--一个对象，它管理基于图像的内容，并允许您在该内容上执行动画。\nCALayerDelegate--应用程序可以实现响应层相关事件的方法。\nCAAction--允许对象对CALayer更改触发的操作做出响应的接口。\nCATextLayer--提供简单文本布局和呈现普通字符串或带属性字符串的层。\nCAShapeLayer--在其坐标空间中绘制三次Bezier样条的层。\nCAGradientLayer--在背景色上绘制颜色渐变的图层，填充图层的形状(包括圆角)\nCAAnimation--核心动画中的动画抽象超类。\nCAAnimationDelegate--当动画开始和停止时，应用程序可以实现响应的方法。\nCAPropertyAnimation--CAAnimation的一个抽象子类，用于创建操纵层属性值的动画。\nCABasicAnimation--为层属性提供基本的、单关键帧动画功能的对象。\nCAKeyframeAnimation--为层对象提供关键帧动画功能的对象。。\nCASpringAnimation--一种将弹簧般的力应用到图层属性上的动画。\nCATransition--提供层状态间动画过渡的对象。\nCAValueFunction--提供定义动画转换的灵活方法的对象。\nCAAnimationGroup--一个对象，允许多个动画被分组并并发运行。\nCATransaction--将多层树操作分组到呈现树的原子更新的机制。\nCAMediaTimingFunction--将动画的节奏定义为时间曲线的函数。\nCAMediaTiming--建模分层计时系统的方法，允许对象在其父时间和本地时间之间映射时间。\nCADisplayLink--一个计时器对象，允许应用程序将其绘图与显示的刷新率同步。\nCAEmitterLayer--一个发射、动画和渲染粒子系统的层。\nCAEmitterCell--由CAEmitterLayer发射的粒子的定义。\nCAScrollLayer--显示大于其自身边界的可滚动内容的层。\nCATiledLayer--一种提供异步提供该层内容的块的方法的层，该层可能缓存在多个详细级别。\nCATransformLayer--对象用于创建真正的3D层层次，而不是其他CALayer类使用的扁平层次渲染模型。\nCAReplicatorLayer--使用不同的几何、时间和颜色转换创建指定数量的子层副本的层。\nCAMetalLayer--一个核心动画层，金属可以渲染，通常显示在屏幕上。\nCAMetalDrawable--一个与核心动画层相关联的金属绘图。\nTransforms--在Core Animation中定义变换矩阵来对图层应用仿射变换。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreAnimationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreAnimationViewControllerType.overview, CoreAnimationViewControllerType.topics, CoreAnimationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreAnimationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreAnimationViewControllerType ?? CoreAnimationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreAnimationDemoViewController()
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


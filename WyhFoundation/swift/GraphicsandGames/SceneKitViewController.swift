//
//  SceneKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/17.
//



import UIKit
enum SceneKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n使用高级场景描述创建3D游戏，并将3D内容添加到应用程序中。轻松添加动画，物理模拟，粒子效果，和现实的物理基础渲染。"
        case .topics:
            return "SCNScene--节点层次结构和全局属性的容器，共同组成一个可显示的3D场景。\nSCNView--用于显示3D SceneKit内容的视图。\nSCNNode--场景图的结构元素，表示三维坐标空间中的位置和变换，可以将几何图形、灯光、摄像机或其他可显示内容附加到其上。\nSCNReferenceNode--场景图节点，作为从单独的场景文件加载内容的占位符。\nSCNSceneRenderer--SCNView、SCNLayer和SCNRenderer类的常用方法和属性。\nSCNSceneRendererDelegate--应用程序可以实现的方法参与SceneKit的动画循环或执行额外的渲染。\nSCNRenderer--用于在现有的金属工作流或OpenGL上下文中显示SceneKit场景的渲染器。\nSCNHitTestResult--关于场景空间或视图空间搜索场景元素的结果的信息。\nSCNLight--一种可以附加到节点上照亮场景的光源。\nSCNCamera--一组相机属性，可以附加到一个节点上，以提供显示场景的视角。\nSCNMaterial--一组阴影属性，用来定义渲染时几何图形表面的外观。\nSCNMaterialProperty--一种储存一种材料视觉特性的颜色或纹理的容器。\nSCNGeometry--可以在场景中显示的三维形状(也称为模型或网格)，带有定义其外观的附加材料。\nSCNGeometrySource--顶点数据的容器，构成三维物体或几何体定义的一部分。\nSCNGeometryElement--索引数据的容器，用于描述顶点如何连接以定义三维对象或几何图形。\nBuilt-in Geometry Types--基本形状(如球体、盒子和平面)以及从2D文本和Bézier曲线生成3D对象的功能。\nAnimation--创建以预定方式移动场景元素的声明式动画，或者使用外部创作工具管理导入的动画。\nConstraints--根据指定的规则自动调整节点的位置或方向。\nSCNSkinner--一个对象，用来管理骨骼动画和它们动画的节点和几何图形之间的关系。\nSCNMorpher--管理节点基本几何图形与一个或多个目标几何图形之间平滑过渡的对象。\nPhysics Simulation--为场景元素添加动态行为;检测接触和碰撞;模拟真实的效果，如重力、弹簧和车辆。\nSCNParticleSystem--使用高级模拟(游戏邦注:其一般行为由你指定)来动画和呈现小图像精灵系统的对象。\nSCNParticlePropertyController--由粒子系统渲染的单个粒子的单个属性的动画。\nSCNAudioSource--一个简单的、可重用的音频源——从文件加载的音乐或声音效果——用于位置音频回放。\nSCNAudioPlayer--用于在SceneKit场景中播放位置音频源的控制器\nSCNShadable--使用Metal或OpenGL着色器程序自定义SceneKit的几何和材质渲染方法。\nSCNProgram--一个完整的金属或OpenGL着色程序，替代SceneKit的几何体或材质渲染。\nSCNBufferStream--一个管理自定义着色程序使用的金属缓冲区的对象。\nSCNTechnique--使用自定义Metal或OpenGL着色器的附加绘图通道来增强或后期处理SceneKit的场景渲染的规范。\nSCNTechniqueSupport--使用SCNTechnique对象支持多通道渲染的SceneKit对象的通用接口。\nSCNNodeRendererDelegate--方法可以使用您自己的自定义Metal或OpenGL绘图代码来为节点呈现内容。\nSCNSceneSource--一个对象，用于管理与从文件或数据加载场景内容相关的数据读取任务。\nSceneKit 3D Data Types--scenekit特定的向量，矩阵，以及相关的函数和操作。\nSceneView--用于显示3D SceneKit内容的SwiftUI视图。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SceneKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SceneKitViewControllerType.overview, SceneKitViewControllerType.topics, SceneKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SceneKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SceneKitViewControllerType ?? SceneKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SceneKitDemoViewController()
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


//
//  SpriteKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/17.
//



import UIKit
enum SpriteKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS7+\n将高性能2D内容与流畅的动画添加到您的应用程序中，或使用一套基于2D游戏的高级工具创建游戏。"
        case .topics:
            return "SKScene--组织所有活动SpriteKit内容的对象。\nNodes for Scene Building--定义场景内容的外观或布局。\nSKView--渲染SpriteKit场景的视图子类。\nSKRenderer--一个对象，它将场景呈现到自定义的Metal渲染管道中，并驱动场景更新周期。。\nSKTexture--在GPU上解码的图像，可以用来渲染各种SpriteKit对象。。\nSKTextureAtlas--为存储和绘图性能优化的纹理集合。。\nSKMutableTexture--可以动态更新其内容的纹理。\nSKAction--由节点运行以更改其结构或内容的对象。。\nSKConstraint--一种限制节点位置或旋转的规范。。\nSKReachConstraints--求解逆运动学时的自由度说明。\nSKKeyframeSequence--在不同时间指定的值(关键帧)之间执行插值的对象。。\nSKRange--浮点值范围的定义。。\nSKRegion--任意区域的定义。并出口\nSKPhysicsWorld--场景中物理引擎的驱动程序;它为您提供了配置和查询物理系统的能力。\nSKPhysicsBody--向节点添加物理模拟的对象。\nSKPhysicsContact--描述两个物理物体之间的接触。\nSKPhysicsContactDelegate--当物理实体接触时，应用程序可以实现响应的方法。\nSKFieldNode--将物理效果应用到附近节点的节点。\nSKPhysicsJoint--连接物理实体的对象的抽象超类。\nSKPhysicsJointFixed--在参考点将两个物理物体融合在一起的关节。\nSKPhysicsJointLimit--在两个物理物体之间施加最大距离的关节，就好像它们由一根绳子连接起来。\nSKPhysicsJointPin--把两个物理物体固定在一起的关节，允许独立旋转。。\nSKPhysicsJointSliding--允许两个物理物体沿轴滑动的关节。朗。\nSKPhysicsJointSpring--连接两个物理物体的模拟弹簧的关节。\nSKTileMapNode--一组二维图像。。\nSKTileDefinition--可以在贴图地图中重复的单个贴图。\nSKTileGroup--定义一种地形类型的一组贴图。\nSKTileGroupRule--描述如何在地图中放置不同贴图的规则。\nSKTileSet--相关平铺组的容器。\nSKShader--一个允许你应用自定义片段着色器的对象。\nSKAttribute--一个使用自定义着色器的动态每个节点数据的规范。\nSKAttributeValue--一个与节点关联的动态着色器数据的容器。\nSKUniform--统一着色器数据的容器。\nSKWarpGeometry--符合SKWarpable的节点变形的定义。\nSKWarpGeometryGrid--符合SKWarpable的基于网格的节点变形的定义。\nSKWarpable--一个可以被SKWarpGeometry扭曲和动画的对象的协议。\nSpriteView--一个渲染SpriteKit场景的SwiftUI视图。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SpriteKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SpriteKitViewControllerType.overview, SpriteKitViewControllerType.topics, SpriteKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SpriteKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SpriteKitViewControllerType ?? SpriteKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SpriteKitDemoViewController()
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


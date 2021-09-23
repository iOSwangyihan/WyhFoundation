//
//  RealityKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/22.
//





import UIKit
enum RealityKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n模拟和渲染3D内容，以便在增强现实应用程序中使用。"
        case .topics:
            return "ARView--一个显示整合了来自RealityKit内容的增强现实体验的视图。\nScene--一个容器，用于保存由AR视图呈现的实体集合。\nEntity--RealityKit场景中的一个元素，可以将为实体提供外观和行为特征的组件附加到该元素上。\nComponent--应用于实体的几何体或行为的表示形式。\nResource--用于配置组件(如材质、网格或纹理)的共享资源。\nSystem--在RealityKit场景的每一帧中影响多个实体的对象。\nAnchorEntity--在AR会话中将虚拟内容与真实世界对象绑定的锚。\nModelEntity--RealityKit呈现和可选模拟的物理对象的表示。\nTriggerVolume--一种看不见的3D形状，可以检测物体何时进入或离开给定的空间区域。\nBodyTrackedEntity--一种在AR场景中通过跟踪真人来动画虚拟角色的实体。\nPerspectiveCamera--建立渲染透视图的虚拟摄像机。\nPointLight--为虚拟对象产生全向光的实体。\nDirectionalLight--一种向特定方向投射虚拟光的实体。\nSpotLight--一种在锥形体中照亮虚拟内容的实体。\nAnimationPlaybackController--管理动画回放的控制器。\nAnimationResource--一个实体可以播放的动画。\nAnimationTimingFunction--动画过渡的节奏。\nAnimationEvents--RealityKit动画系统触发的事件。\nAudioPlaybackController--管理资源音频回放的控制器。\nAudioResource--一种可由实体播放的音频资源。\nAudioFileResource--从文件或URL加载的音频资源。\nAudioEvents--与音频回放相关的事件。\nMultipeerConnectivityService--在多节点连接会话中，在所有节点之间提供场景同步的服务。\nSynchronizationService--在一组本地对等体之间实现实体同步的接口。\nSynchronizationEvents--与网络事件相关的场景信息同步。\nNetworkCompatibilityToken--一种不透明的令牌，用于检查多点连接中两个对等点之间的网络兼容性。\nCollisionGroup--用来定义实体所属的碰撞组的位掩码。\nCollisionFilter--确定实体在模拟过程中是否会碰撞的一组掩码。\nModelDebugOptionsComponent--更改RealityKit呈现其实体的方式以帮助调试的组件。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class RealityKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [RealityKitViewControllerType.overview, RealityKitViewControllerType.topics, RealityKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? RealityKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? RealityKitViewControllerType ?? RealityKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = RealityKitDemoViewController()
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


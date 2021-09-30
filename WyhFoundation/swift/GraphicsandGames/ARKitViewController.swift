//
//  ARKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//







import UIKit
enum ARKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n集成iOS设备摄像头和运动功能，在您的应用程序或游戏中产生增强现实体验。"
        case .topics:
            return "ARSession--该对象管理与每个AR体验相关的主要任务，如运动跟踪、摄像机通过和图像分析。\nConfiguration Objects--配置增强现实会话以检测和跟踪特定类型的内容。\nARView--一个显示整合了来自RealityKit内容的增强现实体验的视图。\nARSCNView--将SceneKit中的虚拟3D内容融入到增强现实体验中的视图。\nARSKView--将SpriteKit中的虚拟2D内容融入增强现实体验的3D空间。\nARCoachingOverlayView--显示标准化的入职指导的视图，引导用户朝着特定的目标前进。\nContent Anchors--识别物理环境中的项目，包括平面表面、图像、物理物体、身体位置和面部。\nEnvironmental Analysis--分析来自摄像机的视频和伴随的数据，并使用光线投射和深度地图信息来确定物品的位置。\nCamera, Lighting, and Effects--确定相机的位置和当前会话的照明，并应用效果，如遮挡，到环境的元素。\nData Management--获取骨骼和面部几何的详细信息，并保存世界数据。\nARQuickLookPreviewItem--用于定制AR Quick Look体验的对象。\nARParticipantAnchor--多用户增强现实体验中另一个用户的锚。\nARSession.CollaborationData--保存用户收集的有关物理环境的信息的对象。\nARError--ARKit报告的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class ARKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ARKitViewControllerType.overview, ARKitViewControllerType.topics, ARKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ARKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ARKitViewControllerType ?? ARKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ARKitDemoViewController()
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


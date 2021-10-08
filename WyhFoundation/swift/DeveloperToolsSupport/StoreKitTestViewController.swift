//
//  StoreKitTestViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//







import UIKit
enum StoreKitTestViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n在Xcode中为你的应用程序订阅和应用程序内购买交易创建并自动化测试。"
        case .topics:
            return "SKTestSession--用于在Xcode中测试StoreKit事务的控制和环境配置。\nSKTestTransaction--在测试环境中发生的事务。\nSKTestError.Code--测试环境中的错误代码。\nSKTestError--关于测试环境返回的错误的信息。\nARSKView--将SpriteKit中的虚拟2D内容融入增强现实体验的3D空间。\nARCoachingOverlayView--显示标准化的入职指导的视图，引导用户朝着特定的目标前进。\nContent Anchors--识别物理环境中的项目，包括平面表面、图像、物理物体、身体位置和面部。\nEnvironmental Analysis--分析来自摄像机的视频和伴随的数据，并使用光线投射和深度地图信息来确定物品的位置。\nCamera, Lighting, and Effects--确定相机的位置和当前会话的照明，并应用效果，如遮挡，到环境的元素。\nData Management--获取骨骼和面部几何的详细信息，并保存世界数据。\nARQuickLookPreviewItem--用于定制AR Quick Look体验的对象。\nARParticipantAnchor--多用户增强现实体验中另一个用户的锚。\nARSession.CollaborationData--保存用户收集的有关物理环境的信息的对象。\nARError--ARKit报告的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class StoreKitTestViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [StoreKitTestViewControllerType.overview, StoreKitTestViewControllerType.topics, StoreKitTestViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? StoreKitTestViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? StoreKitTestViewControllerType ?? StoreKitTestViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = StoreKitTestDemoViewController()
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


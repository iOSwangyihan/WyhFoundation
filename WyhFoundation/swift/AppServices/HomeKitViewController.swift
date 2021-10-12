//
//  HomeKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/12.
//






import UIKit
enum HomeKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n配置、控制和与家庭自动化配件通信。"
        case .topics:
            return "HMHomeManager--一个或多个用户住宅的集合的管理器。\nHMAccessorySetupManager--一个物体连接物质配件到第三方家庭中心。\nHMCHIPServiceHome--存在于第三方家庭中心和iOS之间的家庭的代表。\nHMCHIPServiceRoom--代表一个房间存在于第三方家庭中心和iOS之间。\nHMCHIPServiceTopology--包含来自第三方主中心的设置信息的类。\nHMCHIPServiceRequestHandler--处理配置和配对的对象。\nHMAccessory--家用自动化配件，如车库门开启器或恒温器\nHMService--一种附件的可控制功能，如附在车库门开启器上的灯。\nHMCharacteristic--一种服务的特定特性，如可调光的亮度或其色温。\nHMActionSet--作为一个组触发的操作集合。\nHMTimerTrigger--基于定时计时器来激活动作集的触发器。\nHMEventTrigger--基于一组事件和可选条件来激活操作集的触发器。\nHMError--HomeKit返回一个错误。\nHMErrorBlock--提供错误的完成块。"
        case .demo:
            return "Click here to example"
        }
    }
}
class HomeKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [HomeKitViewControllerType.overview, HomeKitViewControllerType.topics, HomeKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? HomeKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? HomeKitViewControllerType ?? HomeKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = HomeKitDemoViewController()
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


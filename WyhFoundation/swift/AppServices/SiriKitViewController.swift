//
//  SiriKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//




import UIKit
enum SiriKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS10+\n让用户通过语音、智能建议和个性化工作流与设备进行交互。"
        case .topics:
            return "INIntent--在你的应用程序或意图扩展完成一个请求。\nINIntentResponse--你对意图对象的响应。\nIntent Handling Infrastructure--指定所需的权限，并为应用程序支持的意图提供处理程序，并配置应用程序扩展。\nResolution Results--将常见类型的数据(如字符串和日期)解析为应用程序识别的特定值。\nCommon Data Types--管理常用数据类型，如字符串、日期、货币、图像和联系人。\nCar Commands--管理车辆门锁，了解车辆状态。\nLists and Notes--创建和管理笔记和待办事项。\nMedia--通过Siri Intents听和控制音频，或者通过快捷键从应用程序听和看媒体内容。\nMessaging--发送消息并搜索用户收到的消息。\nPayments--在用户之间进行支付或支付账单。\nRestaurant Reservations--在地图应用程序的帮助下创建和管理餐厅预订。\nRide Booking--预订游乐设施并报告它们的状况。\nVoIP Calling--发起呼叫并搜索用户的通话记录。\nWorkouts--开始、结束和管理健身计划。\nIntent Class Identifiers--确定用户通知指定的意图。\nINShortcut--一种在你的应用程序中可用的操作，系统可能会建议用户或用户可能会添加到Siri中。\nINInteraction--一个用户和你的应用程序之间的交互，涉及到一个intent对象。\nINVoiceShortcutCenter--检索用户的快捷方式并给出快捷方式建议。\nINVoiceShortcut--用户添加到Siri中的快捷方式。\nINShortcutAvailabilityOptions--已定义的上下文，其中一个意图或活动可能与用户相关。\nShortcut-Related UI--将标准按钮和界面合并到您的用户界面中，以提供简单的快捷方式创建。\nWatch and Widget Support--在Siri表盘上显示相关快捷键，并在Smart Stacks中提供建议。\nSiri Event Suggestions--为用户提供与预订相关的最新、可操作的信息。\nINVocabulary--注册Siri请求的特定用户词汇表的对象。\nINUIHostedViewControlling--在Siri和Maps界面中显示自定义内容的方法。\nINUIHostedViewSiriProviding--方法用于隐藏Siri提供的部分默认接口。\nINParameter--交互对象的参数。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class SiriKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SiriKitViewControllerType.overview, SiriKitViewControllerType.topics, SiriKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SiriKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SiriKitViewControllerType ?? SiriKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SiriKitDemoViewController()
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


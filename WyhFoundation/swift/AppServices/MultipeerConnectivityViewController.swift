//
//  MultipeerConnectivityViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//




import UIKit
enum MultipeerConnectivityViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS7+\n支持点对点连接和发现附近的设备。"
        case .topics:
            return "MCAdvertiserAssistant--MCAdvertiserAssistant是一个方便的类，它处理广告、向用户呈现传入邀请并处理用户的响应。当应用程序不需要对邀请过程进行编程控制时，使用这个类提供一个用户界面来处理邀请。\nMCBrowserViewController--MCBrowserViewController类将附近的设备呈现给用户，并允许用户邀请附近的设备加入会话。在iOS或tvo使用这个类,从底层的ui类调用方法(准备(为:发送方)和performSegue (withIdentifier:发送方:)故事板或现在(_:动画:完成)和解散(动画:完成:)nib-based视图)和解散视图控制器。在macOS中，使用可比的NSViewController方法presentAsSheet(_:)和dismiss(_:)代替。\nMCNearbyServiceAdvertiser--MCNearbyServiceAdvertiser类发布应用程序通过Multipeer Connectivity框架提供的特定服务的广告，并通知它的委托来自附近的对等体的邀请。\nMCNearbyServiceBrowser--通过使用基础设施Wi-Fi、点对点Wi-Fi和蓝牙(iOS)或以太网(macOS和tvOS)搜索(按服务类型)附近设备提供的服务，并提供轻松邀请这些设备参加多端连接会话(MCSession)的能力。\nMCPeerID--MCPeerID对象代表了一个多对等体会话中的对等体。\nMCSession--MCSession对象启用并管理Multipeer Connectivity会话中所有对等体之间的通信。\nMCAdvertiserAssistantDelegate--MCAdvertiserAssistantDelegate协议描述了MCAdvertiserAssistant实例的委托对象可以实现的方法，以处理与发布相关的事件\nMCBrowserViewControllerDelegate--MCBrowserViewControllerDelegate协议定义了委托对象可以实现的方法，以处理与MCBrowserViewController类相关的事件。\nMCNearbyServiceAdvertiserDelegate--MCNearbyServiceAdvertiserDelegate协议描述了MCNearbyServiceAdvertiser实例的委托对象可以实现的方法，用于处理来自MCNearbyServiceAdvertiser类的事件。\nMCNearbyServiceBrowserDelegate--MCNearbyServiceBrowserDelegate协议定义了一些方法，MCNearbyServiceBrowser对象的委托可以实现这些方法来处理浏览器相关的事件。\nMCSessionDelegate--MCSessionDelegate协议定义了MCSession类的委托可以实现的方法来处理与会话相关的事件。有关更多信息，请参见MCSession。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class MultipeerConnectivityViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MultipeerConnectivityViewControllerType.overview, MultipeerConnectivityViewControllerType.topics, MultipeerConnectivityViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MultipeerConnectivityViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MultipeerConnectivityViewControllerType ?? MultipeerConnectivityViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MultipeerConnectivityDemoViewController()
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


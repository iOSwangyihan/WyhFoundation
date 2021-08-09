//
//  NetworkExtensionViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/9.
//


import UIKit
enum NetworkExtensionViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n定制和扩展核心网络功能"
        case .topics:
            return "Wi-FiManagement:\nWi-Fi Configuration--添加持久Wi-Fi配置，或临时移动设备到指定的Wi-Fi网络。\nHotspot Helper--将你的应用程序与iOS热点网络子系统集成。\nPersonal VPN--创建和管理使用内置VPN协议(IPsec或IKEv2)之一的VPN配置。\nPacket Tunnel Provider--实现一个面向包的、自定义的VPN协议的VPN客户端\nApp Proxy Provider--实现面向流的、自定义的VPN协议的VPN客户端。\nContent Filter Providers--创建一个设备上的网络内容过滤器。\nDNS Settings--创建和管理使用内置加密DNS协议的系统范围的DNS配置\nDNS Proxy Provider--使用自定义协议创建设备内DNS代理。\nLocal Push Connectivity--当无法访问更广泛的互联网时，提供类似苹果推送通知服务的功能\nNetworkExtension Enumerations--w\nNetworkExtension Constants--w"
        case .demo:
            return "Click here to example"
        }
    }
}
class NetworkExtensionViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [NetworkExtensionViewControllerType.overview, NetworkExtensionViewControllerType.topics, NetworkExtensionViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? NetworkExtensionViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? NetworkExtensionViewControllerType ?? NetworkExtensionViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = Objective_CRuntimeDemoViewController()
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



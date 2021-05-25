//
//  SystemConfigurationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/25.
//

import UIKit
enum SystemConfigurationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2\n允许应用程序访问设备的网络配置设置。确定设备的可达性，如Wi-Fi或蜂窝连接是否活跃。\n本文档集合描述了系统配置框架的编程接口。系统配置框架提供了以同步和异步方式确定目标主机可达性的功能。它还提供了错误检测工具。"
        case .topics:
            return "Reference:\nSCDynamicStore。\nSCDynamicStoreCopySpecific\nSCDynamicStoreKey\nSCNetwork\nSCNetworkConfiguration\nSCNetworkConnection\nSCNetworkReachability\nSCPreferences\nSCPreferencesPath\nSCPreferencesSetSpecific\nSCSchemaDefinitions\nSystem Configuration\nSystemConfiguration Enumerations\nSystemConfiguration Constants\nSystemConfiguration Data Types\n\n Entitlements:\nAccess WiFi Information Entitlement--一个布尔值，指示您的应用程序是否可以访问有关连接的Wi-Fi网络的信息。关键:com.apple.developer.networking.wifi-info\n\nRelated Documentation:\nSystem Configuration Programming Guidelines"
        case .demo:
            return "Click here to example"
        }
    }
}
class SystemConfigurationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SystemConfigurationViewControllerType.overview, SystemConfigurationViewControllerType.topics, SystemConfigurationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SystemConfigurationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SystemConfigurationViewControllerType ?? SystemConfigurationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SystemConfigationDemoViewController()
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

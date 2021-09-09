//
//  CoreTelephonyViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/8.
//



import UIKit
enum CoreTelephonyViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n访问用户的蜂窝服务提供商的信息，如其唯一标识符和运营商是否允许VoIP。"
        case .topics:
            return "ServiceInformation:\nCTCarrier--用户的移动电话服务提供商的信息，如其唯一标识符，是否允许VoIP呼叫在其网络上。\nCTTelephonyNetworkInfo--向用户的蜂窝服务提供者提供更改通知的对象。\nCTCellularPlanProvisioning--用于下载和安装运营商eSIM的对象。\nCTCellularPlanProvisioningRequest--指定要下载和安装的eSIM的请求。\nCTSubscriber--蜂窝网络用户。\nCTSubscriberDelegate--处理订阅者信息更改的协议。\nCTSubscriberInfo--提供蜂窝网络用户数组的对象。\nCTCellularData--一个表示应用程序是否可以访问蜂窝数据的对象。\nCTError--表示核心电话错误的类型。\nCTTelephonyNetworkInfoDelegate--"
        case .demo:
            return "Click here to example"
        }
    }
}

class CoreTelephonyViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [CryptoTokenKitViewControllerType.overview, CryptoTokenKitViewControllerType.topics, CryptoTokenKitViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CryptoTokenKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CryptoTokenKitViewControllerType ?? CryptoTokenKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CryptoTokenKitDemoViewController()
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









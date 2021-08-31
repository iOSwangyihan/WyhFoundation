//
//  ExternalAccessoryViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/31.
//



import UIKit
enum ExternalAccessoryViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS3+\n使用Apple Lightning连接器或蓝牙无线技术连接设备的配件进行通信。。"
        case .topics:
            return "Essentials:\nEAAccessoryManager--用于识别已连接附件并开始发送连接和断开连接通知的对象。\nEAAccessory--一个对象，它包含关于单个已连接硬件附件的信息。\nEASession--用于管理应用程序和连接的硬件附件之间的通信的对象。\nEAWiFiUnconfiguredAccessoryBrowser--一个对象，你用来扫描无线配件，并配置它们与用户的应用程序使用。\nEAWiFiUnconfiguredAccessory--提供有关未配置的MFi无线附件配置附件的信息的对象"
        case .demo:
            return "Click here to example"
        }
    }
}
class ExternalAccessoryViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ExternalAccessoryViewControllerType.overview, ExternalAccessoryViewControllerType.topics, ExternalAccessoryViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ExternalAccessoryViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ExternalAccessoryViewControllerType ?? ExternalAccessoryViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ExternalAccessoryDemoViewController()
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







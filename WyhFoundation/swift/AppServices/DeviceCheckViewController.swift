//
//  DeviceCheckViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/13.
//






import UIKit
enum DeviceCheckViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n通过管理设备状态和维护应用完整性，减少服务的欺诈使用。"
        case .topics:
            return "DCDevice--一种设备的表示形式，它提供唯一的、经过身份验证的令牌。\nDCAppAttestService--用于验证在设备上运行的应用程序实例的服务。\nApp Attest Environment--应用程序使用应用程序验证服务来验证自己的环境。\nDCError--DeviceCheck出现错误的类型。"
        case .demo:
            return "Click here to example"
        }
    }
}
class DeviceCheckViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [DeviceCheckViewControllerType.overview, DeviceCheckViewControllerType.topics, DeviceCheckViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? DeviceCheckViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? DeviceCheckViewControllerType ?? DeviceCheckViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = DeviceCheckDemoViewController()
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


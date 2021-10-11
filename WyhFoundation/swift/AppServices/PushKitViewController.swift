//
//  PushKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//





import UIKit
enum PushKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n响应与应用程序的复杂性、文件提供商和VoIP服务相关的推送通知。"
        case .topics:
            return "PKPushRegistry--一个请求推送并处理PushKit通知接收的对象。\nPKPushRegistryDelegate--用于处理传入PushKit通知和注册事件的方法。\nPKPushCredentials--封装设备令牌的对象，用于向应用程序发送推送通知。\nPKPushType--反映您想要支持的推送类型的常量。\nPKPushPayload--一个对象，包含关于接收到的PushKit通知的信息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class PushKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PushKitViewControllerType.overview, PushKitViewControllerType.topics, PushKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PushKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PushKitViewControllerType ?? PushKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PushKitDemoViewController()
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


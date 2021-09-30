//
//  WatchConnectivityViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//











import UIKit
enum WatchConnectivityViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS9+\n实现一个iOS应用程序和它配对的watchOS应用程序之间的双向通信。"
        case .topics:
            return "WCSession--启动WatchKit扩展和它的配套iOS应用程序之间的通信的对象。\nWCSessionDelegate--一个委托协议，定义了接收WCSession对象发送的消息的方法。\nWCSessionFile--当前正在iOS应用程序和WatchKit扩展之间传输的文件的信息。\nWCSessionFileTransfer--关于正在进行的文件传输的信息。\nWCSessionUserInfoTransfer--关于正在进行的数据传输的信息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class WatchConnectivityViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [WatchConnectivityViewControllerType.overview, WatchConnectivityViewControllerType.topics, WatchConnectivityViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? WatchConnectivityViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? WatchConnectivityViewControllerType ?? WatchConnectivityViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = WatchConnectivityDemoViewController()
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


//
//  NetworkViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/10.
//


import UIKit
enum NetworkViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS12+\n创建网络连接，使用传输和安全协议发送和接收数据"
        case .topics:
            return "Essentials:\nNWEndpoint--网络连接中的本地或远程端点。。\nNWParameters--一个对象，存储用于连接的协议、发送数据的选项和网络路径约束。。\nNWConnection--本地端点和远程端点之间的双向数据连接。\nNWListener--用于监听传入网络连接的对象\nNWBrowser--用于浏览可用网络服务的对象。\nNWConnectionGroup--用于与一组端点通信的对象，如本地网络上的IP多播组。\nNWProtocolTCP--用于使用传输控制协议的连接的网络协议\nNWProtocolTLS--用于使用传输层安全的连接的网络协议。\nNWProtocolUDP--用于使用用户数据报协议的连接的网络协议。\nNWProtocolIP--用于在连接上配置Internet协议的网络协议。\nNWProtocolWebSocket--一种用于使用WebSocket的连接的网络协议。\nNWProtocolFramer--用于定义应用程序消息解析器的可定制网络协议。\nNWPath--一个对象，包含有关连接使用的网络属性的信息，或可用于应用程序的信息\nNWPathMonitor--用于监视和响应网络更改的观察者。\nNWInterface--网络连接用来发送和接收数据的接口。\nNWError--Network框架中对象返回的错误。\nnw_path_unsatisfied_reason_t--w"
        case .demo:
            return "Click here to example"
        }
    }
}
class NetworkViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [NetworkViewControllerType.overview, NetworkViewControllerType.topics, NetworkViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? NetworkViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? NetworkViewControllerType ?? NetworkViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = NetworkDemoViewController()
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




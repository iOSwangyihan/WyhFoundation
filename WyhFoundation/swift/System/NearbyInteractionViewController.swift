//
//  NearbyInteractionViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/11.
//


import UIKit
enum NearbyInteractionViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n使用标识符、距离和方向定位并与附近的设备进行交互。"
        case .topics:
            return "InteractionSessions:\nNISession--标识两个对等设备之间唯一连接的对象。。\nNINearbyPeerConfiguration--定义对等交互会话参数的对象。\nNINearbyObject--在交互会话中建立和配置的对等体。\nNISessionDelegate--监视会话更新并对其作出反应的对象。"
        case .demo:
            return "Click here to example"
        }
    }
}
class NearbyInteractionViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [NetworkViewControllerType.overview, NearbyInteractionViewControllerType.topics, NearbyInteractionViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? NearbyInteractionViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? NearbyInteractionViewControllerType ?? NearbyInteractionViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = NearbyInteractionDemoViewController()
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





//
//  BusinessChatViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//

import UIKit
enum BusinessChatViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11.3+\n使用Messages应用程序与你的客户聊天。"
        case .topics:
            return "BCChatAction--对聊天执行操作。\nBCChatButton--在你的应用程序中使用“商务聊天”品牌的按钮。"
        case .demo:
            return "Click here to example"
        }
    }
}
class BusinessChatViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BusinessChatViewControllerType.overview, BusinessChatViewControllerType.topics, BusinessChatViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? BusinessChatViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? BusinessChatViewControllerType ?? BusinessChatViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = BusinessChatDemoViewController()
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


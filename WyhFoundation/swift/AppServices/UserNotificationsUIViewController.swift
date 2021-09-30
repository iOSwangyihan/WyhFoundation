//
//  UserNotificationsUIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//


import UIKit
enum UserNotificationsUIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS10+\n自定义显示本地和远程通知的界面。"
        case .topics:
            return "UNNotificationContentExtension--一个对象，它为已交付的本地或远程通知提供自定义接口。"
        case .demo:
            return "Click here to example"
        }
    }
}
class UserNotificationsUIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [UserNotificationsUIViewControllerType.overview, UserNotificationsUIViewControllerType.topics, UserNotificationsUIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? UserNotificationsUIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? UserNotificationsUIViewControllerType ?? UserNotificationsUIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = UserNotificationsUIDemoViewController()
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


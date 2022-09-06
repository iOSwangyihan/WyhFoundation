//
//  PermissionScopeViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

enum PermissionScopeViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "PermissionScope 是一个 Swift 框架，为了向用户巧妙地请求权限。它不只包含简单的权限请求 UI，还有统一的权限 API 可以告诉你任意给定的系统权限的状态，当然也可以轻松地请求它们."
        case .topics:
            return "Inspired by (but unrelated to) Periscope's permission control, PermissionScope is a Swift framework for intelligently requesting permissions from users. It contains not only a simple UI to request permissions but also a unified permissions API that can tell you the status of any given system permission or easily request them.\nSome examples of multiple permissions requests, a single permission and the denied alert.\nPermissionScope gives you space to explain your reasons for requesting permissions and allows users to tackle the system dialogs at their own pace. It presents a straightforward permissions design and is flexible enough to fit in to most UIKit-based apps.\nBest of all, PermissionScope detects when your app's permissions have been denied by a user and gives them an easy prompt to go into the system settings page to modify these permissions.\nSupported permissions:\nNotifications\nLocation (WhileInUse, Always)\nContacts\nEvents\nMicrophone\nCamera\nPhotos\nReminders\nBluetooth\nMotion"
        case .demo:
            return "https://github.com/iOSwangyihan/PermissionScope"
        }
    }
}
class PermissionScopeViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PermissionScopeViewControllerType.overview, PermissionScopeViewControllerType.topics, PermissionScopeViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PermissionScopeViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PermissionScopeViewControllerType ?? PermissionScopeViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PermissionScopeDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
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


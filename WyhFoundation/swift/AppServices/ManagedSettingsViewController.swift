//
//  ManagedSettingsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/11.
//


import UIKit
enum ManagedSettingsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS15+\n访问和改变设置与您的应用程序，同时维护用户隐私和控制。"
        case .topics:
            return "ManagedSettingsStore--将设置应用于当前用户或设备的数据存储。\nShieldActionDelegate--用于处理屏蔽操作的扩展的类。\nToken--一个活动(如应用程序或网站)的表示形式，它不透露其身份。\nApplication--应用程序在用户设备上的表示。\nApplicationToken--应用程序的表示。\nActivityCategory--活动的类别，如娱乐或社交。\nActivityCategoryToken--表示应用程序或网站活动类别的令牌。\nWebDomain--表示一个网站的对象。\nWebDomainToken--一种保护用户隐私的网络域名表示形式。"
        case .demo:
            return "Click here to example"
        }
    }
}
class ManagedSettingsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ManagedSettingsViewControllerType.overview, ManagedSettingsViewControllerType.topics, ManagedSettingsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ManagedSettingsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ManagedSettingsViewControllerType ?? ManagedSettingsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ManagedSettingsDemoViewController()
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


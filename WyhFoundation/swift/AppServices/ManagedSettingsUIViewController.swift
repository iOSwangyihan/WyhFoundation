//
//  ManagedSettingsUIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/11.
//


import UIKit
enum ManagedSettingsUIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS15+\n定义和配置屏蔽视图的外观。"
        case .topics:
            return "ShieldConfigurationDataSource--用于配置屏蔽外观的应用扩展的主对象的基类。\nShieldConfiguration--定义要在应用程序或网站上显示的屏蔽外观的对象。"
        case .demo:
            return "Click here to example"
        }
    }
}
class ManagedSettingsUIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ManagedSettingsUIViewControllerType.overview, ManagedSettingsUIViewControllerType.topics, ManagedSettingsUIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ManagedSettingsUIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ManagedSettingsUIViewControllerType ?? ManagedSettingsUIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ManagedSettingsUIDemoViewController()
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


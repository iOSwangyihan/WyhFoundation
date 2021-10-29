//
//  BundleResourcesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/28.
//


import UIKit
enum BundleResourcesViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n位于应用程序、框架或插件包中的资源。"
        case .topics:
            return "Entitlements--授予使用服务或技术的可执行权限的键值对。\nInformation Property List--一种包含键值对的资源，用于标识和配置一个包。"
        case .demo:
            return "Click here to example"
        }
    }
}
class BundleResourcesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BundleResourcesViewControllerType.overview, BundleResourcesViewControllerType.topics, BundleResourcesViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? BundleResourcesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? BundleResourcesViewControllerType ?? BundleResourcesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = BundleResourcesDemoViewController()
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


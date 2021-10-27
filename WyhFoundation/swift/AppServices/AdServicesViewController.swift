//
//  AdServicesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//


import UIKit
enum AdServicesViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14.3+\n将iOS设备上来自App Store、Apple News或Stocks的应用下载活动归类。"
        case .topics:
            return "AAAttribution--框架用来请求令牌的父类。\nAAAttributionError--返回的错误代码列表。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AdServicesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AdServicesViewControllerType.overview, AdServicesViewControllerType.topics, AdServicesViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AdServicesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AdServicesViewControllerType ?? AdServicesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AdServicesDemoViewController()
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


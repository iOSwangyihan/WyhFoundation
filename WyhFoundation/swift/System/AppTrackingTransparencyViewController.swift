//
//  AppTrackingTransparencyViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//



import UIKit
enum AppTrackingTransparencyViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n请求用户授权访问应用程序相关数据，以跟踪用户或设备。"
        case .topics:
            return "ATTrackingManager--提供应用程序的跟踪授权请求和跟踪授权状态的类。"
        case .demo:
            return "Click here to example"
        }
    }
}

class AppTrackingTransparencyViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [AppTrackingTransparencyViewControllerType.overview, AppTrackingTransparencyViewControllerType.topics, AppTrackingTransparencyViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AppTrackingTransparencyViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AppTrackingTransparencyViewControllerType ?? AppTrackingTransparencyViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AppTrackingTransparencyDemoViewController()
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









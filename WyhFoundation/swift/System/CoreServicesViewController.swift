//
//  CoreServicesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/9.
//




import UIKit
enum CoreServicesViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS12+\n访问和管理关键操作系统服务，如启动和标识服务。"
        case .topics:
            return ""
        case .demo:
            return "Click here to example"
        }
    }
}

class CoreServicesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [CoreServicesViewControllerType.overview, CoreServicesViewControllerType.topics, CoreServicesViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreServicesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreServicesViewControllerType ?? CoreServicesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreServicesDemoViewController()
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









//
//  osViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/9.
//


import UIKit
enum osViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n协调应用程序任务的调度和同步，并将信息记录到控制台以诊断问题"
        case .topics:
            return "Logs:\nLogging--使用统一的日志系统从应用程序中捕获遥测数据，用于调试和性能分析。"
        case .demo:
            return "Click here to example"
        }
    }
}
class osViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [osViewControllerType.overview, osViewControllerType.topics, osViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? osViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? osViewControllerType ?? osViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = osDemoViewController()
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

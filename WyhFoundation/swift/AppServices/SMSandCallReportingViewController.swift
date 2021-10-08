//
//  SMSandCallReportingViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/30.
//






import UIKit
enum SMSandCallReportingViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n创建扩展来管理和报告不需要的SMS消息和垃圾电话。"
        case .topics:
            return "SMS and MMS Message Filtering--创建一个应用程序扩展，识别和过滤不需要的短信和彩信，同时保护用户隐私。\nSMS and Call Spam Reporting--创建一个应用程序扩展，让用户报告不想要的短信和电话垃圾。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SMSandCallReportingViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SMSandCallReportingViewControllerType.overview, SMSandCallReportingViewControllerType.topics, SMSandCallReportingViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SMSandCallReportingViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SMSandCallReportingViewControllerType ?? SMSandCallReportingViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SMSandCallReportingDemoViewController()
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


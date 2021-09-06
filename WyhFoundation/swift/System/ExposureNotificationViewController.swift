//
//  ExposureNotificationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/6.
//




import UIKit
enum ExposureNotificationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13.5+\n实施COVID-19暴露通知系统，保护用户隐私。。"
        case .topics:
            return "Essentials:\nENManager--管理公开通知的类。\nENExposureConfiguration--对象，该对象包含用于配置暴露通知风险评分行为的参数。\nENExposureWindow--在一段时间跨度内从观测信标获得的一组扫描事件。\nENScanInstance--在扫描过程中接收到的信标衰减的集合。\nENExposureDetectionSummary--风险暴露的总结。\nENExposureDaySummary--一天的暴露信息汇总。\nENExposureSummaryItem--特定时间段或报告类型的曝光汇总。\nENError--暴露通知框架发出的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class ExposureNotificationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ExposureNotificationViewControllerType.overview, ExposureNotificationViewControllerType.topics, ExposureNotificationViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ExposureNotificationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ExposureNotificationViewControllerType ?? ExposureNotificationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ExposureNotificationDemoViewController()
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







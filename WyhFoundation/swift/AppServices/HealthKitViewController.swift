//
//  HealthKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/12.
//




import UIKit
enum HealthKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n访问和共享健康和健身数据，同时维护用户的隐私和控制。"
        case .topics:
            return "HKHealthStore--由HealthKit管理的所有数据的接入点。\nData Types--指定HealthKit中使用的数据类型。\nSamples--创建和保存健康和健身样本。\nQueries--查询健康和健身数据。。\nWorkouts and Activity Rings--年龄训练，锻炼阶段和活动总结。\nHKError--从HealthKit方法返回的错误。\nHKErrorDomain--所有HealthKit错误的域。\nHKError.Code--HealthKit返回的错误代码。"
        case .demo:
            return "Click here to example"
        }
    }
}
class HealthKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [HealthKitViewControllerType.overview, HealthKitViewControllerType.topics, HealthKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? HealthKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? HealthKitViewControllerType ?? HealthKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = HealthKitDemoViewController()
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


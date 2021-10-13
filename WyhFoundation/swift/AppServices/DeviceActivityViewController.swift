//
//  DeviceActivityViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/13.
//






import UIKit
enum DeviceActivityViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS15+\n监控设备活动与您的应用程序扩展，同时维护用户隐私。"
        case .topics:
            return "DeviceActivityEvent--表示应用程序、类别或网站活动的事件。\nDeviceActivityName--活动的唯一名称。\nDeviceActivitySchedule--一个基于日历的计划，用于监控设备的活动。\nDeviceActivityCenter--一个类，它使应用程序的扩展能够开始监视预定的设备活动。\nDeviceActivityMonitor--监视计划的设备活动的对象。\nDeviceActivityCenter.MonitoringError--开始监视活动时可能发生的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class DeviceActivityViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [DeviceActivityViewControllerType.overview, DeviceActivityViewControllerType.topics, DeviceActivityViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? DeviceActivityViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? DeviceActivityViewControllerType ?? DeviceActivityViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = DeviceActivityDemoViewController()
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


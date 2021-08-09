//
//  SensorKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/9.
//



import UIKit
enum SensorKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14从iPhone的传感器或配对的苹果手表中检索数据并获得指标。\n当系统使用设备上的各种传感器收集信息时，SensorKit使应用程序能够访问选定的原始数据，或系统从传感器处理的指标，例如:\n步骤的信息\n加速度计或转速数据\n用户手腕上手表的配置\n物理环境中的环境光\n用户日常通勤或旅行的详细信息\n有关完整列表，请参阅传感器。"
        case .topics:
            return "Essentials:\nSRSensorReader--为特定传感器建立用户授权并记录数据的对象。\n\nDataQuerying:\nSRFetchRequest--为示例查询定义条件的对象。。\nSRFetchResult--传感器读取器读取的记录数据。\n\nDataInterpretation:\nSRAmbientLightSample--使用者所处环境的光量\nSRVisit--用户在日常旅行中的进程。\nSRWristDetection--佩戴者手腕上的手表的结构。\nSRKeyboardMetrics--设备键盘的配置及其使用模式\nSRDeviceUsageReport--用户使用设备、特定苹果应用程序或网站的频率和相对持续时间\nSRMessagesUsageReport--一个对象，用来描述一段时间内用户的Messages应用程序活动\nSRPhoneUsageReport--描述用户在一段时间内的手机活动的对象\n\nDeletionAnalytics:\nSRDeletionRecord--一个对象，用于描述框架删除示例的原因"
        case .demo:
            return "Click here to example"
        }
    }
}
class SensorKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SensorKitViewControllerType.overview, SensorKitViewControllerType.topics, SensorKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SensorKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SensorKitViewControllerType ?? SensorKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SensorKitDemoViewController()
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

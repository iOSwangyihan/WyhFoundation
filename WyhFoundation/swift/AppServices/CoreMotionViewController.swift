//
//  CoreMotionViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/14.
//



import UIKit
enum CoreMotionViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n过程加速计、陀螺仪、计步器和环境相关事件。"
        case .topics:
            return "CMMotionManager--用于启动和管理运动服务的对象。\nCMDeviceMotion--封装了设备的姿态、旋转速率和加速度的测量值。\nCMAttitude--设备在某一时间点相对于已知参考系的方向。\nCMAccelerometerData--该设备的三个加速度计的数据样本。\nCMRecordedAccelerometerData--由该设备记录的单一加速度计数据。\nCMSensorRecorder--一种从设备中收集和检索加速度计数据的对象。\nCMSensorDataList--由系统记录的加速度计数据的列表。\nCMGyroData--对设备转速的单一测量。\nCMPedometer--用于获取系统生成的实时步行数据的对象。\nCMPedometerData--关于用户步行距离的信息。\nCMPedometerEvent--用户步行活动的变化。\nCMMagnetometerData--测量相对于设备的地球磁场。\nCMAltimeter--启动与高度相关变化的交付的对象。\nCMAltitudeData--记录的高度变化数据。\nCMHeadphoneMotionManager--启动和管理耳机移动服务的对象。\nCMMotionActivityManager--管理对设备存储的运动数据的访问的对象。\nCMMotionActivity--一个动作更新事件的数据。\nCMLogItem--所有与运动相关的数据对象的基类。\nCMTremorResult--一个结果对象，它包含关于一分钟间隔内地震的存在和强度的数据。\nCMDyskineticSymptomResult--结果对象，其中包含关于在一分钟间隔内可能出现的运动障碍症状的数据。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreMotionViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreMotionViewControllerType.overview, CoreMotionViewControllerType.topics, CoreMotionViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreMotionViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreMotionViewControllerType ?? CoreMotionViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreMotionDemoViewController()
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


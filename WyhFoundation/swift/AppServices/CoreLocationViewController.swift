//
//  CoreLocationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/15.
//





import UIKit
enum CoreLocationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n获取设备所在的地理位置和朝向。"
        case .topics:
            return "CLLocationManager--用于启动和停止向应用程序传递位置相关事件的对象。\nCLLocationManagerDelegate--用于从关联位置管理器对象接收事件的方法。\nCLAuthorizationStatus--指示应用程序使用位置服务的授权的常量。\nCLAccuracyAuthorization--指示应用程序有权使用的位置精度级别的常量。\nNSLocationAlwaysAndWhenInUseUsageDescription--一个消息，告诉用户为什么应用程序一直在请求访问用户的位置信息。\nNSLocationWhenInUseUsageDescription--一个消息，告诉用户为什么应用程序在前台运行时请求访问用户的位置信息。\nNSLocationDefaultAccuracyReduced--一个布尔值，表示应用程序请求是否在默认情况下降低了位置精度。\nCLLocation--系统上报的纬度、经度和航线信息。\nCLLocationCoordinate2D--与位置相关联的纬度和经度，使用WGS 84参考系指定。\nCLFloor--使用者设备所在建筑物的楼层。\nCLVisit--关于用户在特定时间段内的位置的信息。\nCLCircularRegion--圆形地理区域，指定为中心点和半径\nCLRegion--表示可以监视的区域的基类。\nCLBeacon--关于已观测到的iBeacon设备及其与用户设备的相对距离的信息。\nCLBeaconRegion--用于检测iBeacon设备是否存在的区域。\nCLBeaconIdentityConstraint--可以匹配一个或多个信标的身份特征。\nCLHeading--用户设备相对于真北或磁北的方位角(方向)。\nCLGeocoder--用于在地理坐标和地名之间转换的接口。\nCLPlacemark--一种用户友好的地理坐标描述，通常包含地名、地址和其他相关信息。\nCLError--核心位置错误。\nkCLErrorDomain--核心位置错误的域。\nkCLErrorUserInfoAlternateRegionKey--用户信息字典中与延迟区域监控响应有关的错误的关键字。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreLocationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreLocationViewControllerType.overview, CoreLocationViewControllerType.topics, CoreLocationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreLocationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreLocationViewControllerType ?? CoreLocationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreLocationDemoViewController()
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


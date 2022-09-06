//
//  NetworksViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum NetworksViewControllerType {
    case NetworkRequest
    case ImageAcquisition
    case InternetChat
    case NetworkMeasurement
    case WebFramework
    case NetworkAnalysis
    
    func name() -> String {
        switch self {
        case .NetworkRequest:
            return "网络请求"
        case .ImageAcquisition:
            return "图像获取"
        case .InternetChat:
            return "网络聊天"
        case .NetworkMeasurement:
            return "网络测试"
        case .WebFramework:
            return "网页框架"
        case .NetworkAnalysis:
            return "网络解析"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .NetworkRequest:
            return NetworkRequestViewController()
        case .ImageAcquisition:
            return ImageAcquisitionViewController()
        case .InternetChat:
            return InternetChatViewController()
        case .NetworkMeasurement:
            return NetworkMeasurementViewController()
        case .WebFramework:
            return WebFrameworkViewController()
        case .NetworkAnalysis:
            return NetworkAnalysisViewController()
       
        }
    }
}

class NetworksViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [NetworksViewControllerType.NetworkRequest,NetworksViewControllerType.ImageAcquisition,NetworksViewControllerType.InternetChat,NetworksViewControllerType.NetworkMeasurement,NetworksViewControllerType.WebFramework, NetworksViewControllerType.NetworkAnalysis]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? NetworksViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? NetworksViewControllerType ?? NetworksViewControllerType.NetworkRequest
        let vc = type.vc()
        vc.tname = type.name()
        self.navigationController?.pushViewController(vc, animated: true)
       
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


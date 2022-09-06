//
//  SwiftExampleViewController.swift
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

enum SwiftExampleViewControllerType {
    case CompleteTheAPP
    case Appframework
    case Safe
    case Network
    case DataStorage
    case Multithreading
    case Multimedia
    
    func name() -> String {
        switch self {
        case .CompleteTheAPP:
            return "完整APP"
        case .Appframework:
            return "App框架"
        case .Safe:
            return "安全"
        case .Network:
            return "网络"
        case .DataStorage:
            return "数据存储"
        case .Multithreading:
            return "多线程"
        case .Multimedia:
            return "多媒体"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .CompleteTheAPP:
            return CompleteTheAPPViewController()
        case .Appframework:
            return AppframeworkViewController()
        case .Safe:
            return SafeViewController()
        case .Network:
           return NetworksViewController()
        case .DataStorage:
            return DataStorageViewController()
        case .Multithreading:
            return MultithreadingViewController()
        case .Multimedia:
            return MultimediaViewController()
       
        }
    }
}

class SwiftExampleViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SwiftExampleViewControllerType.CompleteTheAPP, SwiftExampleViewControllerType.Appframework, SwiftExampleViewControllerType.Safe, SwiftExampleViewControllerType.Network, SwiftExampleViewControllerType.DataStorage,SwiftExampleViewControllerType.Multithreading,SwiftExampleViewControllerType.Multimedia]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? SwiftExampleViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? SwiftExampleViewControllerType ?? SwiftExampleViewControllerType.CompleteTheAPP
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

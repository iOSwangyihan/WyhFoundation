//
//  CompleteTheAPPViewController.swift
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

enum CompleteTheAPPViewControllerType {
    case open_source_ios_apps
    case Swift_30_Projects
    case V2ex_Swift
    case iBBS_Swift
    case NirZhihuDaily2_swift
    case DesignerNewsApp
    case Eidolon
    case BaiduFM_Swift
    case Tuan
    case ios_oss
    func name() -> String {
        switch self {
        case .open_source_ios_apps:
            return "open-source-ios-apps"
        case .Swift_30_Projects:
            return "Swift 30 Projects"
        case .V2ex_Swift :
            return "V2ex-Swift "
        case .iBBS_Swift:
            return "iBBS-Swift"
        case .NirZhihuDaily2_swift:
            return "NirZhihuDaily2.0_swift"
        case .DesignerNewsApp:
            return "DesignerNewsApp"
        case .Eidolon:
            return "Eidolon"
        case .BaiduFM_Swift:
            return "BaiduFM-Swift"
        case .Tuan :
            return "Tuan "
        case .ios_oss:
            return "ios-oss"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .open_source_ios_apps:
            return Open_source_ios_appsViewController()
        case .Swift_30_Projects:
            return Swift30ProjectsViewController()
        case .V2ex_Swift:
            return V2ex_SwiftViewController()
        case .iBBS_Swift:
            return iBBS_SwiftViewController()
        case .NirZhihuDaily2_swift:
            return NirZhihuDaily2_swiftViewController()
        case .DesignerNewsApp:
            return DesignerNewsAppViewController()
        case .Eidolon:
            return EidolonViewController()
        case .BaiduFM_Swift:
            return BaiduFM_SwiftViewController()
        case .Tuan :
            return TuanViewController()
        case .ios_oss:
            return ios_ossViewController()
       
        }
    }
}

class CompleteTheAPPViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CompleteTheAPPViewControllerType.open_source_ios_apps, CompleteTheAPPViewControllerType.Swift_30_Projects, CompleteTheAPPViewControllerType.V2ex_Swift, CompleteTheAPPViewControllerType.iBBS_Swift, CompleteTheAPPViewControllerType.NirZhihuDaily2_swift,CompleteTheAPPViewControllerType.DesignerNewsApp, CompleteTheAPPViewControllerType.Eidolon, CompleteTheAPPViewControllerType.BaiduFM_Swift, CompleteTheAPPViewControllerType.Tuan ,CompleteTheAPPViewControllerType.ios_oss]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? CompleteTheAPPViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? CompleteTheAPPViewControllerType ?? CompleteTheAPPViewControllerType.open_source_ios_apps
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


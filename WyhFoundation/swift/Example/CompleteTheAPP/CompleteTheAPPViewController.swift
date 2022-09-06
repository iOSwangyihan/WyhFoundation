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
    case AppClip
    case Foundation
    case SwiftUI
    case UIKit
  
    func name() -> String {
        switch self {
        case .open_source_ios_apps:
            return "open-source-ios-apps"
        case .AppClip:
            return "AppClip"
        case .Foundation:
            return "Foundation"
        case .SwiftUI:
            return "SwiftUI"
        case .UIKit:
            return "UIKit"
       
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .open_source_ios_apps:
            return Open_source_ios_appsViewController()
        case .AppClip:
            return AppClipsViewController()
        case .Foundation:
            return FoundationViewController()
        case .SwiftUI:
            return SwiftUIViewController()
        case .UIKit:
            return UIKitViewController()
       
        }
    }
}

class CompleteTheAPPViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CompleteTheAPPViewControllerType.open_source_ios_apps, CompleteTheAPPViewControllerType.AppClip, CompleteTheAPPViewControllerType.Foundation, CompleteTheAPPViewControllerType.SwiftUI, CompleteTheAPPViewControllerType.UIKit]
       
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


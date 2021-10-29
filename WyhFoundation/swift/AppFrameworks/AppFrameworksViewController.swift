//
//  AppFrameworksViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum AppFrameworksViewControllerType {
    case Accessibility
    case AppClip
    case Foundation
    case SwiftUI
    case UIKit
  
    func name() -> String {
        switch self {
        case .Accessibility:
            return "Accessibility"
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
        case .Accessibility:
            return AccessibilityViewController()
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

class AppFrameworksViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AppFrameworksViewControllerType.Accessibility, AppFrameworksViewControllerType.AppClip, AppFrameworksViewControllerType.Foundation, AppFrameworksViewControllerType.SwiftUI, AppFrameworksViewControllerType.UIKit]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? AppFrameworksViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? AppFrameworksViewControllerType ?? AppFrameworksViewControllerType.Accessibility
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

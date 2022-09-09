//
//  AppleWatchViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//



import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum AppleWatchViewControllerType {
    case SummaryOfAppleWatchDevelopmentTutorialMaterials
    case WatchKit_Apps
    
    func name() -> String {
        switch self {
        case .SummaryOfAppleWatchDevelopmentTutorialMaterials  :
            return "Apple Watch开发教程资料汇总  "
        case .WatchKit_Apps:
            return "WatchKit-Apps"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .SummaryOfAppleWatchDevelopmentTutorialMaterials:
            return SummaryOfAppleWatchDevelopmentTutorialMaterialsViewController()
        case .WatchKit_Apps :
            return WatchKit_AppsViewController()
       
        }
    }
}

class AppleWatchViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AppleWatchViewControllerType.SummaryOfAppleWatchDevelopmentTutorialMaterials,AppleWatchViewControllerType.WatchKit_Apps ]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? AppleWatchViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? AppleWatchViewControllerType ?? AppleWatchViewControllerType.SummaryOfAppleWatchDevelopmentTutorialMaterials
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


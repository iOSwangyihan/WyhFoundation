//
//  FamilyControlsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/13.
//





import UIKit
enum FamilyControlsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS15+\n授权您的应用程序在孩子的设备上提供家长控制。"
        case .topics:
            return "AuthorizationCenter--申请授权提供家长控制的中心。\nAuthorizationStatus--您的应用程序的授权状态，以提供家长控制。\nFamilyActivityPicker--在保护用户隐私的同时，允许用户选择类别、应用程序和网络域以供家长控制。\nFamilyActivitySelection--由用户选择的应用程序、类别和web域的集合。\nFamilyControlsError--类控件框架报告错误。\nFamilyActivityItem--为用户提供应用程序、类别或web域的只读、可视化表示的视图。\nFamilyActivity--包含单个应用程序、类别或web域令牌的枚举。"
        case .demo:
            return "Click here to example"
        }
    }
}
class FamilyControlsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [FamilyControlsViewControllerType.overview, FamilyControlsViewControllerType.topics, FamilyControlsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? FamilyControlsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? FamilyControlsViewControllerType ?? FamilyControlsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = FamilyControlsDemoViewController()
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


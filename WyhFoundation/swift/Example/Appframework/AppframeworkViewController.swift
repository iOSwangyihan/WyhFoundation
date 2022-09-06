//
//  AppframeworkViewController.swift
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

enum AppframeworkViewControllerType {
    case ReactiveFramework
   case PageRouting
    func name() -> String {
        switch self {
        case .ReactiveFramework:
            return "响应式框架"
        case .PageRouting:
            return "页面路由"
     
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .ReactiveFramework:
            return ReactiveFrameworkViewController()
        case .PageRouting:
            return PageRoutingViewController()
       
        }
    }
}

class AppframeworkViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AppframeworkViewControllerType.ReactiveFramework,AppframeworkViewControllerType.PageRouting]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? AppframeworkViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? AppframeworkViewControllerType ?? AppframeworkViewControllerType.ReactiveFramework
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


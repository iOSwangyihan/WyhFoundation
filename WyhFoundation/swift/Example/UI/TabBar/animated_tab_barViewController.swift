//
//  animated_tab_barViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//


import UIKit

enum animated_tab_barViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "给tabbar item增加动画效果的一个组件."
        case .topics:
            return "Swift UI module library for adding animation to iOS tabbar items and icons."
        case .demo:
            return "https://github.com/iOSwangyihan/animated-tab-bar"
        }
    }
}
class animated_tab_barViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [animated_tab_barViewControllerType.overview, animated_tab_barViewControllerType.topics, animated_tab_barViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? animated_tab_barViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? animated_tab_barViewControllerType ?? animated_tab_barViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = animated_tab_barDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
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


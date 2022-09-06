//
//  Reachability_swiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//


import UIKit

enum Reachability_swiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "用于替换苹果的 Reachability 类，可以方便地检测当前是否联网以及具体的联网状态"
        case .topics:
            return "Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.\nIt is compatible with iOS (8.0 - 12.0), OSX (10.9 - 10.14) and tvOS (9.0 - 12.0)\nInspired by https://github.com/tonymillion/Reachability"
        case .demo:
            return "https://github.com/iOSwangyihan/Reachability.swift"
        }
    }
}
class Reachability_swiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [Reachability_swiftViewControllerType.overview, Reachability_swiftViewControllerType.topics, Reachability_swiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? Reachability_swiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? Reachability_swiftViewControllerType ?? Reachability_swiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ReachabilityswiftDemoViewController()
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


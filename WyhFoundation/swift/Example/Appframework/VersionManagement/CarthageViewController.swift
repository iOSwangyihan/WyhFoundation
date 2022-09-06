//
//  CarthageViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//

import UIKit



import UIKit
enum CarthageViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "非常好用的类似CocoaPods的依赖库管理工具. "
        case .topics:
            return "Carthage is intended to be the simplest way to add frameworks to your Cocoa application.\nCarthage builds your dependencies and provides you with binary frameworks, but you retain full control over your project structure and setup. Carthage does not automatically modify your project files or your build settings."
        case .demo:
            return "https://github.com/iOSwangyihan/Carthage"
        }
    }
}
class CarthageViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CarthageViewControllerType.overview, CarthageViewControllerType.topics, CarthageViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CarthageViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CarthageViewControllerType ?? CarthageViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CarthageDemoViewController()
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


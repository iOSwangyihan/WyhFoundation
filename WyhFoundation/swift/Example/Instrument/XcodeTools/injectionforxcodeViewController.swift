//
//  injectionforxcodeViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//


import UIKit

enum injectionforxcodeViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Injection for Xcode：成吨的提高开发效率,使用说明."
        case .topics:
            return "Xcode is an integrated development environment (IDE) for macOS containing a suite of software development tools developed by Apple for developing software for macOS, iOS, iPadOS, watchOS, and tvOS. Injection for Xcode is an Xcode plugin (available via Alcatraz) or AppCode that dynamically inserts new Swift / Objective-C code into a running app in order to speed up your build process. It does this without making any changes to your project.\nAn up-to-date overview by Rob Norback of how to incorporate it into your workflow is here\nThis repo is no longer maintained. The current version of Injection is InjectionIII in the Mac App Store."
        case .demo:
            return "https://github.com/iOSwangyihan/injectionforxcode"
        }
    }
}
class injectionforxcodeViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [injectionforxcodeViewControllerType.overview, injectionforxcodeViewControllerType.topics, injectionforxcodeViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? injectionforxcodeViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? injectionforxcodeViewControllerType ?? injectionforxcodeViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = injectionforxcodeDemoViewController()
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


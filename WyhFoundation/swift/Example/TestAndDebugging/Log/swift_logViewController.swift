//
//  swift_logViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//


import UIKit

enum swift_logViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "A Logging API for Swift."
        case .topics:
            return "First things first: This is the beginning of a community-driven open-source project actively seeking contributions, be it code, documentation, or ideas. Apart from contributing to SwiftLog itself, there's another huge gap at the moment: SwiftLog is an API package which tries to establish a common API the ecosystem can use. To make logging really work for real-world workloads, we need SwiftLog-compatible logging backends which then either persist the log messages in files, render them in nicer colors on the terminal, or send them over to Splunk or ELK.\nWhat SwiftLog provides today can be found in the API docs."
        case .demo:
            return "https://github.com/iOSwangyihan/swift-log"
        }
    }
}
class swift_logViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [swift_logViewControllerType.overview, swift_logViewControllerType.topics, swift_logViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? swift_logViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? swift_logViewControllerType ?? swift_logViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = swift_logDemoViewController()
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


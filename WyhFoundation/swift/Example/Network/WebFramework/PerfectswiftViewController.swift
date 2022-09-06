//
//  PerfectswiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//




import UIKit

enum PerfectswiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Perfect 致力于 Swift 服务端应用，从打造专业应用服务器开始。Swift服务端编程：Perfect项目上手指南"
        case .topics:
            return "Perfect is a complete and powerful toolbox, framework, and application server for Linux, iOS, and macOS (OS X). It provides everything a Swift engineer needs for developing lightweight, maintainable, and scalable apps and other REST services entirely in the Swift programming language for both client-facing and server-side applications.\nPerfect includes a suite of tools that will enhance your productivity as you use only one programming language to build your apps: Swift. The global development community’s most dynamic and popular server-side toolbox and framework available today, Perfect is the backbone for many live web applications and apps available on iTunes.\nThis guide is designed for developers at all levels of experience to get Perfect up and running quickly."
        case .demo:
            return "https://github.com/iOSwangyihan/Perfect"
        }
    }
}
class PerfectswiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PerfectswiftViewControllerType.overview, PerfectswiftViewControllerType.topics, PerfectswiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PerfectswiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PerfectswiftViewControllerType ?? PerfectswiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PerfectswiftDemoViewController()
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


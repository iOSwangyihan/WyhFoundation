//
//  dnssdViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/7.
//





import UIKit
enum dnssdViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS10+\n发现、发布和解析局域网或广域网上的网络服务。。"
        case .topics:
            return "Structures:\nCompileTimeAssertionChecks_DNS_SD--"
        case .demo:
            return "Click here to example"
        }
    }
}
class dnssdViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [dnssdViewControllerType.overview, dnssdViewControllerType.topics, dnssdViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? dnssdViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? dnssdViewControllerType ?? dnssdViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = dnssdDemoViewController()
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







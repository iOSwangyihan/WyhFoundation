//
//  iBBS_SwiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//








import UIKit
enum iBBS_SwiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "“新手开源一个用Swift（2.0）写的论坛客户端”。BBS 服务端. "
        case .topics:
            return "A BBS client in Swift."
        case .demo:
            return "https://github.com/iOSwangyihan/iBBS-Swift"
        }
    }
}
class iBBS_SwiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [iBBS_SwiftViewControllerType.overview, iBBS_SwiftViewControllerType.topics, iBBS_SwiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? iBBS_SwiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? iBBS_SwiftViewControllerType ?? iBBS_SwiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = iBBS_SwiftDemoViewController()
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


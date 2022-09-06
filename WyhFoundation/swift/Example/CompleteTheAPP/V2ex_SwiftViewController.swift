//
//  V2ex_SwiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//







import UIKit
enum V2ex_SwiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "用 Swift 写的 V2EX 客户端 "
        case .topics:
            return "This's a 3rd-party app for V2EX , designed to make V2EX reading more friendly."
        case .demo:
            return "https://github.com/iOSwangyihan/V2ex-Swift"
        }
    }
}
class V2ex_SwiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [V2ex_SwiftViewControllerType.overview, V2ex_SwiftViewControllerType.topics, V2ex_SwiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? V2ex_SwiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? V2ex_SwiftViewControllerType ?? V2ex_SwiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = V2ex_SwiftDemoViewController()
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


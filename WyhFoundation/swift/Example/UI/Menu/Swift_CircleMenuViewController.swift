//
//  Swift_CircleMenuViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//




import UIKit

enum Swift_CircleMenuViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Swift-CircleMenu：一款圆盘式菜单,Rotating circle menu written in Swift 3"
        case .topics:
            return "A rotating circle menu written in Swift 3."
        case .demo:
            return "https://github.com/iOSwangyihan/Swift-CircleMenu"
        }
    }
}
class Swift_CircleMenuViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [Swift_CircleMenuViewControllerType.overview, Swift_CircleMenuViewControllerType.topics, Swift_CircleMenuViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? Swift_CircleMenuViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? Swift_CircleMenuViewControllerType ?? Swift_CircleMenuViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = Swift_CircleMenuDemoViewController()
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


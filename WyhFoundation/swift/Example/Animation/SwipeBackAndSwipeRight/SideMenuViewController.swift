//
//  SideMenuViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//





import UIKit

enum SideMenuViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "swift实现，一款带动画效果可定制 Slide Menu，可以学习其动画实现思路。P.S. 对于Hamburger式菜单，虽然很常用，不过，苹果并不鼓励使用，甚至有开发小组对其弊病用自家上线应用前后数据对比进行了抨击。"
        case .topics:
            return ""
        case .demo:
            return "https://github.com/iOSwangyihan/Side-Menu.iOS"
        }
    }
}
class SideMenuViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SideMenuViewControllerType.overview, SideMenuViewControllerType.topics, SideMenuViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SideMenuViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SideMenuViewControllerType ?? SideMenuViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SideMenuDemoViewController()
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


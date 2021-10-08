//
//  SocialViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/30.
//





import UIKit
enum SocialViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS6+\n使用标准系统接口将内容发布到受支持的社交网络服务。"
        case .topics:
            return "SLComposeServiceViewController--一个视图控制器，你从你的共享应用程序扩展，允许用户组成社会媒体帖子。\nSLComposeViewController--一个视图控制器，允许用户撰写社交媒体帖子。\nSLRequest--用于组装与社交媒体服务通信的HTTP请求的对象。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SocialViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SocialViewControllerType.overview, SocialViewControllerType.topics, SocialViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SocialViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SocialViewControllerType ?? SocialViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SocialDemoViewController()
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


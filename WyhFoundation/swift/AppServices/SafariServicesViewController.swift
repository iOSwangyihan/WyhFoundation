//
//  SafariServicesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//





import UIKit
enum SafariServicesViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS7+\n在你的应用程序中启用web视图和服务。"
        case .topics:
            return "SFSafariViewController--为浏览网页提供可见的标准界面的对象。\nSFAuthenticationSession.CompletionHandler--当用户取消或完成登录时，身份验证会话的完成处理程序。\nSSReadingList--用于向用户的Safari阅读列表中添加项的对象。\nSSReadingListErrorCode--描述Safari阅读列表错误的消息。\nSSReadingListError--Safari阅读列表错误。\nSFContentBlockerManager--应用程序用来与内容拦截器扩展交互的类。\nSFContentBlockerState--内容拦截器扩展的状态。\nSupporting Associated Domains--连接你的应用程序和网站，提供本地应用程序和浏览器体验。\nSFError--内容拦截器或Safari应用扩展错误。\nSFErrorCode--描述内容拦截器或Safari应用扩展错误的消息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SafariServicesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SafariServicesViewControllerType.overview, SafariServicesViewControllerType.topics, SafariServicesViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SafariServicesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SafariServicesViewControllerType ?? SafariServicesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SafariServicesDemoViewController()
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


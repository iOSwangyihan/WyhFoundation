//
//  VideoSubscriberAccountViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//


import UIKit
enum VideoSubscriberAccountViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS10+\n支持电视供应商和苹果电视应用程序功能。"
        case .topics:
            return "VSAccountManager--这个对象将你的应用程序的身份验证请求与电视提供商的身份验证服务进行协调。\nVSSubscription--描述订阅者对内容的访问的对象。。\nVSSubscriptionRegistrationCenter--存储系统提供给Apple TV应用程序的订阅信息的对象。\nVSError--框架错误域中的错误信息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class VideoSubscriberAccountViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [VideoSubscriberAccountViewControllerType.overview, VideoSubscriberAccountViewControllerType.topics, VideoSubscriberAccountViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? VideoSubscriberAccountViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? VideoSubscriberAccountViewControllerType ?? VideoSubscriberAccountViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = VideoSubscriberAccountDemoViewController()
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

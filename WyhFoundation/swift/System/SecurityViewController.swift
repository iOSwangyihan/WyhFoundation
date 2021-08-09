//
//  SecurityViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/9.
//



import UIKit
enum SecurityViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n保护应用程序管理的数据，并控制对应用程序的访问\n使用安全框架来保护信息、建立信任和控制对软件的访问。总的来说，保安服务支持以下目标:\n建立用户身份(身份验证)，然后有选择地授予对资源的访问权(授权)。\n保护磁盘上和网络连接中移动的数据。\n确保为特定目的执行的代码的有效性。\n如图1所示，您还可以使用较低级别的加密资源来创建新的安全服务。密码学是困难的，而且错误的成本通常很高，因此实现自己的密码学解决方案并不是一个好主意。当你在应用程序中需要加密时，依赖于Security框架。\n图1支持与用户、数据和代码进行安全交互的工具"
        case .topics:
            return "AuthorizationandAuthentication:\nPassword AutoFill--简化应用程序的登录和登机程序。\n\nEssentials:\napplinks--通用链接服务定义的根对象。\nUITextInputPasswordRules--表示文本输入字段密码规则的类。\nShared Web Credentials--在iOS应用程序和网站之间共享证书\nKeychain Services--代表用户安全地存储小块数据。\nPreventing Insecure Network Connections--通过依赖应用程序传输安全，在应用程序中加强安全的网络链接。。\nCertificate, Key, and Trust Services--使用证书和加密密钥建立信任。\nRandomization Services--生成加密安全的随机数。\nSecurity Framework Result Codes--评估许多安全框架函数共用的结果代码。\nSecure Transport--使用标准化传输层安全机制的安全网络通信。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SecurityViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SecurityViewControllerType.overview, SecurityViewControllerType.topics, SecurityViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SecurityViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SecurityViewControllerType ?? SecurityViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SecurityDemoViewController()
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

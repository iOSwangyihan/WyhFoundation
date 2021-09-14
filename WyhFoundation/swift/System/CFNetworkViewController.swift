//
//  CFNetworkViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/14.
//



import UIKit
enum CFNetworkViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n访问网络服务和处理网络配置的变化。构建在网络协议的抽象之上，以简化诸如使用BSD套接字、管理HTTP和FTP服务器以及管理Bonjour服务等任务。"
        case .topics:
            return "CFHost--表示CFHost对象的不透明引用。\nCFHostClientContext--一个结构，包含用户定义的数据和CFHost对象的回调。\nCFHTTPAuthentication--表示HTTP身份验证信息的不透明引用。\nCFHTTPMessage--表示HTTP消息的不透明引用。\nCFNetDiagnostic--表示CFNetDiagnostic的不透明引用。\nCFNetService--表示CFNetService的不透明引用。\nCFNetServiceBrowser--表示CFNetServiceBrowser的不透明引用。\nCFNetServiceBrowserFlags--\nCFNetServiceMonitor--服务监视器的不透明引用。\nCFNetServiceClientContext--当CFNetService与回调函数关联或创建CFNetServiceBrowser时提供的结构。\nCFNetServiceRegisterFlags--"
        case .demo:
            return "Click here to example"
        }
    }
}

class CFNetworkViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [CFNetworkViewControllerType.overview, CFNetworkViewControllerType.topics, CFNetworkViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CFNetworkViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CFNetworkViewControllerType ?? CFNetworkViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CompressionDemoViewController()
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









//
//  LocalAuthenticationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/26.
//






import UIKit
enum LocalAuthenticationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n通过生物识别或使用用户已知的密码对用户进行身份验证。。"
        case .topics:
            return "Authentication:\nLAContext--评估身份验证策略和访问控制的机制。\nLAError--由LocalAuthentication框架发出的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class LocalAuthenticationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [LocalAuthenticationViewControllerType.overview, LocalAuthenticationViewControllerType.topics, LocalAuthenticationViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? LocalAuthenticationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? LocalAuthenticationViewControllerType ?? LocalAuthenticationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = LocalAuthenticationDemoViewController()
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






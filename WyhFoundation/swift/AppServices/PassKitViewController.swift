//
//  PassKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//






import UIKit
enum PassKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS6+\n在您的应用程序中处理Apple Pay支付，并创建和分发钱包应用程序的通行证。"
        case .topics:
            return "Apple Pay--在你的应用程序中请求并处理Apple Pay支付。\nWallet--在钱包应用程序中管理机票、登机牌、支付卡和其他通行证。"
        case .demo:
            return "Click here to example"
        }
    }
}
class PassKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PassKitViewControllerType.overview, PassKitViewControllerType.topics, PassKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PassKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PassKitViewControllerType ?? PassKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PassKitDemoViewController()
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


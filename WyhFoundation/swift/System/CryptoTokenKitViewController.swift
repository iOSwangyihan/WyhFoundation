//
//  CryptoTokenKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/8.
//



import UIKit
enum CryptoTokenKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n访问安全令牌及其存储的加密资产。"
        case .topics:
            return "FirstSteps:\nTKTokenWatcher--跟踪系统中可用令牌的对象。\nTKTokenDriver--用于构建令牌驱动程序的抽象基类。。\nTKToken--基于硬件的密码令牌的表示。\nTKTokenSession--管理令牌身份验证状态的令牌会话。\nTKSmartCardTokenDriver--作为智能卡应用扩展的入口点的驱动程序。\nTKSmartCardToken--一种基于智能卡的密码令牌的表示。\nTKSmartCardTokenSession--基于智能卡令牌的令牌会话。\nTKSmartCard--智能卡的一种表示。\nTKSmartCardSlot--系统中只有一个智能卡读卡器插槽。\nTKSmartCardSlotManager--所有可用的智能卡读卡器插槽的接口。\nTKError--特定于CryptoTokenKit框架的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}

class CryptoTokenKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [CryptoTokenKitViewControllerType.overview, CryptoTokenKitViewControllerType.topics, CryptoTokenKitViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CryptoTokenKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CryptoTokenKitViewControllerType ?? CryptoTokenKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CryptoTokenKitDemoViewController()
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









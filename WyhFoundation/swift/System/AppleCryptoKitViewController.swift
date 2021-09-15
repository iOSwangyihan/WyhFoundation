//
//  AppleCryptoKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//



import UIKit
enum AppleCryptoKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n安全高效地执行密码操作。"
        case .topics:
            return "HashFunction--执行加密安全散列的类型。\nSHA512--使用512位摘要实现安全哈希算法2 (SHA-2)哈希。\nDigest--表示散列输出的类型。\nSHA384--具有384位摘要的安全哈希算法2 (SHA-2)哈希的实现。\nSHA256--具有256位摘要的安全哈希算法2 (SHA-2)哈希的实现。\nHMAC--基于散列的消息验证算法。\nSymmetricKey--对称密码密钥。\nSharedSecret--密钥协议的结果，您可以从中派生对称加密密钥。\nHKDF--"
        case .demo:
            return "Click here to example"
        }
    }
}

class AppleCryptoKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [AppleCryptoKitViewControllerType.overview, AppleCryptoKitViewControllerType.topics, AppleCryptoKitViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AppleCryptoKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AppleCryptoKitViewControllerType ?? AppleCryptoKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AppleCryptoKitDemoViewController()
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









//
//  MessageUIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//




import UIKit
enum MessageUIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS3+\n创建一个用户界面来编写电子邮件和文本信息，这样用户就可以编辑和发送信息，而无需离开你的应用程序。"
        case .topics:
            return "MFMailComposeViewController--标准视图控制器，其界面允许用户管理、编辑和发送电子邮件消息。\nMFMessageComposeViewController--一个标准的视图控制器，它的接口允许用户编写和发送SMS或MMS消息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class MessageUIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MessageUIViewControllerType.overview, MessageUIViewControllerType.topics, MessageUIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MessageUIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MessageUIViewControllerType ?? MessageUIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MessageUIDemoViewController()
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


//
//  MessagesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//




import UIKit
enum MessagesViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS10+\n创建允许用户发送文本、贴纸、媒体文件和交互式消息的应用程序扩展。"
        case .topics:
            return "MSStickerBrowserViewController--为标准贴纸浏览器提供动态内容的视图控制器。\nMSStickerBrowserView--一个显示动态生成的贴纸列表的浏览器视图。\nMSStickerView--用于显示贴纸的视图。\nMSStickerSize--浏览器视图中贴纸的大小。\nMSMessagesAppViewController--iMessage应用的主视图控制器。\nMSMessagesAppTranscriptPresentation--支持在消息应用程序的文本中显示实时消息的协议。\nMSMessagesAppPresentationStyle--描述iMessage应用外观的演示样式。\nMSConversation--表示Messages应用程序中的对话的对象。\nMSSticker--一种贴纸，可以作为新消息发送，也可以附加到Messages应用程序的文字记录中已有的气球上。\nMSMessage--自定义消息对象。\nMSSession--用于创建和更新消息的会话对象。\nMSMessageLayout--抽象基类，定义会话记录中MSMessage对象的外观。\nMSMessageTemplateLayout--用于定制消息的基于模板的布局。\nMSMessageLiveLayout--在文本内部提供自定义交互式视图的布局。\nMSMessageErrorCode--由Messages框架生成的NSError对象中使用的错误代码。"
        case .demo:
            return "Click here to example"
        }
    }
}
class MessagesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MessagesViewControllerType.overview, MessagesViewControllerType.topics, MessagesViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MessagesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MessagesViewControllerType ?? MessagesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MessagesDemoViewController()
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


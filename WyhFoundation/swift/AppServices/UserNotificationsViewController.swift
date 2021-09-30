//
//  UserNotificationsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//




import UIKit
enum UserNotificationsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS10+\n从服务器将面向用户的通知推送到用户的设备，或者从本地应用生成它们。"
        case .topics:
            return "UNUserNotificationCenter--用于管理应用程序或应用程序扩展的通知相关活动的中心对象。\nUNUserNotificationCenterDelegate--用于处理传入通知和通知相关操作的接口。\nUNNotificationSettings--用于管理应用程序的通知相关设置和授权状态的对象。\nUNNotificationRequest--调度本地通知的请求，其中包括通知的内容和传递的触发条件。\nUNNotification--系统传递给应用程序的本地或远程通知的数据。\nUNNotificationContentProviding--系统用来提供与用户通知相关的上下文的协议。\nUNNotificationActionIcon--与动作相关联的图标。\nUNMutableNotificationContent--通知的可编辑内容。\nUNNotificationContent--通知中不可编辑的内容。\nUNNotificationAttachment--与通知相关联的媒体文件。\nUNNotificationSound--在发送通知时播放的声音。\nUNNotificationSoundName--提供声音文件名称的字符串。\nUNCalendarNotificationTrigger--一种触发条件，导致系统在特定日期和时间发送通知。\nUNTimeIntervalNotificationTrigger--一种触发条件，它使系统在指定的时间过后交付通知。\nUNLocationNotificationTrigger--当用户的设备进入或退出指定的地理区域时，导致系统发送通知的触发条件。\nUNPushNotificationTrigger--指示Apple Push Notification Service (APNs)已发送通知的触发条件。\nUNNotificationTrigger--子类触发传递本地或远程通知的常见行为。\nUNNotificationCategory--应用程序支持的通知类型和系统显示的自定义操作。\nUNNotificationAction--应用程序为响应系统发送的通知而执行的任务。\nUNTextInputNotificationAction--接受用户输入文本的操作。\nUNNotificationResponse--用户对可操作通知的响应。\nUNTextInputNotificationResponse--用户对可操作通知的响应，包括用户输入或指定的任何自定义文本。\nUNNotificationServiceExtension--在将远程通知交付给用户之前修改其内容的对象。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class UserNotificationsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [UserNotificationsViewControllerType.overview, UserNotificationsViewControllerType.topics, UserNotificationsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? UserNotificationsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? UserNotificationsViewControllerType ?? UserNotificationsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = UserNotificationsDemoViewController()
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


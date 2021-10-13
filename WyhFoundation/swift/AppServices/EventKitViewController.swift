//
//  EventKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/13.
//






import UIKit
enum EventKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n创建、查看和编辑日历和提醒事件。"
        case .topics:
            return "EKEventStore--访问用户的日历事件和提醒并支持新事件的调度的对象。\nEKEvent--表示日历中的事件的类。。\nEKReminder--在日历中表示提醒的类。\nEKCalendar--在EventKit中表示日历的类。\nEKParticipant--表示日历事件中的参与者的类。\nEKRecurrenceDayOfWeek--代表星期几的一类。\nEKRecurrenceEnd--定义递归规则结束的类。\nEKRecurrenceRule--描述重复事件的重复模式的类。\nEKAlarm--表示警报的类。\nEKStructuredLocation--一个类，它指定一个触发日历项警报的地理间隔。\nEKCalendarItem--用于日历事件和提醒的抽象超类。\nEKObject--一个抽象超类，用于所有具有持久实例的EventKit类。\nEKSource--表示日历所属帐户的抽象超类。\nEKVirtualConferenceProvider--将虚拟会议详细信息与用户日程表中的事件对象关联的对象。\nEKVirtualConferenceDescriptor--使用自定义房间类型的虚拟会议的详细信息。\nEKVirtualConferenceRoomTypeDescriptor--关于举行虚拟会议的房间的细节\nEKError--一个EventKit错误。\nEKError.Code--EventKit错误的错误代码\nEKErrorDomain--标识EventKit错误域的字符串。"
        case .demo:
            return "Click here to example"
        }
    }
}
class EventKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [EventKitViewControllerType.overview, EventKitViewControllerType.topics, EventKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? EventKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? EventKitViewControllerType ?? EventKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = EventKitDemoViewController()
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


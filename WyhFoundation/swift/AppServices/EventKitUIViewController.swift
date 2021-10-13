//
//  EventKitUIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/13.
//






import UIKit
enum EventKitUIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n显示一个查看、选择和编辑日历事件和提醒的界面。"
        case .topics:
            return "EKEventViewController--一个视图控制器，用于显示现有的日历和提醒事件，以及可选地编辑这些事件。\nEKEventEditViewController--用于创建、编辑和删除日历事件的视图控制器。\nEKCalendarChooser--一个视图控制器，用于确定用户是否可以选择一个或多个日历。\nEventKitUIBundle()--用于访问应用包中的资源。"
        case .demo:
            return "Click here to example"
        }
    }
}
class EventKitUIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [EventKitUIViewControllerType.overview, EventKitUIViewControllerType.topics, EventKitUIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? EventKitUIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? EventKitUIViewControllerType ?? EventKitUIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = EventKitUIDemoViewController()
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


//
//  BackgroundTasksViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//


import UIKit
enum BackgroundTasksViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n请求系统在后台启动应用程序来运行任务。"
        case .topics:
            return "BGTaskScheduler--一个用于调度在后台启动应用程序的任务请求的类。\nBGProcessingTaskRequest--在后台启动应用程序以执行可能需要几分钟才能完成的处理任务的请求。\nBGAppRefreshTaskRequest--在后台启动应用程序以执行短刷新任务的请求。\nBGTaskRequest--表示任务请求的抽象类。\nBGProcessingTask--当应用程序在后台运行时，一个耗时的处理任务。\nBGAppRefreshTask--一个对象，表示一个短任务，通常用于刷新应用程序在后台运行的内容\nBGTask--一个抽象类，表示当应用程序在后台时运行的任务。"
        case .demo:
            return "Click here to example"
        }
    }
}
class BackgroundTasksViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BackgroundTasksViewControllerType.overview, BackgroundTasksViewControllerType.topics, BackgroundTasksViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? BackgroundTasksViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? BackgroundTasksViewControllerType ?? BackgroundTasksViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = BackgroundTasksDemoViewController()
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


//
//  ScreenTimeViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
import ScreenTime
enum ScreenTimeViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:\n共享和管理web使用数据，并观察父母或监护人所做的更改.\n屏幕时间框架为您提供了您需要的工具，以帮助父母和监护人监督他们的孩子的网络使用。\n使用这个框架:1.网络使用数据报告。\n2.删除历史。\n3.当父或监护人阻止一个URL或开始执行子限制时采取行动."
        case .topics:
            return "Essentials:\nSTWebpageController--用于报告web使用情况和阻止受限网页的控制器.\nConfiguration Queries:\nSTScreenTimeConfigurationObserver--用于观察对当前配置的更改的对象.\nSTScreenTimeConfiguration--该设备的配置.\nWeb-Usage Data Deletion:\nSTWebHistory--用于删除web使用数据的对象."
        case .demo:
            return "Click here to example"
        }
    }
}
class ScreenTimeViewController: SwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ScreenTimeViewControllerType.overview, ScreenTimeViewControllerType.topics, ScreenTimeViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ScreenTimeViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ScreenTimeViewControllerType ?? ScreenTimeViewControllerType.overview
        if type == .demo {
            let vc = ScreenTimeDemoViewController()
            
            self.navigationController?.pushViewController(vc, animated: true)
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

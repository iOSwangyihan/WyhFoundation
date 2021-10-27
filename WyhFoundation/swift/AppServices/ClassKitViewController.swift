//
//  ClassKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//




import UIKit
enum ClassKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11.4+\n允许教师从您的应用程序的内容中分配活动，并查看学生的进度"
        case .topics:
            return "CLSDataStore--一个存放应用程序中所有ClassKit数据的容器。\nCLSContext--应用程序中代表可分配任务的区域，如测验或章节。\nCLSContextProvider--一个接口，用来告诉你的ClassKit上下文提供程序应用扩展更新上下文。\nCLSActivity--用户与上下文交互的表示。\nCLSScoreItem--表示超出可能的最大值的分数的活动信息。\nCLSBinaryItem--活动信息为真或假、通过或失败、是或否。\nCLSQuantityItem--表示数量的活动信息。\nCLSActivityItem--用于收集有关活动的信息的抽象基类\nCLSError--ClassKit发出的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class ClassKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ClassKitViewControllerType.overview, ClassKitViewControllerType.topics, ClassKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ClassKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ClassKitViewControllerType ?? ClassKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ClassKitDemoViewController()
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


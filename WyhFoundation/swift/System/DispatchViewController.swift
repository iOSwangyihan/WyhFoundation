//
//  DispatchViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/8.
//




import UIKit
enum DispatchViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n通过提交工作到由系统管理的调度队列，在多核硬件上并发执行代码。"
        case .topics:
            return "QueuesandTasks:\nDispatchQueue--一个在你的应用程序的主线程或后台线程上串行或并发地管理任务执行的对象。\nDispatchWorkItem--您想要执行的工作，以允许附加完成句柄或执行依赖项的方式封装。\nDispatchGroup--作为单个单元监视的一组任务。\nDispatchQoS--应用于任务的服务质量或执行优先级。\nDispatchSource--协调特定低级系统事件(如文件系统事件、计时器和UNIX信号)处理的对象。\nDispatchIO--使用基于流或随机访问语义管理文件描述符上的操作的对象。\n\nDispatchData--管理基于内存的数据缓冲区并将其公开为连续内存块的对象。\nDispatchDataIterator--在分派数据对象的内容上逐字节迭代器\nDispatchSourceProtocol--定义一组与所有分派源类型共享的公共属性和方法。\nDispatchSemaphore--一个对象，它通过使用传统的计数信号量来控制跨多个执行上下文中对资源的访问。\nDispatchTime--相对于默认时钟的一个时间点，具有纳秒精度。\nDispatchWallTime--根据挂钟的绝对时间点，精确到微秒。\nDispatchObject--大多数分派类型的基类。"
        case .demo:
            return "Click here to example"
        }
    }
}

class DispatchViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [DispatchViewControllerType.overview, DispatchViewControllerType.topics, DispatchViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? DispatchViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? DispatchViewControllerType ?? DispatchViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = DispatchDemoViewController()
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








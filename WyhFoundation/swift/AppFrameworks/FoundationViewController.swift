//
//  FoundationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//




import UIKit
enum FoundationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n访问基本的数据类型、集合和操作系统服务来定义应用程序的基本功能层。"
        case .topics:
            return "Numbers, Data, and Basic Values--处理整个Cocoa中使用的原始值和其他基本类型。\nStrings and Text--创建和处理Unicode字符字符串，使用正则表达式查找模式，并执行文本的自然语言分析。\nCollections--使用数组、字典、集合和专门的集合来存储和迭代对象或值组。\nDates and Times--比较日期和时间，并执行日历和时区计算。\nUnits and Measurement--用物理维度标记数字数量，以允许在相关单位之间进行区域感知的格式化和转换。\nData Formatting--将数字、日期、度量值和其他值与支持区域设置的字符串表示形式进行转换。\nFilters and Sorting--使用谓词、表达式和排序描述符检查集合和其他服务中的元素。\nTask Management--管理你的应用程序的工作，以及它如何与系统服务交互，如切换和快捷方式。\nResources--访问与应用程序绑定的资产和其他数据。\nNotifications--广播信息和订阅广播的设计模式。\nApp Extension Support--管理应用程序扩展和它的宿主应用程序之间的交互。\nErrors and Exceptions--在与api的交互中响应问题情况，并微调应用程序以更好地调试。\nFile System--创建、读取、写入和检查文件系统中的文件和文件夹。\nArchives and Serialization--在属性列表、JSON和其他平面二进制表示之间转换对象和值。\nPreferences--持续存储域范围内的信息片段，用于配置应用程序。\nSpotlight--在本地设备上搜索文件和其他项目，并索引应用程序的内容进行搜索。\niCloud--管理文件和键值数据，自动同步用户的iCloud设备。\nURL Loading System--与url交互，并使用标准Internet协议与服务器通信。\nXPC--管理安全的进程间通信。\nObject Runtime--获得对基本Objective-C特性、Cocoa设计模式和Swift集成的低级支持。\nProcesses and Threads--管理您的应用程序与主机操作系统和其他进程的交互，并实现低级并发特性。\nStreams, Sockets, and Ports--使用低级Unix功能来管理文件、进程和网络之间的输入和输出。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class FoundationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [FoundationViewControllerType.overview, FoundationViewControllerType.topics, FoundationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? FoundationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? FoundationViewControllerType ?? FoundationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = FoundationDemoViewController()
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


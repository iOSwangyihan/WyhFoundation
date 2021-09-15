//
//  CoreMediaDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//






import UIKit
enum CoreMediaDemoViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n用基本数据类型表示基于时间的视听资产。"
        case .topics:
            return "CMSampleBuffer--包含零个或多个统一媒体类型的媒体样本的对象。\nCMBlockBuffer--用来在处理系统中移动内存块的一种对象。\nCMFormatDescription--一种媒体格式描述符，用于描述样本缓冲区中的样本。\nCMAttachment--用于将额外的元数据附加到示例缓冲区的API。\nCMTime--表示时间值(如时间戳或持续时间)的结构体。\nCMTimeRange--一种表示时间范围的结构。\nCMTimeMapping--一种结构体，用于指定一个时间线段到另一个时间线段的映射。\nCMClock--用于同步应用程序和设备的参考时钟。\nCMAudioClock--用于与声源同步的专用参考时钟。局域网\nCMTimebase--在应用程序控制下的时间轴模型。\nCMTextMarkup--Core Media支持的文本标记相关属性的集合。\nCMMetadata--用于使用框架的元数据标识符服务和元数据数据类型注册表的api。\nCMSimpleQueue--一个简单的(void *)元素的无锁FIFO队列。\nCMBufferQueue--定时缓冲区的队列。\nCMMemoryPool--一种用于优化内存分配的池，用于必须重复分配、释放、然后重新分配大块内存。\nCore Media Constants--本文档描述了在Core Media框架中定义的常量，在本引用中没有定义。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreMediaDemoViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreMediaDemoViewControllerType.overview, CoreMediaDemoViewControllerType.topics, CoreMediaDemoViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreMediaDemoViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreMediaDemoViewControllerType ?? CoreMediaDemoViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreMediaDemoViewController()
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


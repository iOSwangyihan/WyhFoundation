//
//  WidgetKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//









import UIKit
enum WidgetKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n在iOS主屏幕或macOS通知中心显示相关的、可浏览的内容。"
        case .topics:
            return "Widget--要在主屏幕或通知中心中显示的小部件的配置和内容。\nWidgetBundle--用于从单个小部件扩展公开多个小部件的容器。\nStaticConfiguration--描述没有用户可配置选项的小部件内容的对象。\nWidgetFamily--小部件使用的模板大小调整。\nIntentConfiguration--描述小部件内容的对象，该小部件使用自定义意图定义来提供用户可配置选项。\nWidgetInfo--包含有关用户配置的小部件的信息的结构。\nTimelineProvider--一种类型，用于通知WidgetKit何时更新小部件的显示。。\nIntentTimelineProvider--一种类型，它建议WidgetKit何时更新用户可配置小部件的显示。。\nTimelineProviderContext--一个对象，它包含关于小部件如何呈现的详细信息，包括它的大小以及它是否出现在小部件库中。\nTimelineEntry--指定显示小部件的日期的类型，还可以指示小部件内容的当前相关性。\nTimeline--一个对象，它指定WidgetKit更新小部件视图的日期。\nWidgetCenter--一个对象，包含用户配置的小部件列表，用于重新加载小部件时间线。。\nSwiftUI Views--用SwiftUI视图在小部件中显示应用程序的内容。\nTimelineEntryRelevance--一个对象，用于描述时间轴条目相对于当前和过去时间轴中的其他条目的相对重要性。\nWidgetPreviewContext--小部件预览上下文的规范。"
        case .demo:
            return "Click here to example"
        }
    }
}
class WidgetKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [WidgetKitViewControllerType.overview, WidgetKitViewControllerType.topics, WidgetKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? WidgetKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? WidgetKitViewControllerType ?? WidgetKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = WidgetKitDemoViewController()
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


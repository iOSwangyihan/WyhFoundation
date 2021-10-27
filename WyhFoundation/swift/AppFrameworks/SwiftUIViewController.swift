//
//  SwiftUIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//



import UIKit
enum SwiftUIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n在每个平台上声明应用程序的用户界面和行为。"
        case .topics:
            return "App Structure and Behavior--定义应用程序的入口点和顶级组织。\nViews and Controls--在屏幕上显示内容并处理用户交互。\nView Layout and Presentation--在堆栈中组合视图，动态生成组和视图列表，并定义视图表示和层次结构。\nDrawing and Animation--用颜色、形状和阴影增强视图，并自定义视图状态之间的动画过渡。。\nFramework Integration--将swifttui视图集成到现有的应用程序中，并将AppKit, UIKit, WatchKit视图和控制器嵌入到swifttui视图层次结构中。\nState and Data Flow--控制和响应应用程序模型中的数据流和更改。\nGestures--定义从点击、点击和滑动到细粒度手势的交互。\nPreviews in Xcode--生成自定义视图的动态、交互式预览\nDeveloperToolsSupport--暴露Xcode库中的自定义视图和修改器。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SwiftUIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SwiftUIViewControllerType.overview, SwiftUIViewControllerType.topics, SwiftUIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SwiftUIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SwiftUIViewControllerType ?? SwiftUIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SwiftUIDemoViewController()
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


//
//  UIKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//


import UIKit
enum UIKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n为你的iOS或tvOS应用程序构建和管理图形化、事件驱动的用户界面。"
        case .topics:
            return "App and Environment--管理生命周期事件和应用程序的UI场景，并获取有关特性和应用程序运行环境的信息。\nDocuments, Data, and Pasteboard--组织应用程序的数据，并在粘贴板上分享这些数据。\nResource Management--管理用于实现应用程序界面的图片、字符串、故事板和nib文件。\nApp Extensions--将应用程序的基本功能扩展到系统的其他部分。\nInterprocess Communication--向用户显示基于活动的服务\nTouches, Presses, and Gestures--将应用程序的事件处理逻辑封装在手势识别器中，这样你就可以在整个应用程序中重用这些代码。。\nDrag and Drop--通过使用与视图交互的api将拖放拖放到应用程序中。\nPointer Interactions--在自定义控件和视图中支持指针交互。\nPencil Interactions--在Apple Pencil上处理双击用户交互。\nFocus-Based Navigation--使用遥控器、游戏控制器或键盘来导航你的UIKit应用程序的界面。\nMenus and Shortcuts--使用菜单系统、上下文菜单、主屏幕快速操作和键盘快捷键简化与应用程序的交互。\nAccessibility for UIKit--让每个使用iOS和tvOS的人都能访问你的UIKit应用。\nViews and Controls--在屏幕上显示内容，并定义与该内容允许的交互。\nView Controllers--使用视图控制器管理你的界面，并促进应用程序内容的导航。\nView Layout--使用堆栈视图来自动布局界面的视图。当需要精确放置视图时，使用Auto Layout。\nAppearance Customization--为你的应用程序添加黑暗模式支持，自定义栏的外观，并使用外观代理来修改你的UI。\nAnimation and Haptics--使用基于视图的动画和触觉向用户提供反馈\nWindows and Screens--为视图层次结构和其他内容提供一个容器。\nImages and PDF--创建和管理图像，包括使用位图和PDF格式的图像。\nDrawing--使用颜色、渲染器、绘制路径、字符串和阴影配置应用程序的绘图环境。\nPrinting--显示系统打印面板和管理打印过程。\nText Display and Fonts--显示文本，管理字体，检查拼写。\nTextKit--管理文本存储，并在应用的视图中执行基于文本的内容的自定义布局。\nKeyboards and Input--配置系统键盘，创建自己的键盘来处理输入，或检测物理键盘上的按键\nHandwriting Recognition--配置文本字段和自定义视图，接受文本以处理来自Apple Pencil的输入。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class UIKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [UIKitViewControllerType.overview, UIKitViewControllerType.topics, UIKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? UIKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? UIKitViewControllerType ?? UIKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = UIKitDemoViewController()
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


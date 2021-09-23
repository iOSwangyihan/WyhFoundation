//
//  PencilKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/23.
//



import UIKit
enum PencilKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n捕获触摸和苹果铅笔输入作为绘图，并从您的应用程序显示内容。"
        case .topics:
            return "PKCanvasView--一个捕捉Apple Pencil输入并在iOS应用程序中显示渲染结果的视图。\nPKDrawing--表示由画布视图捕获的绘图信息的结构。\nPKStroke--表示绘制在画布上的笔画的路径、边界和其他属性的一种结构。\nPKStrokePath--一种结构，它捕获笔画的组成部分，并提供沿着笔画路径查找和插值点的方法。\nPKStrokePoint--一种结构，表示沿笔画路径的特定点的属性。\nPKInk--表示指定其类型、颜色和宽度的墨水的结构。\nPKToolPicker--工具调色板，显示绘图工具的选择以及工具的颜色和用户可以选择的颜色。\nPKInkingTool--一种结构，它定义在画布视图上绘制线条时要使用的绘制特征(宽度、颜色、钢笔样式)。\nPKEraserTool--用于擦除画布视图中先前绘制的内容的工具。\nPKLassoTool--在画布视图中选择描边线条和形状的工具。\nPKTool--一个由canvas视图使用的绘图和书写工具所采用的界面。"
        case .demo:
            return "Click here to example"
        }
    }
}
class PencilKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PencilKitViewControllerType.overview, PencilKitViewControllerType.topics, PencilKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PencilKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PencilKitViewControllerType ?? PencilKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PencilKitDemoViewController()
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


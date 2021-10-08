//
//  QuickLookViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//





import UIKit
enum QuickLookViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n创建文件预览，在你的应用程序中使用，或执行简单的编辑预览。"
        case .topics:
            return "QLPreviewController--用于预览项目的专用视图控制器。\nQLPreviewItem--一个协议，它定义了要实现的属性，使应用程序的内容在预览中可见。\nQLPreviewingController--用于实现自定义控制器来创建文件预览的协议。"
        case .demo:
            return "Click here to example"
        }
    }
}
class QuickLookViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [QuickLookViewControllerType.overview, QuickLookViewControllerType.topics, QuickLookViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? QuickLookViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? QuickLookViewControllerType ?? QuickLookViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = QuickLookDemoViewController()
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


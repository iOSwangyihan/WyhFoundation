//
//  RichEditorViewViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//



import UIKit

enum RichEditorViewViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "swift，一套可定制富文本编辑器组件及示例。功能完整、代码简练、实现逻辑巧妙（编辑器核心与 WebView 结合，采用 HTML5 contentEditable 编辑模式，执行JS 配套命令 execCommand 实现富文本编辑功能）。"
        case .topics:
            return "RichEditorView is a simple, modular, drop-in UIView subclass for Rich Text Editing."
        case .demo:
            return "https://github.com/iOSwangyihan/RichEditorView"
        }
    }
}
class RichEditorViewViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [RichEditorViewViewControllerType.overview, RichEditorViewViewControllerType.topics, RichEditorViewViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? RichEditorViewViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? RichEditorViewViewControllerType ?? RichEditorViewViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = RichEditorViewDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
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


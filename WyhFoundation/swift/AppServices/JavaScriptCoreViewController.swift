//
//  JavaScriptCoreViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/11.
//



import UIKit
enum JavaScriptCoreViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS7+\n从应用程序内部评估JavaScript程序，并支持应用程序的JavaScript脚本。"
        case .topics:
            return "JSVirtualMachine--一个自包含的JavaScript执行环境。\nJSContext--JavaScript执行环境。\nJSValue--一个JavaScript的价值。\nJSManagedValue--有条件保留行为的JavaScript值提供自动内存管理。\nJSExport--将Objective-C对象导出到JavaScript的协议。\nC JavaScriptCore API--浏览JavaScriptCore的其他基于c语言的api。"
        case .demo:
            return "Click here to example"
        }
    }
}
class JavaScriptCoreViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [JavaScriptCoreViewControllerType.overview, JavaScriptCoreViewControllerType.topics, JavaScriptCoreViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? JavaScriptCoreViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? JavaScriptCoreViewControllerType ?? JavaScriptCoreViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = JavaScriptCoreDemoViewController()
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


//
//  SwiftFrameworkViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//



import UIKit
enum SwiftFrameworkViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n使用强大的开放语言构建应用程序。"
        case .topics:
            return "Int--有符号整数值类型。\nDouble--双精度浮点值类型。\nString--一个Unicode字符串值，它是字符的集合。\nArray--有序的，随机存取的集合。\nDictionary--元素是键值对的集合\nSwift Standard Library--解决复杂的问题，编写高性能、可读的代码。\nAsyncStream--有序的、异步生成的元素序列。\nSwift Standard Library Functions--介绍Swift标准库中定义的全局函数。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SwiftFrameworkViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SwiftFrameworkViewControllerType.overview, SwiftFrameworkViewControllerType.topics, SwiftFrameworkViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SwiftFrameworkViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SwiftFrameworkViewControllerType ?? SwiftFrameworkViewControllerType.overview
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


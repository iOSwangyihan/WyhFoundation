//
//  SystemFrameworkViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/25.
//

import UIKit
enum SystemFrameworkViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14\n使用类型安全api执行低级文件操作。"
        case .topics:
            return "Adopting System:\nAdopting Swift File Operations--使用System模块提供的文件操作，将现有的C代码迁移到Swift。\nAdopting Swift File Options--使用System模块提供的文件操作选项，将现有的C代码迁移到Swift。\nAdopting Swift Error Constants--使用System模块提供的错误常量，将现有的C代码迁移到Swift。\n\nFiles:\nFileDescriptor--输入或输出数据资源(如文件或套接字)的抽象句柄\nFilePath--一个以空结束的字节序列，表示文件系统中的一个位置。\nFilePermissions--文件的访问权限。\n\nErrors:\nErrno--系统调用用于通信发生的错误类型的错误编号"
        case .demo:
            return "Click here to example"
        }
    }
}
class SystemFrameworkViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SystemFrameworkViewControllerType.overview, SystemFrameworkViewControllerType.topics, SystemFrameworkViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SystemFrameworkViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SystemFrameworkViewControllerType ?? SystemFrameworkViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SystemDemoViewController()
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

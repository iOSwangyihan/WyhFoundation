//
//  FileProviderUIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/12.
//





import UIKit
enum FileProviderUIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n向文档浏览器的上下文菜单添加操作。"
        case .topics:
            return "FPUIActionExtensionViewController--用于执行选定操作的自定义用户界面。\nFPUIExtensionErrorCode--文件提供程序UI扩展所引发的错误的错误代码。\nFPUIErrorDomain--由文件提供程序UI扩展引发的错误的错误域。"
        case .demo:
            return "Click here to example"
        }
    }
}
class FileProviderUIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [FileProviderUIViewControllerType.overview, FileProviderUIViewControllerType.topics, FileProviderUIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? FileProviderUIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? FileProviderUIViewControllerType ?? FileProviderUIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = FileProviderUIDemoViewController()
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


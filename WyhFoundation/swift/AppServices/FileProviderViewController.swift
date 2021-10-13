//
//  FileProviderViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/12.
//






import UIKit
enum FileProviderViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n其他应用程序使用的扩展，以访问文件和文件夹管理的应用程序，并与远程存储同步。"
        case .topics:
            return "NSFileProviderExtension--文件提供程序扩展的主体类。\nNSFileProviderManager--一个管理器对象，用于从应用程序或文件提供程序扩展名与文件提供程序通信。\nNSFileProviderItem--文件提供程序扩展名管理的项。。\nNSFileProviderItemProtocol--定义由“文件提供程序”扩展名管理的项的属性的协议。\nNSFileProviderItemIdentifier--由文件提供程序扩展名管理的项的唯一标识符。\nNSFileProviderItemCapabilities--项的功能，它定义用户可以在文档浏览器中执行的操作。\nContent and Change Tracking--创建枚举器以指定文件提供程序的内容，并跟踪对该内容的更改。\nNSFileProviderError--包含有关文件提供程序错误的信息的结构。\nNSFileProviderErrorDomain--文件提供程序扩展名的错误域。\nNSFileProviderErrorItemKey--访问同步相关错误信息的键。\nNSFileProviderErrorNonExistentItemIdentifierKey--当指定项不存在时，用于访问该项标识符的键。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class FileProviderViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [FileProviderViewControllerType.overview, FileProviderViewControllerType.topics, FileProviderViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? FileProviderViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? FileProviderViewControllerType ?? FileProviderViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = FileProviderDemoViewController()
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


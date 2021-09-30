//
//  DeveloperToolsSupportViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//









import UIKit
enum DeveloperToolsSupportViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n暴露Xcode库中的自定义视图和修改器。"
        case .topics:
            return "LibraryContentProvider--Xcode库和代码完成内容的源代码。\nLibraryItem--要添加到Xcode库的单一项。"
        case .demo:
            return "Click here to example"
        }
    }
}
class DeveloperToolsSupportViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [DeveloperToolsSupportViewControllerType.overview, DeveloperToolsSupportViewControllerType.topics, DeveloperToolsSupportViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? DeveloperToolsSupportViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? DeveloperToolsSupportViewControllerType ?? DeveloperToolsSupportViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = DeveloperToolsSupportDemoViewController()
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


//
//  CoreLocationUIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/15.
//





import UIKit
enum CoreLocationUIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS15+\n通过一个标准的、安全的UI简化对用户位置数据的访问。"
        case .topics:
            return "LocationButton--授予一次性位置授权的SwiftUI按钮。\nCLLocationButton--授予一次性位置授权的按钮。\nCoreLocationUIVersionNumber--CoreLocationUI的项目版本号。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreLocationUIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreLocationUIViewControllerType.overview, CoreLocationUIViewControllerType.topics, CoreLocationUIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreLocationUIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreLocationUIViewControllerType ?? CoreLocationUIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreLocationUIDemoViewController()
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


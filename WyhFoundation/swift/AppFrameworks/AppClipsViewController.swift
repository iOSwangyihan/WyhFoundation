//
//  AppClipsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/28.
//




import UIKit
enum AppClipsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n为用户提供选择内容和应用功能的快捷方式。"
        case .topics:
            return "APActivationPayload--在启动时传递给App Clip的信息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AppClipsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AppClipsViewControllerType.overview, AppClipsViewControllerType.topics, AppClipsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AppClipsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AppClipsViewControllerType ?? AppClipsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AppClipsDemoViewController()
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


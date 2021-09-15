//
//  MediaSetupViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum MediaSetupViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n允许用户配置HomePod扬声器直接从您的媒体服务流音乐。"
        case .topics:
            return "MSSetupSession--一个对象，用于管理应用程序、系统、媒体服务和HomePod音箱之间的配置信息传输。\nMSServiceAccount--访问流媒体服务的帐户详细信息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class MediaSetupViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MediaSetupViewControllerType.overview, MediaSetupViewControllerType.topics, MediaSetupViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MediaSetupViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MediaSetupViewControllerType ?? MediaSetupViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MediaSetupDemoViewController()
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


//
//  MediaAccessibilityViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum MediaAccessibilityViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS7+\n协调应用程序媒体文件的闭标题数据的表示。"
        case .topics:
            return ""
        case .demo:
            return "Click here to example"
        }
    }
}
class MediaAccessibilityViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MediaAccessibilityViewControllerType.overview, MediaAccessibilityViewControllerType.topics, MediaAccessibilityViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MediaAccessibilityViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MediaAccessibilityViewControllerType ?? MediaAccessibilityViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MediaAccessibilityDemoViewController()
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


//
//  AccessibilityViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/28.
//



import UIKit
enum AccessibilityViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n让所有使用苹果设备的人都能访问你的应用程序。"
        case .topics:
            return "Accessibility--让每个人都可以使用你的SwiftUI应用程序，包括残疾人。\nAccessibility for UIKit--让每个使用iOS和tvOS的人都能访问你的UIKit应用。\nCustomized Accessibility Content--定制您的应用程序，以提供可访问性信息给您的用户在衡量部分，因为他们需要它。\nAudio Graphs--在你的图表和图表中提供数据的听觉表达\nHearing Device Support--访问有关配对助听器设备和流状态的信息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AccessibilityViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AccessibilityViewControllerType.overview, AccessibilityViewControllerType.topics, AccessibilityViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AccessibilityViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AccessibilityViewControllerType ?? AccessibilityViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AccessibilityDemoViewController()
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


//
//  IOSCallJsOrJsCallIOSViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//



import UIKit

enum IOSCallJsOrJsCallIOSViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "IOSCallJsOrJsCallIOS：利用iOS7.0后出来的JavaScriptCore framework，webview与Js交互是常见的需求。OC版本与swift版本。《OC JavaScriptCore与js交互》,《Swift JavaScriptCore与js交互》。"
        case .topics:
            return "A good demo for iOS call js and js call ios native, using JavaScriptCore after iOS 7.0."
        case .demo:
            return "https://github.com/iOSwangyihan/IOSCallJsOrJsCallIOS"
        }
    }
}
class IOSCallJsOrJsCallIOSViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [IOSCallJsOrJsCallIOSViewControllerType.overview, IOSCallJsOrJsCallIOSViewControllerType.topics, IOSCallJsOrJsCallIOSViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? IOSCallJsOrJsCallIOSViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? IOSCallJsOrJsCallIOSViewControllerType ?? IOSCallJsOrJsCallIOSViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = IOSCallJsOrJsCallIOSDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
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


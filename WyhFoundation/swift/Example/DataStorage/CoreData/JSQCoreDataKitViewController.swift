//
//  JSQCoreDataKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

enum JSQCoreDataKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return " A swifter Core Data stack 。"
        case .topics:
            return "This library aims to do the following:\nEncode Core Data best practices, so you don't have to think \"is this correct?\" or \"is this the right way to do this?\"\nProvide better interoperability with Swift\nHarness Swift features and enforce Swift paradigms\nBring functional paradigms to Core Data\nMake Core Data more Swifty\nSimplify the processes of standing up the Core Data stack\nAid in testing your Core Data models\nReduce the boilerplate involved with Core Data"
        case .demo:
            return "https://github.com/iOSwangyihan/JSQCoreDataKit"
        }
    }
}
class JSQCoreDataKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [JSQCoreDataKitViewControllerType.overview, JSQCoreDataKitViewControllerType.topics, JSQCoreDataKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? JSQCoreDataKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? JSQCoreDataKitViewControllerType ?? JSQCoreDataKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = JSQCoreDataKitDemoViewController()
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


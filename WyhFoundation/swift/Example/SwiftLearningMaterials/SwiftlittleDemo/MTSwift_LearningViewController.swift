//
//  MTSwift_LearningViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//


import UIKit

enum MTSwift_LearningViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "通过一些简单项目实战演练开始学习 Swift "
        case .topics:
            return "As a Designer,I begin to learn swift,try to make some simple project here\nI'm newbie,but I'm forwarding."
        case .demo:
            return "https://github.com/iOSwangyihan/MTSwift-Learning"
        }
    }
}
class MTSwift_LearningViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MTSwift_LearningViewControllerType.overview, MTSwift_LearningViewControllerType.topics, MTSwift_LearningViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MTSwift_LearningViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MTSwift_LearningViewControllerType ?? MTSwift_LearningViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MTSwift_LearningDemoViewController()
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


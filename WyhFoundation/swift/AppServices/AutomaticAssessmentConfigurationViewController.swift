//
//  AutomaticAssessmentConfigurationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//




import UIKit
enum AutomaticAssessmentConfigurationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13.4+\n进入单应用模式，防止学生在考试时访问特定的系统功能。"
        case .topics:
            return "AEAssessmentSession--应用程序用来保护评估的会话。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AutomaticAssessmentConfigurationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AutomaticAssessmentConfigurationViewControllerType.overview, AutomaticAssessmentConfigurationViewControllerType.topics, AutomaticAssessmentConfigurationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AutomaticAssessmentConfigurationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AutomaticAssessmentConfigurationViewControllerType ?? AutomaticAssessmentConfigurationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AutomaticAssessmentConfigurationDemoViewController()
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


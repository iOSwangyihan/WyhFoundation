//
//  Httper_iOSViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum Httper_iOSViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "App for developers to test REST API. https://httper.mushare.cn."
        case .topics:
            return "Httper is a REST API test tool running on your iOS devices. It helps developers to test their REST APIs anywhere and anytime without PC."
        case .demo:
            return "https://github.com/iOSwangyihan/Httper-iOS"
        }
    }
}
class Httper_iOSViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [Httper_iOSViewControllerType.overview, Httper_iOSViewControllerType.topics, Httper_iOSViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? Httper_iOSViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? Httper_iOSViewControllerType ?? Httper_iOSViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = Httper_iOSDemoViewController()
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


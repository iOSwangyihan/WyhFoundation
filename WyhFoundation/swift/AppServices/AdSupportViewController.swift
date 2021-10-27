//
//  AdSupportViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//



import UIKit
enum AdSupportViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS6+\n为应用程序提供访问广告标识符的权限。"
        case .topics:
            return "ASIdentifierManager--包含广告标识符的对象。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AdSupportViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AdSupportViewControllerType.overview, AdSupportViewControllerType.topics, AdSupportViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AdSupportViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AdSupportViewControllerType ?? AdSupportViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AdSupportDemoViewController()
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


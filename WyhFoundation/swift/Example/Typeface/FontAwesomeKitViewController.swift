//
//  FontAwesomeKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//


import UIKit

enum FontAwesomeKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "图片字体库，支持超级字体、基础Icon等，支持同时支持Swift.."
        case .topics:
            return "Icon font library for iOS. Currently supports Font-Awesome, Foundation icons, Zocial, and ionicons."
        case .demo:
            return "https://github.com/iOSwangyihan/FontAwesomeKit"
        }
    }
}
class FontAwesomeKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [FontAwesomeKitViewControllerType.overview, FontAwesomeKitViewControllerType.topics, FontAwesomeKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? FontAwesomeKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? FontAwesomeKitViewControllerType ?? FontAwesomeKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = FontAwesomeKitDemoViewController()
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


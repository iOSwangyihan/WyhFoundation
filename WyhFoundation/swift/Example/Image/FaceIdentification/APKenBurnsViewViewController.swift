//
//  APKenBurnsViewViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//

import UIKit

enum APKenBurnsViewViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "面部识别"
        case .topics:
            return "APKenBurnsView is UIView subclass which supports face recognition to beautifully animate people photos."
        case .demo:
            return "https://github.com/iOSwangyihan/APKenBurnsView"
        }
    }
}
class APKenBurnsViewViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [APKenBurnsViewViewControllerType.overview, APKenBurnsViewViewControllerType.topics, APKenBurnsViewViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? APKenBurnsViewViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? APKenBurnsViewViewControllerType ?? APKenBurnsViewViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = APKenBurnsViewDemoViewController()
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


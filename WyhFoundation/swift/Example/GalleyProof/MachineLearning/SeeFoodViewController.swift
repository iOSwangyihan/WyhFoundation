//
//  SeeFoodViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//


import UIKit

enum SeeFoodViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return " Inspired by HBO's Silicon Valley: SeeFood is an iOS app that uses CoreML to detect various dishes"
        case .topics:
            return "For a step by step guide on how to build SeeFood: How to train your own model for CoreML."
        case .demo:
            return "https://github.com/iOSwangyihan/SeeFood"
        }
    }
}
class SeeFoodViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SeeFoodViewControllerType.overview, SeeFoodViewControllerType.topics, SeeFoodViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SeeFoodViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SeeFoodViewControllerType ?? SeeFoodViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SeeFoodDemoViewController()
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


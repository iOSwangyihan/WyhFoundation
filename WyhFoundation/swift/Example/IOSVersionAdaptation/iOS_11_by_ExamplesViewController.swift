//
//  iOS_11_by_ExamplesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//


import UIKit

enum iOS_11_by_ExamplesViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Examples of new iOS 11 APIs."
        case .topics:
            return "Code examples for new APIs of iOS 11.\nNote: The project requires Xcode 9, Swift 4 and iOS 11."
        case .demo:
            return "https://github.com/iOSwangyihan/iOS-11-by-Examples"
        }
    }
}
class iOS_11_by_ExamplesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [iOS_11_by_ExamplesViewControllerType.overview, iOS_11_by_ExamplesViewControllerType.topics, iOS_11_by_ExamplesViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? iOS_11_by_ExamplesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? iOS_11_by_ExamplesViewControllerType ?? iOS_11_by_ExamplesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = iOS_11_by_ExamplesDemoViewController()
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


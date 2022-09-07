//
//  GoogleNewsStandAnimationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//



import UIKit

enum GoogleNewsStandAnimationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "It is same like Google News Stand Animation with Customise Configuration file in Swift iOS Technology."
        case .topics:
            return "It is same like Google News Stand Animation with Customise Configuration file in Swift iOS Technology."
        case .demo:
            return "https://github.com/iOSwangyihan/GoogleNewsStandAnimation"
        }
    }
}
class GoogleNewsStandAnimationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GoogleNewsStandAnimationViewControllerType.overview, GoogleNewsStandAnimationViewControllerType.topics, GoogleNewsStandAnimationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? GoogleNewsStandAnimationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? GoogleNewsStandAnimationViewControllerType ?? GoogleNewsStandAnimationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = GoogleNewsStandAnimationDemoViewController()
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


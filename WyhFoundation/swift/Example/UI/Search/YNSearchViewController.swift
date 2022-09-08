//
//  YNSearchViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//




import UIKit

enum YNSearchViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "一个非常棒，完全自定义的搜索View，支持历史记录，标签等等功能."
        case .topics:
            return "See CHANGELOG for details"
        case .demo:
            return "https://github.com/iOSwangyihan/YNSearch"
        }
    }
}
class YNSearchViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [YNSearchViewControllerType.overview, YNSearchViewControllerType.topics, YNSearchViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? YNSearchViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? YNSearchViewControllerType ?? YNSearchViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = YNSearchDemoViewController()
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


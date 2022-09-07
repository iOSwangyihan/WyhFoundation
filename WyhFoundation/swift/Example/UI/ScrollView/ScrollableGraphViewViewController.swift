//
//  ScrollableGraphViewViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//


import UIKit

enum ScrollableGraphViewViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "自适应滚动视图的图表控件."
        case .topics:
            return "An adaptive scrollable graph view for iOS to visualise simple discrete datasets. Written in Swift. Originally written for a small personal project.\nThe main goal of the this graph component is to visualise simple discrete datasets and allow the the user to scroll through the graph."
        case .demo:
            return "https://github.com/iOSwangyihan/ScrollableGraphView"
        }
    }
}
class ScrollableGraphViewViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ScrollableGraphViewViewControllerType.overview, ScrollableGraphViewViewControllerType.topics, ScrollableGraphViewViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ScrollableGraphViewViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ScrollableGraphViewViewControllerType ?? ScrollableGraphViewViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ScrollableGraphViewDemoViewController()
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


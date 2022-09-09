//
//  ClusterViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum ClusterViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "非常不错的地图标注聚合."
        case .topics:
            return "Cluster is an easy map annotation clustering library. This repository uses an efficient method (QuadTree) to aggregate pins into a cluster."
        case .demo:
            return "https://github.com/iOSwangyihan/Cluster"
        }
    }
}
class ClusterViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ClusterViewControllerType.overview, ClusterViewControllerType.topics, ClusterViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ClusterViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ClusterViewControllerType ?? ClusterViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ClusterDemoViewController()
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


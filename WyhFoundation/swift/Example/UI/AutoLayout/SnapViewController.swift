//
//  SnapViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//




import UIKit

enum SnapViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Snap是Masonry Auto Layout DSL的Swift版本，是一款轻量级的布局框架，使用了更良好的语法封装了AutoLayout。Snap支持iOS和OS X."
        case .topics:
            return "SnapKit is a DSL to make Auto Layout easy on both iOS and OS X"
        case .demo:
            return "https://github.com/iOSwangyihan/SnapKit"
        }
    }
}
class SnapViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SnapViewControllerType.overview, SnapViewControllerType.topics, SnapViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SnapViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SnapViewControllerType ?? SnapViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SnapDemoViewController()
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


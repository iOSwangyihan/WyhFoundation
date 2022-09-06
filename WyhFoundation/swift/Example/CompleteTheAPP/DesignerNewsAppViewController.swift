//
//  DesignerNewsAppViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit
enum DesignerNewsAppViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Swift 开发的 DesignerNews 客户端，看着美美的."
        case .topics:
            return "Simple iOS client for Designer News, by the creator of Design+Code and the team, written in Swift."
        case .demo:
            return "https://github.com/iOSwangyihan/DesignerNewsApp"
        }
    }
}
class DesignerNewsAppViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [DesignerNewsAppViewControllerType.overview, DesignerNewsAppViewControllerType.topics, DesignerNewsAppViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? DesignerNewsAppViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? DesignerNewsAppViewControllerType ?? DesignerNewsAppViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = DesignerNewsAppDemoViewController()
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


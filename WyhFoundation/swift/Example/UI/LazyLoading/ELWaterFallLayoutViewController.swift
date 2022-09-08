//
//  ELWaterFallLayoutViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//




import UIKit

enum ELWaterFallLayoutViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "swift可定制瀑布流布局 UI 组件。"
        case .topics:
            return "To run the example project, clone the repo, and run pod install from the Example directory first."
        case .demo:
            return "https://github.com/iOSwangyihan/ELWaterFallLayout"
        }
    }
}
class ELWaterFallLayoutViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ELWaterFallLayoutViewControllerType.overview, ELWaterFallLayoutViewControllerType.topics, ELWaterFallLayoutViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ELWaterFallLayoutViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ELWaterFallLayoutViewControllerType ?? ELWaterFallLayoutViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ELWaterFallLayoutDemoViewController()
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


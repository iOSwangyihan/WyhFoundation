//
//  PerseiViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//



import UIKit

enum PerseiViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "非常赞 动画隐藏或显示顶部菜单支持库及示例项目。--swift"
        case .topics:
            return "Animated top menu for UITableView / UICollectionView / UIScrollView written in Swift!\nMade in Yalantis.\nCheck this project on Dribbble\nCheck this project on Behance"
        case .demo:
            return "https://github.com/iOSwangyihan/Persei"
        }
    }
}
class PerseiViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PerseiViewControllerType.overview, PerseiViewControllerType.topics, PerseiViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PerseiViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PerseiViewControllerType ?? PerseiViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PerseiDemoViewController()
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


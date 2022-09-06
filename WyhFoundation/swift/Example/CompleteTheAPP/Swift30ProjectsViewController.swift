//
//  Swift30ProjectsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//





import UIKit
enum Swift30ProjectsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "最新 Swift 3.0 的30个小App，更注重代码规范和架构设计(故胤道长). "
        case .topics:
            return "This repo focus on usage of:\nSimple UIKit components\nUIScrollView, UITableView, UICollectionView\nCAAnimations and UIView Animations\nLocal Notification in iOS 10\nMapKit and Contact Frameworks\nCore Data, Today Extension and 3D touch\nPopular Open Source Frameworks\nDesign Patterns"
        case .demo:
            return "https://github.com/iOSwangyihan/Swift-30-Projects"
        }
    }
}
class Swift30ProjectsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [Swift30ProjectsViewControllerType.overview, Swift30ProjectsViewControllerType.topics, Swift30ProjectsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? Swift30ProjectsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? Swift30ProjectsViewControllerType ?? Swift30ProjectsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = Swift30ProjectsDemoViewController()
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


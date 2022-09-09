//
//  WatchKit_AppsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum WatchKit_AppsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "WatchKit教程"
        case .topics:
            return "App tutorial Videos: Live coding!\nLast Update: New tutorial about tables - 8-Table"
        case .demo:
            return "https://github.com/iOSwangyihan/WatchKit-Apps"
        }
    }
}
class WatchKit_AppsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [WatchKit_AppsViewControllerType.overview, WatchKit_AppsViewControllerType.topics, WatchKit_AppsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? WatchKit_AppsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? WatchKit_AppsViewControllerType ?? WatchKit_AppsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = WatchKit_AppsDemoViewController()
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


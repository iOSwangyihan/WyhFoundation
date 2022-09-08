//
//  BartinterViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//




import UIKit

enum BartinterViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Dynamically changes status bar style depending on content behind it."
        case .topics:
            return "Status bar apperance manager that make your status bar readable by dynamically changing it's color depending on content behind."
        case .demo:
            return "https://github.com/iOSwangyihan/Bartinter"
        }
    }
}
class BartinterViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BartinterViewControllerType.overview, BartinterViewControllerType.topics, BartinterViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? BartinterViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? BartinterViewControllerType ?? BartinterViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = BartinterDemoViewController()
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


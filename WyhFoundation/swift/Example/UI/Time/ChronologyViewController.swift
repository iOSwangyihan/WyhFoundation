//
//  ChronologyViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//




import UIKit

enum ChronologyViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Building a better date/time library for Swift."
        case .topics:
            return "Time is a Swift package that makes dealing with calendar values a natural and straight-forward process.\nWorking with calendars can be extremely complicated and error-prone. Time solves these problems by clarifying concepts and restricting improper usage through type-safe APIs."
        case .demo:
            return "https://github.com/iOSwangyihan/time"
        }
    }
}
class ChronologyViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ChronologyViewControllerType.overview, ChronologyViewControllerType.topics, ChronologyViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ChronologyViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ChronologyViewControllerType ?? ChronologyViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ChronologyDemoViewController()
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


//
//  CSwiftVViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

enum CSwiftVViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "A csv parser written in swift conforming to rfc4180 🔶"
        case .topics:
            return "A csv parser conforming (and tested as much) to rfc4180 i.e the closest thing to a csv spec.\nIt is currently all in memory so not suitable for very large files."
        case .demo:
            return "https://github.com/iOSwangyihan/CSwiftV"
        }
    }
}
class CSwiftVViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CSwiftVViewControllerType.overview, CSwiftVViewControllerType.topics, CSwiftVViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CSwiftVViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CSwiftVViewControllerType ?? CSwiftVViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CSwiftVDemoViewController()
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


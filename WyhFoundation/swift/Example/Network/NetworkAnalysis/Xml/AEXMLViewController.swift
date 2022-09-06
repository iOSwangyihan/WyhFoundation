//
//  AEXMLViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//




import UIKit

enum AEXMLViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Simple and lightweight XML parser written in Swift. 🔶"
        case .topics:
            return "I made this for personal use, but feel free to use it or contribute. For more examples check out Sources and Tests."
        case .demo:
            return "https://github.com/iOSwangyihan/AEXML"
        }
    }
}
class AEXMLViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AEXMLViewControllerType.overview, AEXMLViewControllerType.topics, AEXMLViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AEXMLViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AEXMLViewControllerType ?? AEXMLViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AEXMLDemoViewController()
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


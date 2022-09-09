//
//  SwiftAIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum SwiftAIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return " SwiftAI, write Swift code smart. SwiftAI can generate Model class from JSON now. Codable and HandyJSON is supported. More features will be add."
        case .topics:
            return "SwiftAI, write Swift code smart. SwiftAI can generate Model class from JSON now. Codable and HandyJSON is supported. More features will be add."
        case .demo:
            return "https://github.com/iOSwangyihan/SwiftAI"
        }
    }
}
class SwiftAIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SwiftAIViewControllerType.overview, SwiftAIViewControllerType.topics, SwiftAIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SwiftAIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SwiftAIViewControllerType ?? SwiftAIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SwiftAIDemoViewController()
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


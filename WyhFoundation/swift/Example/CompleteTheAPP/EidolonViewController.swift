//
//  EidolonViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//


import UIKit
enum EidolonViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "艺术品拍卖的投标亭平台，用swift与反应式编程框架 ReactiveCocoa."
        case .topics:
            return "The Artsy Auction Kiosk App.\nNote: Current development is done on the xcode-9 branch using Xcode 9 (available for download on Apple's developer portal). You can see this issue for more details."
        case .demo:
            return "https://github.com/iOSwangyihan/eidolon"
        }
    }
}
class EidolonViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [EidolonViewControllerType.overview, EidolonViewControllerType.topics, EidolonViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? EidolonViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? EidolonViewControllerType ?? EidolonViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = EidolonDemoViewController()
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


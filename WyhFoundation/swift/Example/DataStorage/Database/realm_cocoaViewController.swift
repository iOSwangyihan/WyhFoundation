//
//  realm_cocoaViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//




import UIKit

enum realm_cocoaViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "一个号称要代替Core Data & SQLite的用于移动端的数据库，非常不错👍👍 ，同时支持Objective-C."
        case .topics:
            return "Realm is a mobile database that runs directly inside phones, tablets or wearables. This repository holds the source code for the iOS, macOS, tvOS & watchOS versions of Realm Swift & Realm Objective-C."
        case .demo:
            return "https://github.com/iOSwangyihan/realm-swift"
        }
    }
}
class realm_cocoaViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [realm_cocoaViewControllerType.overview, realm_cocoaViewControllerType.topics, realm_cocoaViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? realm_cocoaViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? realm_cocoaViewControllerType ?? realm_cocoaViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = realm_cocoaDemoViewController()
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


//
//  AlamofireViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//


import UIKit

enum AlamofireViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "非常赞👍👍👍 Alamofire是AFNetworking的作者mattt新写的网络请求的swift库。Alamofire 最佳实践"
        case .topics:
            return "Alamofire is an HTTP networking library written in Swift."
        case .demo:
            return "https://github.com/iOSwangyihan/Alamofire"
        }
    }
}
class AlamofireViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AlamofireViewControllerType.overview, AlamofireViewControllerType.topics, AlamofireViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AlamofireViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AlamofireViewControllerType ?? AlamofireViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AlamofireDemoViewController()
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


//
//  ReactiveCocoaViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit
enum ReactiveCocoaViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Streams of values over time 一个支持FRP(函数响应式编程)的框架 非常👍👍👍 . "
        case .topics:
            return "Reactive extensions to Cocoa frameworks, built on top of ReactiveSwift."
        case .demo:
            return "https://github.com/iOSwangyihan/ReactiveCocoa"
        }
    }
}
class ReactiveCocoaViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ReactiveCocoaViewControllerType.overview, ReactiveCocoaViewControllerType.topics, ReactiveCocoaViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ReactiveCocoaViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ReactiveCocoaViewControllerType ?? ReactiveCocoaViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ReactiveCocoaDemoViewController()
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


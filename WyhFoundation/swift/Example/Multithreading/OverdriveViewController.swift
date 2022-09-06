//
//  OverdriveViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

enum OverdriveViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "专注于类型安全、并发和多线程的，快速 、专业的异步任务库 Fast async task based Swift framework with focus on type safety, concurrency and multi threading"
        case .topics:
            return "Our apps constantly do work. The faster you react to user input and produce an output, the more likely is that the user will continue to use your application. As our applications grow in complexity, the more and more work needs to be done. You need to start thinking about how to categorize and optimize work, how to make that work more efficient, more optimized and finally, faster. In most cases that doesn’t end very well because you need to know a lot about concurrency, multithreading etc. - it’s a very complex field. You need to know all API specifics before you are able to write something.\nOverdrive was created as a result of that struggle. It is a framework that exposes several simple concepts which are made on top of complex system frameworks that enable multithreading, concurrency and most importantly, more speed."
        case .demo:
            return "https://github.com/iOSwangyihan/Overdrive"
        }
    }
}
class OverdriveViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [OverdriveViewControllerType.overview, OverdriveViewControllerType.topics, OverdriveViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? OverdriveViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? OverdriveViewControllerType ?? OverdriveViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = OverdriveDemoViewController()
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


//
//  AImageViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//


import UIKit

enum AImageViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "A animated GIF&APNG engine for iOS in Swift with low memory & cpu usage.Optimized for Multi-Image case."
        case .topics:
            return " Small but complete, only200lines of code.\nAllow to control display quality, memory usage, loop time and display progress.\nHave a great performance on memory and cpu usage.\nUsing asynchronous image decoding to reduce the main thread CPU usage."
        case .demo:
            return "https://github.com/iOSwangyihan/AImage"
        }
    }
}
class AImageViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AImageViewControllerType.overview, AImageViewControllerType.topics, AImageViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AImageViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AImageViewControllerType ?? AImageViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AImageDemoViewController()
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


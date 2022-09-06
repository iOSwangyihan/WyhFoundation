//
//  ios_ossViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//


import UIKit
enum ios_ossViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Kickstarter for iOS. Bring new ideas to life, anywhere"
        case .topics:
            return "Welcome to Kickstarter’s open source iOS app! Come on in, take your shoes off, stay a while—explore how Kickstarter’s native squad has built and continues to build the app.\nWe’ve also open sourced our Android app, and read more about our journey to open source here."
        case .demo:
            return "https://github.com/iOSwangyihan/ios-oss"
        }
    }
}
class ios_ossViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ios_ossViewControllerType.overview, ios_ossViewControllerType.topics, ios_ossViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ios_ossViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ios_ossViewControllerType ?? ios_ossViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ios_ossDemoViewController()
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


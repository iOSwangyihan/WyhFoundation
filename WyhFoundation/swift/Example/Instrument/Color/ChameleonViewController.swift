//
//  ChameleonViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//

import UIKit

enum ChameleonViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Chameleon是一个非常棒👍👍👍iOS的色彩框架。它运用现代化flat color将UIColor扩展地非常美观。我们还可以通过它运用自定义颜色创建调色板。它还有很多功用，请浏览readme。同时支持Objective-C."
        case .topics:
            return "Chameleon is a lightweight, yet powerful, color framework for iOS (Objective-C & Swift). It is built on the idea that software applications should function effortlessly while simultaneously maintaining their beautiful interfaces.\nWith Chameleon, you can easily stop tinkering with RGB values, wasting hours figuring out the right color combinations to use in your app, and worrying about whether your text will be readable on the various background colors of your app."
        case .demo:
            return "https://github.com/iOSwangyihan/chameleon"
        }
    }
}
class ChameleonViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ChameleonViewControllerType.overview, ChameleonViewControllerType.topics, ChameleonViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ChameleonViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ChameleonViewControllerType ?? ChameleonViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ChameleonDemoViewController()
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


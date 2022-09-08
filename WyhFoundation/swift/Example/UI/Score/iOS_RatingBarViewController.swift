//
//  iOS_RatingBarViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//


import UIKit

enum iOS_RatingBarViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "iOS-RatingBar swift版的评分控件,跟Android的RatingBar一样有两种模式，评分模式和只读模式'支持视图编辑，自定义星星数量，评分等级,另外还能支持非整数星，0.5颗星，0.1颗星,可以开启动画效果。"
        case .topics:
            return "跟Android的RatingBar一样有两种模式，评分模式和只读模式\n支持视图编辑，自定义星星数量，评分等级\n另外还能支持非整数星，0.5颗星，0.1颗星\n可以开启动画效果"
        case .demo:
            return "https://github.com/iOSwangyihan/iOS-RatingBar"
        }
    }
}
class iOS_RatingBarViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [iOS_RatingBarViewControllerType.overview, iOS_RatingBarViewControllerType.topics, iOS_RatingBarViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? iOS_RatingBarViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? iOS_RatingBarViewControllerType ?? iOS_RatingBarViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = iOS_RatingBarDemoViewController()
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


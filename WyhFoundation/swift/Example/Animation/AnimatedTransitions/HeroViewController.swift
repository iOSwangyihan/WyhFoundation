//
//  HeroViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//





import UIKit

enum HeroViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "非常👍👍👍 的转场动画库."
        case .topics:
            return "Hero is a library for building iOS view controller transitions. It provides a declarative layer on top of the UIKit's cumbersome transition APIs—making custom transitions an easy task for developers."
        case .demo:
            return "https://github.com/iOSwangyihan/Hero"
        }
    }
}
class HeroViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [HeroViewControllerType.overview, HeroViewControllerType.topics, HeroViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? HeroViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? HeroViewControllerType ?? HeroViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = HeroDemoViewController()
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


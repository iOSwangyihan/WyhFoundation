//
//  Optimizing_Swift_Build_TimesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum Optimizing_Swift_Build_TimesViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Collection of advice on optimizing compile times of Swift projects."
        case .topics:
            return "Collection of advice on optimizing compile times of Swift projects.\nSwift is constantly improving ❤️. For the time being, though, long compile times persist as a big issue when working on medium-to-large apps. The goal of this project is to gather all there is that can help you shorten your build times.\n👷🏻 Maintainer: Arek Holko. Anything missing? Issues and pull requests welcomed!"
        case .demo:
            return "https://github.com/iOSwangyihan/Optimizing-Swift-Build-Times"
        }
    }
}
class Optimizing_Swift_Build_TimesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [Optimizing_Swift_Build_TimesViewControllerType.overview, Optimizing_Swift_Build_TimesViewControllerType.topics, Optimizing_Swift_Build_TimesViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? Optimizing_Swift_Build_TimesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? Optimizing_Swift_Build_TimesViewControllerType ?? Optimizing_Swift_Build_TimesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = Optimizing_Swift_Build_TimesDemoViewController()
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


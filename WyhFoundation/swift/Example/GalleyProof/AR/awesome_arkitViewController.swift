//
//  awesome_arkitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//


import UIKit

enum awesome_arkitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "👍👍👍 A curated list of awesome ARKit projects and resources."
        case .topics:
            return "A curated list of awesome ARKit projects and resources. Feel free to contribute!\nARKit is a new framework that allows you to easily create unparalleled augmented reality experiences for iPhone and iPad. By blending digital objects and information with the environment around you, ARKit takes apps beyond the screen, freeing them to interact with the real world in entirely new ways."
        case .demo:
            return "https://github.com/iOSwangyihan/Awesome-ARKit"
        }
    }
}
class awesome_arkitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [awesome_arkitViewControllerType.overview, awesome_arkitViewControllerType.topics, awesome_arkitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? awesome_arkitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? awesome_arkitViewControllerType ?? awesome_arkitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = awesome_arkitDemoViewController()
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


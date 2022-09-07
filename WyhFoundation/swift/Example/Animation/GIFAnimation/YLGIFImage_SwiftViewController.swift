//
//  YLGIFImage_SwiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//




import UIKit

enum YLGIFImage_SwiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "YLGIFImage-Swift"
        case .topics:
            return "Swift implementation of YLGIFImage."
        case .demo:
            return "https://github.com/iOSwangyihan/YLGIFImage-Swift"
        }
    }
}
class YLGIFImage_SwiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [YLGIFImage_SwiftViewControllerType.overview, YLGIFImage_SwiftViewControllerType.topics, YLGIFImage_SwiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? YLGIFImage_SwiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? YLGIFImage_SwiftViewControllerType ?? YLGIFImage_SwiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = YLGIFImage_SwiftDemoViewController()
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


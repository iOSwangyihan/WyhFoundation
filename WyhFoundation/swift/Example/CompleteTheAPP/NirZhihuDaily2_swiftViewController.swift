//
//  NirZhihuDaily2_swiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit
enum NirZhihuDaily2_swiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "精仿了知乎日报iOS端练手，Swift2.0，注释相当详细."
        case .topics:
            return "根据 https://github.com/izzyleung/ZhihuDailyPurify/wiki/知乎日报-API-分析 提供的API制作的知乎日报iOS客户端"
        case .demo:
            return "https://github.com/iOSwangyihan/NirZhihuDaily2.0"
        }
    }
}
class NirZhihuDaily2_swiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [NirZhihuDaily2_swiftViewControllerType.overview, NirZhihuDaily2_swiftViewControllerType.topics, NirZhihuDaily2_swiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? NirZhihuDaily2_swiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? NirZhihuDaily2_swiftViewControllerType ?? NirZhihuDaily2_swiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = NirZhihuDaily2_swiftDemoViewController()
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


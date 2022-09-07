//
//  ChartsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//



import UIKit

enum ChartsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "一款非常👍👍👍 优秀的图表开源库 MPAndroidChart 的 Swift 语言实现版（支持 Objective-C 和 Swift 调用）.漂亮的线图、饼图、条形图、分布图、气泡图、雷达图还有更多种类."
        case .topics:
            return "Just a heads up: Charts 3.0 has some breaking changes. Please read the release/migration notes.\nAnother heads up: ChartsRealm is now in a separate repo. Pods is also now Charts and ChartsRealm, instead of Charts/Core and Charts/Realm\nOne more heads up: As Swift evolves, if you are not using the latest Swift compiler, you shouldn't check out the master branch. Instead, you should go to the release page and pick up whatever suits you."
        case .demo:
            return "https://github.com/iOSwangyihan/Charts"
        }
    }
}
class ChartsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ChartsViewControllerType.overview, ChartsViewControllerType.topics, ChartsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ChartsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ChartsViewControllerType ?? ChartsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SwiftProgressHUDDemoViewController()
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


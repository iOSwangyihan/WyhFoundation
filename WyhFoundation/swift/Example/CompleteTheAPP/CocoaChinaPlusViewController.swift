//
//  CocoaChinaPlusViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//


import UIKit
enum CocoaChinaPlusViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "CocoaChina+是一款开源的第三方CocoaChina移动端。整个App都用Swift2.0编写(除部分第三方OC代码外，比如JPush和友盟)."
        case .topics:
            return "CocoaChina+是一款开源的第三方CocoaChina移动端。整个App都用Swift2.0编写(除部分第三方OC代码外，比如JPush和友盟)。\n##GodEye调试工具 GodEye是本人研发的一款纯Swift实现的APM(应用性能管理工具)，它可以自动展示日志，崩溃，网络，卡顿，内存泄露，CPU、RAM使用率，帧率FPS,网络流量，文件目录结构等信息。并且只需要一行代码接入，零代码入侵，线上版本不编译进一行代码，做到绝对的线上安全，就像上帝睁开了他的眼睛。\n目前该工具已经接入CococaChinaPlus！"
        case .demo:
            return "https://github.com/iOSwangyihan/CocoaChinaPlus"
        }
    }
}
class CocoaChinaPlusViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CocoaChinaPlusViewControllerType.overview, CocoaChinaPlusViewControllerType.topics, CocoaChinaPlusViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CocoaChinaPlusViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CocoaChinaPlusViewControllerType ?? CocoaChinaPlusViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CocoaChinaPlusDemoViewController()
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


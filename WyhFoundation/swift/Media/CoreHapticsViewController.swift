//
//  CoreHapticsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//





import UIKit
enum CoreHapticsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n撰写和玩触觉模式自定义您的iOS应用程序的触觉反馈。"
        case .topics:
            return "CHHapticEngine--表示到触觉服务器的连接的对象。\nCHHapticPatternPlayer--一种协议，它定义了一种标准模式播放器，能够使用固定参数播放触觉模式。\nCHHapticAdvancedPatternPlayer--一种协议，它定义了一种高级模式播放器，能够循环、寻找、暂停和恢复触觉回放。\nCHHapticEvent--描述单个触觉或音频事件的对象。\nCHHapticEventParameter--一个静态参数值，表示触觉模式的一个属性。\nCHHapticDynamicParameter--发送给触觉模式播放器的一个值，用于在播放过程中更改属性值。\nCHHapticParameterCurve--发送给触觉模式播放器以在播放过程中逐渐改变属性值的曲线。\nCHHapticError--表示触觉过程中出现错误的结构体。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreHapticsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreHapticsViewControllerType.overview, CoreHapticsViewControllerType.topics, CoreHapticsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreHapticsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreHapticsViewControllerType ?? CoreHapticsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreHapticsDemoViewController()
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



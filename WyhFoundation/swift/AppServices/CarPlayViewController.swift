//
//  CarPlayViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//




import UIKit
enum CarPlayViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS12+\n将CarPlay集成到音频、通信、导航、停车、电动充电和订餐应用程序中。"
        case .topics:
            return "CPTemplateApplicationScene--一个控制应用程序用户界面的CarPlay场景。\nCPTemplateApplicationSceneDelegate--用于响应应用场景生命周期事件的方法。\nCPSessionConfiguration--为CarPlay环境提供车辆属性和配置的对象。\nCPListTemplate--显示和管理项目列表的模板\nCPGridTemplate--显示和管理项目网格的模板。\nCPTabBarTemplate--显示和管理其他模板的容器模板，将它们显示为选项卡。\nCPTemplate--接口模板的抽象基类。\nCPBarButtonProviding--模板用于为导航栏提供按钮的方法。\nCPNowPlayingTemplate--显示“正在播放”信息的共享系统模板\nCPTemplateApplicationDashboardScene--一个控制你的应用程序仪表板导航窗口的CarPlay场景。\nCPTemplateApplicationDashboardSceneDelegate--用于响应导航应用仪表板场景的生命周期事件的方法。\nCPMapTemplate--显示应用程序在地图上绘制的导航覆盖层的模板。\nCPSearchTemplate--提供搜索目的地和查看搜索结果列表的功能的模板。\nCPVoiceControlTemplate--在音频输入期间显示语音控制指示灯的模板。\nCPPointOfInterestTemplate--显示具有可选兴趣点的映射的模板。\nCPInformationTemplate--提供感兴趣点、食物点、停车位置或收费位置信息的模板。\nCPTextButton--显示程式化标题的按钮。\nCPContactTemplate--显示个人或企业信息的模板。\nCPActionSheetTemplate--显示模态操作表的模板。\nCPAlertTemplate--显示模式警报的模板。\nCPAlertAction--一个对象，它封装了用户可以在动作表或警报上执行的动作。\nCPButton--显示图像并在用户点击它时调用处理程序的按钮。\nCPImageSet--图像的明暗表示。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class CarPlayViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CarPlayViewControllerType.overview, CarPlayViewControllerType.topics, CarPlayViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CarPlayViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CarPlayViewControllerType ?? CarPlayViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CarPlayDemoViewController()
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


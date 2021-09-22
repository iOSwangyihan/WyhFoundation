//
//  ReplayKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/22.
//




import UIKit
enum ReplayKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS9+\n从屏幕记录或流视频，从应用程序和麦克风音频。"
        case .topics:
            return "RPScreenRecorder--共享记录器对象，提供录制应用程序音频和视频的能力。\nRPPreviewViewController--一个显示用户界面的对象，用户可以在该界面预览和编辑用ReplayKit创建的屏幕记录。\nRPBroadcastController--一个包含启动和控制广播的方法的对象。\nRPBroadcastHandler--一个向广播应用程序发送消息的对象。\nRPBroadcastSampleHandler--一个处理从ReplayKit接收到的缓冲区对象的对象。\nRPBroadcastActivityViewController--显示用户选择广播服务的用户界面的视图控制器。\nRPSystemBroadcastPickerView--一个显示广播按钮的视图，点击该按钮时，将显示广播选择器。\nRPRecordingErrorCode--ReplayKit错误域代码。\nRPRecordingErrorDomain--ReplayKit框架错误域。"
        case .demo:
            return "Click here to example"
        }
    }
}
class ReplayKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ReplayKitViewControllerType.overview, ReplayKitViewControllerType.topics, ReplayKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ReplayKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ReplayKitViewControllerType ?? ReplayKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ReplayKitDemoViewController()
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


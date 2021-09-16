//
//  AVKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//





import UIKit
enum AVKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n为媒体播放创建视图级服务，包括用户控件、章节导航以及对字幕和关闭字幕的支持。"
        case .topics:
            return "AVPlayerViewController--一种视图控制器，它显示来自播放器对象的视频内容以及系统提供的播放控件。\nAVPictureInPictureController--在浮动的、可调整大小的窗口中对视频的图片回放中的用户发起的图片作出响应的控制器。\nVideoPlayer--显示来自播放器对象的视频内容以及系统提供的播放控件的视图。\nAVRoutePickerView--显示用于选择回放路由的控件的视图。\nAVKitError--AVKit框架发出的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AVKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AVKitViewControllerType.overview, AVKitViewControllerType.topics, AVKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AVKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AVKitViewControllerType ?? AVKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AVKitDemoViewController()
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



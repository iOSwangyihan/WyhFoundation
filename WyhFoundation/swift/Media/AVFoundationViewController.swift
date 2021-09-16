//
//  AVFoundationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//







import UIKit
enum AVFoundationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2.2+\n使用视听资产，控制设备摄像头，处理音频，并配置系统音频交互。"
        case .topics:
            return "Media Assets and Metadata--加载、检查、导出媒体资产和元数据，对媒体样本数据进行低级读写。\nMedia Playback and Selection--队列媒体播放和自定义播放行为。\nCameras and Media Capture--拍摄照片，录制视频和音频;配置内置摄像头和麦克风或外部捕捉设备。\nMedia Composition and Editing--将来自多个来源的音频和视频轨道合并、编辑和混音在一个单一的组成。\nAudio Playback, Recording, and Processing--播放、录制和处理音频;配置应用程序的系统音频行为。\nSpeech Synthesis--将文本转换为语音。\nAVVariantPreferences--\nAVContentKey--\nAVContentKeySpecifier--\nAVPlayerInterstitialEvent--\nAVPlayerInterstitialEventController--\nAVPlayerInterstitialEventObserver--\nAVFoundation Enumerations--\nAVFoundation Constants--\nAVFoundation Functions--本章描述AVFoundation框架中定义的函数。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AVFoundationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AVFoundationViewControllerType.overview, AVFoundationViewControllerType.topics, AVFoundationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AVFoundationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AVFoundationViewControllerType ?? AVFoundationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AVFoundationDemoViewController()
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



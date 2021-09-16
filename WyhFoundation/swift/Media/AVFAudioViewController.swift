//
//  AVFAudioViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//


import UIKit
enum AVFAudioViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14.5+\n播放、录制和处理音频;配置应用程序的系统音频行为。"
        case .topics:
            return "AVAudioSession--一个对象，它向系统传递你打算如何在应用程序中使用音频。\nAVAudioPlayer--从文件或缓冲区播放音频数据的对象。\nAVAudioRecorder--将音频数据记录到文件中的对象。\nAVMIDIPlayer--通过系统声音模块播放MIDI数据的对象。\nAudio Engine--执行高级实时和离线音频处理。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AVFAudioViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AVFAudioViewControllerType.overview, AVFAudioViewControllerType.topics, AVFAudioViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AVFAudioViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AVFAudioViewControllerType ?? AVFAudioViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AVFAudioDemoViewController()
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



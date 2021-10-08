//
//  SpeechViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/30.
//






import UIKit
enum SpeechViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS10+\n对现场或预先录制的音频进行语音识别，接收转录、替代解释和结果的置信度。"
        case .topics:
            return "SFSpeechRecognizer--用于检查语音识别服务是否可用并启动语音识别过程的对象。\nSFSpeechURLRecognitionRequest--在录制的音频文件中识别语音的请求。\nSFSpeechAudioBufferRecognitionRequest--从捕获的音频内容(如设备麦克风中的音频)中识别语音的请求。\nSFSpeechRecognitionRequest--一个抽象类，表示从音频源中识别语音的请求。\nSFSpeechRecognitionTask--用于监视语音识别进度的任务对象。\nSFSpeechRecognitionResult--包含语音识别请求的部分或最终结果的对象。\nSFTranscription--给定语音的文本表示，它是由语音识别器识别的语音的整体。\nSFTranscriptionSegment--由语音识别器识别的整个转录的离散部分。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SpeechViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SpeechViewControllerType.overview, SpeechViewControllerType.topics, SpeechViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SpeechViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SpeechViewControllerType ?? SpeechViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SpeechDemoViewController()
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


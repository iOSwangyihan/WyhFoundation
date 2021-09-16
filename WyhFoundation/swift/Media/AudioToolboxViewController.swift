//
//  AudioToolboxViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//





import UIKit
enum AudioToolboxViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n记录或播放音频，转换格式，解析音频流，并配置您的音频会话。"
        case .topics:
            return "Audio Unit v3 Plug-Ins--使用audio Unit v3应用扩展提供自定义音频效果、工具和其他音频行为。\nAudio Components--查找、加载和配置音频组件，如audio Units和音频编解码器。\nAudio Unit v2 (C) API--配置一个音频单元，并准备它来渲染音频。\nAudio Unit Properties--获取关于内置混频器、均衡器、过滤器、效果和其他音频单元应用程序扩展的信息。\nAudio Queue Services--连接到音频硬件并管理录音或回放过程。\nAudio Services--使用适当的硬件在iOS设备上播放简短的声音或触发震动效果。\nMusic Player--创建并播放一系列音轨，并根据标准事件管理回放的各个方面。\nAudio Format Services--访问有关音频格式和编解码器的信息。\nAudio File Services--从磁盘或内存缓冲区读取或写入各种音频数据。\nExtended Audio File Services--使用简化界面读写压缩文件和线性PCM音频文件。\nAudio File Stream Services--当数据到达用户的计算机时，解析流音频文件。\nCore Audio File Format--解析Core Audio文件的结构并出口\nAudio Converter Services--在线性PCM音频格式和线性PCM和压缩格式之间转换。\nAudio Toolbox Debugging--在开发和调试代码期间获取Core Audio对象的内部状态。\nAudio Codec--将音频数据从一种格式转换为另一种格式。\nAudioToolbox Constants"
        case .demo:
            return "Click here to example"
        }
    }
}
class AudioToolboxViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AudioToolboxViewControllerType.overview, AudioToolboxViewControllerType.topics, AudioToolboxViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AudioToolboxViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AudioToolboxViewControllerType ?? AudioToolboxViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AudioToolboxDemoViewController()
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



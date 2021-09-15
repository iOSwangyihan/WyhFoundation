//
//  VideoToolboxViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//


import UIKit
enum VideoToolboxViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS6+\n直接使用硬件加速的视频编码和解码功能。"
        case .topics:
            return "VTCompressionSession--管理传入视频数据的压缩的会话对象。\nVTDecompressionSession--一个会话对象，用于管理传入视频数据的解压缩。\nVTPixelTransferSession--一个会话对象，用于将视频数据从源像素缓冲区复制和/或转换到目标像素缓冲区。\nVTSession--抽象对象，提供配置VideoToolbox会话对象的公共接口。\nVTMultiPassStorage--用于存储多通道视频编码元数据的对象。\nVTFrameSilo--存储由多通道压缩会话产生的大量样例缓冲区的对象。\nVideo Encoder List Keys--调用VTCopyVideoEncoderList(_:_:)时使用的字典键。\nError Code Constants--视频工具箱操作错误代码的常量。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class VideoToolboxViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [VideoToolboxViewControllerType.overview, VideoToolboxViewControllerType.topics, VideoToolboxViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? VideoToolboxViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? VideoToolboxViewControllerType ?? VideoToolboxViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = VideoToolboxDemoViewController()
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

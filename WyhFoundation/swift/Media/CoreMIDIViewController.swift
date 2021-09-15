//
//  CoreMIDIViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum CoreMIDIViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4.2+\n与MIDI设备通信，如硬件键盘和合成器。"
        case .topics:
            return "MIDI Services--使用通用MIDI包与硬件通信。\nMIDI System Setup--配置全局MIDI系统。\nMIDI Messages--创建和配置消息。\nMIDI Thru Connection--在源和目的地之间创建贯穿游戏的连接。\nMIDI Networking--创建和管理通过本地网络连接的设备。\nMIDI Drivers--创建驱动程序插件。\nMIDI Capability Inquiry--支持设备的双向发现和配置。\nCVMetalTexture--基于纹理的图像缓冲区，为Metal框架提供源图像数据。\nResult Codes--描述Core Video操作生成的结果代码。\nData Types--Core Video框架使用的通用数据类型。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreMIDIViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreMIDIViewControllerType.overview, CoreMIDIViewControllerType.topics, CoreMIDIViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreMIDIViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreMIDIViewControllerType ?? CoreMIDIViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreMIDIDemoViewController()
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


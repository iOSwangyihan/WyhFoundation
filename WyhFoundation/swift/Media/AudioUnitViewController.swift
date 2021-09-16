//
//  AudioUnitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//




import UIKit
enum AudioUnitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n添加复杂的音频操作和处理功能到您的应用程序。创建音频单元扩展，生成或修改音频在主机应用程序。"
        case .topics:
            return "Audio Component Services--Audio Component Services定义了查找和打开音频单元和音频编解码器的接口。它保留了与OS X v10.5组件接口的二进制兼容性，同时消除了对组件管理器的依赖。\nAudio Unit Component Services--音频单元组件服务提供了使用音频单元的C接口。音频单元是用于处理或生成音频数据的音频处理插件。要查找、打开和关闭音频单元，您可以使用一个配套的接口，音频组件服务，在音频组件服务中描述。音频单元由类型、子类型和制造商ID三组代码唯一标识。参见音频组件服务参考中的AudioComponentDescription结构。\nOutput Audio Unit Services--本文档描述了Output Audio Unit Services, Audio Unit框架中的一个C接口。您可以使用此接口启动和停止I/O音频单元(通常称为输出音频单元)。\nAudio Unit Data Types--Audio Unit框架定义了在整个框架的多个地方使用的通用数据类型。\nAudio Unit Parameters--音频单元参数是一个键，由它所应用的音频单元定义，其对应的值指定可调属性(如音量、音调或滤波器截止频率)的设置。在音频处理过程中，通过您提供的用户界面，用户通常可以改变参数。所有参数值都是相同的数据类型:32位浮点数。定义参数的音频单元还定义了值的含义、默认值和允许的范围。\nAudio Unit Properties--本章描述在AudioUnitProperties.h头文件中声明的类函数宏。您可以使用这些宏来处理音频单元参数的显示类型—由AudioUnitParameterInfo数据结构中的flags字段指定的属性之一。"
        case .demo:
            return "Click here to example"
        }
    }
}
class AudioUnitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AudioUnitViewControllerType.overview, AudioUnitViewControllerType.topics, AudioUnitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AudioUnitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AudioUnitViewControllerType ?? AudioUnitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AudioUnitDemoViewController()
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



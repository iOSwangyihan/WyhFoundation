//
//  CoreAudioKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//




import UIKit
enum CoreAudioKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n添加用户界面到音频单位。"
        case .topics:
            return "AUViewController--为音频单元创建自定义用户界面时要扩展的基类。\nAUAudioUnitViewConfiguration--描述如何呈现音频单元的用户界面的配置对象。\nCABTMIDICentralViewController--一个显示附近基于蓝牙的MIDI外围设备的视图控制器。\nCABTMIDILocalPeripheralViewController--一个将iOS设备宣传为基于蓝牙的MIDI外围设备的视图控制器。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreAudioKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreAudioTypesViewControllerType.overview, CoreAudioTypesViewControllerType.topics, CoreAudioTypesViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreAudioTypesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreAudioTypesViewControllerType ?? CoreAudioTypesViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreAudioTypesDemoViewController()
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



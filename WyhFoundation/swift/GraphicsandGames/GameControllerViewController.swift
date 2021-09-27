//
//  GameControllerViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/27.
//





import UIKit
enum GameControllerViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS7+\n在你的游戏中支持硬件游戏控制器。"
        case .topics:
            return "GCController--真实游戏控制器、虚拟控制器或控制器的快照的表示。\nGCDevice--为游戏输入设备定义公共接口的协议。\nGCVirtualController--一个你专门为你的游戏配置的真实控制器的软件模拟。\nGCVirtualController.Configuration--虚拟控制器的配置信息。\nGCVirtualController.ElementConfiguration--可以自定义的虚拟控制器元素的属性。\nGCControllerElement--物理控制的输入，如按钮或拇指杆。\nGCControllerAxisInput--一种沿轴跟踪运动的控制元件。\nGCControllerButtonInput--一种表示按钮触摸或按下的控制元素。\nGCControllerTouchpad--表示触摸板上的触摸事件的控制元素。\nGCControllerDirectionPad--与方向键或操纵杆相关联的控制元素。\nGCDeviceCursor--光标的控制元素，用作方向键。\nGCExtendedGamepad--支持手柄控制扩展集的配置文件。\nGCDualShockGamepad--支持DualShock 4控制器的控制器配置文件。\nGCMicroGamepad--一个支持Siri Remote的控制器配置文件。\nGCXboxGamepad--支持Xbox控制器的控制器配置文件。\nGCMotion--支持方向和运动的控制器配置文件。\nGCPhysicalInputProfile--支持物理按钮、拇指杆和方向键的控制器配置文件的基类。\nGCEventViewController--一个视图控制器，它决定游戏控制器输入的数据如何被操作系统路由。\nGCMouse--表示连接到设备的物理鼠标的对象。\nGCKeyboard--表示连接到设备的物理键盘的对象。\nGCControllerButtonTouchedChangedHandler--如果控制器支持该特性，当用户触摸按钮时执行的块的签名。\nGCControllerTouchpadHandler--当用户与触摸板交互时执行的块的签名。\nGCKeyboardValueChangedHandler--当键值改变时，键盘输入配置文件调用的块的签名。\nGCMouseMoved--当鼠标移动时，鼠标输入配置文件调用的块的签名。\nGCColor--设备光的颜色。\nGCDeviceBattery--设备电池的充电水平和状态。\nGCDeviceHaptics--游戏控制器上触觉执行器的位置。\nGCDeviceLight--设备上的有色光。\nGCDirectionalGamepad--一种配置文件，它只支持定向垫，不支持移动或旋转。\nGCDualSenseAdaptiveTrigger--封装DualSense自适应触发器特性的类。\nGCDualSenseGamepad--支持DualSense控制器的控制器配置文件。\nGCKeyboardInput--使用键盘作为输入设备的控制器配置文件。\nGCMouseInput--跟踪鼠标输入的控制器配置文件。"
        case .demo:
            return "Click here to example"
        }
    }
}
class GameControllerViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GameControllerViewControllerType.overview, GameControllerViewControllerType.topics, GameControllerViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? GameControllerViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? GameControllerViewControllerType ?? GameControllerViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = GameControllerDemoViewController()
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


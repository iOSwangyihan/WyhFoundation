//
//  CoreBluetoothViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/10.
//


import UIKit
enum CoreBluetoothViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS5+\n与蓝牙低能耗和BR/EDR(“经典”)设备通信。"
        case .topics:
            return "CBCentral--连接到本地应用程序的远程设备，它充当外设。\nCBCentralManager--一个用于扫描、发现、连接和管理外围设备的对象。\nCBCentralManagerDelegate--一种为发现和管理外围设备提供更新的协议。\nCBPeripheral--远程外围设备。\nCBPeripheralDelegate--提供外设服务使用更新的协议。\nCBPeripheralManager--一个对象，用于管理和发布由该应用程序公开的外围服务。\nCBPeripheralManagerDelegate--提供本地外围设备状态更新和与远程中心设备交互的协议。\nCBAttribute--外设提供的服务的公共方面的表示。\nCBAttributePermissions--表示特征值的读、写和加密权限的值。\nCBService--完成设备某一功能或特征的数据和相关行为的集合。\nCBMutableService--具有可写属性值的服务。\nCBCharacteristic--远程外围设备服务的特征。\nCBMutableCharacteristic--本地外围设备服务的特性。\nCBDescriptor--提供有关远程外围设备特性的进一步信息的对象。\nCBMutableDescriptor--提供有关局部外围设备特性的附加信息的对象。\nCBManager--管理中心和外围对象的抽象基类。\nCBATTRequest--使用属性协议(ATT)的请求。\nCBPeer--表示远程设备的对象。\nCBUUID--一个通用的唯一标识符，由蓝牙标准定义。\nCBError--Core Bluetooth在蓝牙事务期间返回的错误。\nCBATTError--当使用属性协议(ATT)时，核心蓝牙返回一个错误。\nNFCISO15693SystemInfo--"
        case .demo:
            return "Click here to example"
        }
    }
}

class CoreBluetoothViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [CoreBluetoothViewControllerType.overview, CoreBluetoothViewControllerType.topics, CoreBluetoothViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreBluetoothViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreBluetoothViewControllerType ?? CoreBluetoothViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreBluetoothDemoViewController()
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









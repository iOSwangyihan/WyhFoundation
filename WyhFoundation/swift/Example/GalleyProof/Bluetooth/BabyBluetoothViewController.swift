//
//  BabyBluetoothViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum BabyBluetoothViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "是一个非常容易使用的蓝牙库, 适用于 iOS 和 Mac OS, 基于原生 CoreBluetooth 框架封装, 可以帮开发者们更简单地使用 CoreBluetooth API, 使用链式方法体, 使得代码更简洁、优雅。iOS蓝牙开发（四）：BabyBluetooth蓝牙库介绍"
        case .topics:
            return "The easiest way to use Bluetooth (BLE )in ios,even bady can use. 简单易用的蓝牙库，基于CoreBluetooth的封装，并兼容ios和mac osx.\n为什么使用它？\n1：基于原生CoreBluetooth框架封装的轻量级的开源库，可以帮你更简单地使用CoreBluetooth API。\n2：CoreBluetooth所有方法都是通过委托完成，代码冗余且顺序凌乱。BabyBluetooth使用block方法，可以重新按照功能和顺序组织代码，并提供许多方法减少蓝牙开发过程中的代码量。\n3:链式方法体，代码更简洁、优雅。\n4:通过channel切换区分委托调用，并方便切换\n5:便利的工具方法\n6:完善的文档，且项目处于活跃状态，不断的更新中\n7:github上star最多的纯Bluetooth类库\n8:包含多种类型的demo和ios蓝牙开发教程\n9:同时支持蓝牙设备中心模式和外设模式（central model and peripheral model）"
        case .demo:
            return "https://github.com/iOSwangyihan/BabyBluetooth"
        }
    }
}
class BabyBluetoothViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BabyBluetoothViewControllerType.overview, BabyBluetoothViewControllerType.topics, BabyBluetoothViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? BabyBluetoothViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? BabyBluetoothViewControllerType ?? BabyBluetoothViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = BabyBluetoothDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
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


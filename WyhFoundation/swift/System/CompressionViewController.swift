//
//  CompressionViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/13.
//

import UIKit
enum CompressionViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS9+\n利用常用的压缩算法进行无损数据压缩。"
        case .topics:
            return "InputFilter--从流中读取输入数据的编码器-解码器。\nOutputFilter--将输出数据写入流的编码器-解码器。\ncompression_stream--一种表示压缩流的结构。\ncompression_status--用于表示流压缩状态的一组值。\ncompression_stream_flags--用于表示流压缩标志的一组值。\ncompression_stream_operation--用于表示流压缩操作的一组值。\ncompression_algorithm--表示压缩算法的值的结构。\nCBAttribute--外设提供的服务的公共方面的表示。\nCBAttributePermissions--表示特征值的读、写和加密权限的值。\nCBService--完成设备某一功能或特征的数据和相关行为的集合。\nCBMutableService--具有可写属性值的服务。\nCBCharacteristic--远程外围设备服务的特征。\nCBMutableCharacteristic--本地外围设备服务的特性。\nCBDescriptor--提供有关远程外围设备特性的进一步信息的对象。\nCBMutableDescriptor--提供有关局部外围设备特性的附加信息的对象。\nCBManager--管理中心和外围对象的抽象基类。\nCBATTRequest--使用属性协议(ATT)的请求。\nCBPeer--表示远程设备的对象。\nCBUUID--一个通用的唯一标识符，由蓝牙标准定义。\nCBError--Core Bluetooth在蓝牙事务期间返回的错误。\nCBATTError--当使用属性协议(ATT)时，核心蓝牙返回一个错误。\nNFCISO15693SystemInfo--"
        case .demo:
            return "Click here to example"
        }
    }
}

class CompressionViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [CompressionViewControllerType.overview, CompressionViewControllerType.topics, CompressionViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CompressionViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CompressionViewControllerType ?? CompressionViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CompressionDemoViewController()
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









//
//  GSSViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/30.
//


import UIKit
enum GSSViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS5+\n进行安全的、经过认证的网络交易。"
        case .topics:
            return "MemoryandContext:\ngss_iov_buffer_desc_struct--矢量I/O缓冲区的结构及其定义的类型。。\ngss_buffer_desc_struct--用于与许多GSS-API函数交换八位元数据流的缓冲区描述符的结构。\ngss_buffer_set_desc_struct--用于管理缓冲区描述符数组的缓冲区集描述符的结构\ngss_channel_bindings_struct--定义通道绑定描述符的结构，该描述符指定用于携带上下文的通信通道。\ngss_OID_desc_struct--OID描述符的结构，它与许多GSS-API函数交换对象标识符\ngss_OID_set_desc_struct--管理OID描述符数组的OID集描述符的结构。"
        case .demo:
            return "Click here to example"
        }
    }
}
class GSSViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GSSViewControllerType.overview, GSSViewControllerType.topics, GSSViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? GSSViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? GSSViewControllerType ?? GSSViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = GSSDemoViewController()
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







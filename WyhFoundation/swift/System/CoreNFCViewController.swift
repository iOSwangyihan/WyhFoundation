//
//  CoreNFCViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/9.
//





import UIKit
enum CoreNFCViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n检测NFC标签，读取包含NDEF数据的消息，并将数据保存到可写标签中。"
        case .topics:
            return "NFCNDEFReaderSession--用于检测NFC数据交换格式(NDEF)标记的读取器会话。\nNFCTagReaderSession--用于检测ISO7816, ISO15693, FeliCa和MIFARE标签的读卡器会话。\nNFCVASReaderSession--用于处理增值服务(VAS)标签的读取器会话。\nNFCReaderSession--抽象基类，表示用于检测NFC标记的读取器会话。\nNFCReaderSessionProtocol--用于与阅读器会话交互的通用接口。\nNFCISO7816Tag--用于与ISO 7816标记交互的接口。\nNFCISO15693Tag--用于与ISO 15693标记交互的接口。\nNFCFeliCaTag--一个与FeliCa™标签交互的界面。\nNFCMiFareTag--一个与MIFARE®标签交互的接口。\nNFCNDEFTag--一个与NDEF标签交互的接口。\nNFCTagCommandConfiguration--用于定义NFC标记命令配置的一组参数。\nNFCNDEFMessage--由有效负载记录数组组成的一种NFC NDEF消息。\nNFCNDEFPayload--NFC NDEF消息中的有效负载记录。\nNFCReaderError--指示读写器会话或标记问题的错误类型。\nNFCFeliCaPollingResponse--\nNFCFeliCaRequestSpecificationVersionResponse--\nNFCFeliCaRequsetServiceV2Response--\nNFCFeliCaStatusFlag--\nNFCISO15693MultipleBlockSecurityStatus--\nNFCISO15693RequestFlag--\nNFCISO15693ResponseFlag--\nNFCISO15693SystemInfo--"
        case .demo:
            return "Click here to example"
        }
    }
}

class CoreNFCViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [CoreNFCViewControllerType.overview, CoreNFCViewControllerType.topics, CoreNFCViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreNFCViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreNFCViewControllerType ?? CoreNFCViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreNFCDemoViewController()
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









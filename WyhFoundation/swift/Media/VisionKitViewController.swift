//
//  VisionKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//



import UIKit
enum VisionKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13\n使用iOS摄像头扫描你在Notes应用中捕捉到的文档。"
        case .topics:
            return "VNDocumentCameraViewController--一个视图控制器，它显示文档摄像机看到的东西。\nVNDocumentCameraViewControllerDelegate--一种委托协议，文档摄像机通过它返回扫描结果。\nVNDocumentCameraScan--在文件照相机中扫描的单个文件。"
        case .demo:
            return "Click here to example"
        }
    }
}
class VisionKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [VisionKitViewControllerType.overview, VisionKitViewControllerType.topics, VisionKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? VisionKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? VisionKitViewControllerType ?? VisionKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = VisionKitDemoViewController()
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

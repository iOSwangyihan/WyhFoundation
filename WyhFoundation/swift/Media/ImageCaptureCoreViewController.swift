//
//  ImageCaptureCoreViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum ImageCaptureCoreViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n浏览媒体设备，并从您的应用程序以编程方式控制它们。"
        case .topics:
            return "ICDeviceBrowser--用于寻找数码相机和扫描仪。\nICCameraDevice--一个表示摄像机的对象。\nICCameraDeviceDelegate--用于检测摄像机、获取元数据和缩略图、处理访问和能力更改以及在连接的摄像机上执行其他操作的方法。\nICCameraItem--表示相机项的抽象类。\nICCameraFile--表示摄像机上的文件的对象。\nICCameraFolder--表示摄像机上的文件夹的对象。\nICReturn--从ImageCaptureCore返回一个错误。\nICLegacyReturn--ImageCaptureCore返回一个遗留错误。\nICReturnConnectionError--从ImageCaptureCore返回一个连接错误。\nICReturnDownloadError--从ImageCaptureCore返回一个下载错误。\nICReturnMetadataError--从ImageCaptureCore返回的元数据错误。\nICReturnObjectError--从ImageCaptureCore返回一个对象错误。\nICReturnPTPDeviceError--从ImageCaptureCore返回一个PTP设备错误。\nICReturnThumbnailError--从ImageCaptureCore返回的缩略图错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class ImageCaptureCoreViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ImageCaptureCoreViewControllerType.overview, ImageCaptureCoreViewControllerType.topics, ImageCaptureCoreViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ImageCaptureCoreViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ImageCaptureCoreViewControllerType ?? ImageCaptureCoreViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ImageCaptureCoreDemoViewController()
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


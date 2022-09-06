//
//  EFQRCodeViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

enum EFQRCodeViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "快速生成炫酷的二维码."
        case .topics:
            return "EFQRCode is a lightweight, pure-Swift library for generating stylized QRCode images with watermark or icon, and for recognizing QRCode from images, inspired by qrcode. Based on CoreGraphics, CoreImage, and ImageIO, EFQRCode provides you a better way to handle QRCode in your app, no matter if it is on iOS, macOS, watchOS, and/or tvOS. You can integrate EFQRCode through CocoaPods, Carthage, and/or Swift Package Manager."
        case .demo:
            return "https://github.com/iOSwangyihan/EFQRCode"
        }
    }
}
class EFQRCodeViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [EFQRCodeViewControllerType.overview, EFQRCodeViewControllerType.topics, EFQRCodeViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? EFQRCodeViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? EFQRCodeViewControllerType ?? EFQRCodeViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = EFQRCodeDemoViewController()
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


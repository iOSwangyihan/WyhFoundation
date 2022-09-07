//
//  GPUImage2swiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//



import UIKit

enum GPUImage2swiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Swift 版基于 GPU 图像和视频处理框架库"
        case .topics:
            return "GPUImage 2 is the second generation of the GPUImage framework, an open source project for performing GPU-accelerated image and video processing on Mac, iOS, and now Linux. The original GPUImage framework was written in Objective-C and targeted Mac and iOS, but this latest version is written entirely in Swift and can also target Linux and future platforms that support Swift code.\nThe objective of the framework is to make it as easy as possible to set up and perform realtime video processing or machine vision against image or video sources. By relying on the GPU to run these operations, performance improvements of 100X or more over CPU-bound code can be realized. This is particularly noticeable in mobile or embedded devices. On an iPhone 4S, this framework can easily process 1080p video at over 60 FPS. On a Raspberry Pi 3, it can perform Sobel edge detection on live 720p video at over 20 FPS."
        case .demo:
            return "https://github.com/iOSwangyihan/GPUImage2"
        }
    }
}
class GPUImage2swiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GPUImage2swiftViewControllerType.overview, GPUImage2swiftViewControllerType.topics, GPUImage2swiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? GPUImage2swiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? GPUImage2swiftViewControllerType ?? GPUImage2swiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = GPUImage2swiftDemoViewController()
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

